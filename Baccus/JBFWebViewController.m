//
//  JBFWebViewController.m
//  Baccus
//
//  Created by Jonathan Batlle on 9/17/16.
//  Copyright © 2016 JBF. All rights reserved.
//

#import "JBFWebViewController.h"

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

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self displayURL: [[self model]wineCompanyWeb]];
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
