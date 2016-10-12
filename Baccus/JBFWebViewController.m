//
//  JBFWebViewController.m
//  Baccus
//
//  Created by Jonathan Batlle on 9/17/16.
//  Copyright © 2016 JBF. All rights reserved.
//

#import "JBFWebViewController.h"
#import "JBFWineryTableViewController.h"

@interface JBFWebViewController ()

@end

@implementation JBFWebViewController

-(id) initWithModel:(JBFWineModel *)model{
    if(self = [super initWithNibName:nil
                              bundle:nil]){
        _model=model;
        [self setTitle:@"Web"];
    }
    return self;
}

-(void) viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
    // Baja de la notificacion
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self displayURL: [[self model]wineCompanyWeb]];
    
    // Alta notificacion
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    // @Selector serveix per passar del nom del missatge al numero o codi que realment s'envia en ObjectiveC quan s'envia un missatge. Objective C esta muntat aixi a la hora de enviar missatges, no s'envia el nom si no que lo que s'envia es el numero corresponent a aquell missatge.
    // Sempre que es passa el nom de un misstge per argument sempre s'ha de fer a traves del selector.
    [nc addObserver:self
           selector:@selector(wineDidChange:)
               name:NEW_WINE_NOTIFICATION_NAME
             object:nil];
}

-(void) wineDidChange: (NSNotification *) notification{
    NSDictionary *dict = [notification userInfo];
    JBFWineModel *newWine = [dict objectForKey:WINE_KEY];
    
    // Actualizamos el modelo
    [self setModel:newWine];
    [self displayURL:[[self model]wineCompanyWeb]];
}

#pragma mark - UIWebViewDelegate

-(void) webViewDidFinishLoad:(UIWebView *)webView{
    [[self activityView]stopAnimating];
    [[self activityView]setHidden:YES];
}

#pragma mark - Utils

-(void) displayURL: (NSURL *) url{
    [[self browser]setDelegate:self];
    [[self activityView]setHidden:FALSE];
    [[self activityView] startAnimating];
    [[self browser]loadRequest:[NSURLRequest requestWithURL:url]];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
