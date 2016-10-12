//
//  JBFWineViewController.m
//  Baccus
//
//  Created by Jonathan on 12/31/15.
//  Copyright © 2015 JBF. All rights reserved.
//

#import "JBFWineViewController.h"
#import "JBFWebViewController.h"

@implementation JBFWineViewController

#pragma mark - Initializers

-(id)initWithModel: (JBFWineModel *)model{
    
    /*
     El xib es un fitxer xml que indica la jerarquia de las views. El nib es un fichero binario que se usaba en NeXT Step para la misma función. De hecho un xib cuando se compila se transforma en un nib ya que trabajar con ficheros nib es más rápido.
     */
    
    //La funcion initWithNibName:bundle pide dos argumentos, el primero es el nombre del xib/nib y el segundo es ek nombre del bundle donde se encuentra ese xib. Un bundle no es nada mas que una carpeta que agrupa una serie de ficheros con algo en comun.
    
    if (self=[super initWithNibName:nil bundle:nil]) {
        _model=model;
        [self setTitle:[model name]];
    }
    
    return self;
}

-(id)initWithNibName:(NSString *)nibNameOrNil
              bundle:(NSBundle *)nibBundleOrNil{
    
    self = [super initWithNibName: nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

#pragma mark - Controller functions

//Esta funcion se debe añadir, la plantilla no la añade. Se usa para sincronizar el modelo y la vista.
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self syncModelWithView];
    
    [[[self navigationController]navigationBar]setTintColor:[UIColor colorWithRed:0.5
                                                                           green:0
                                                                            blue:0.13
                                                                           alpha:1]];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

-(IBAction)displayWeb:(id)sender{
    //NSLog(@"Display web %@",[[self model]wineCompanyWeb]);
    // Crear un WebVC
    JBFWebViewController *webVC = [[JBFWebViewController alloc]initWithModel:[self model]];
    
    // Hacemos un push
    [[self navigationController]pushViewController:webVC animated:YES];
    
}

#pragma mark - Utils

-(void)syncModelWithView{
    
    [[self nameLabel]setText:[[self model]name]];
    [[self typeLabel]setText:[[self model]type]];
    [[self originLabel]setText:[[self model]origin]];
    [[self notesLabel]setText:[[self model]notes]];
    [[self wineryNameLabel]setText:[[self model]wineCompanyName]];
    [[self photoView]setImage:[[self model]photo]];
    [[self grapesLabel]setText:[self arrayToString:[[self model]grapes]]];
    
    [self displayRating:[[self model]rating]];
    [[self notesLabel]setNumberOfLines:0];
}

-(void) displayRating:(int)rating{
    
    [self clearRating];
    
    UIImage *glass = [UIImage imageNamed:@"splitView_score_glass"];
    
    for (int i=0; i<rating; i++) {
        [[[self ratingViews]objectAtIndex:i]setImage:glass];
    }
}

-(void)clearRating{
    for (UIImageView *imgView in [self ratingViews]) {
        [imgView setImage:nil];
    }
}

-(NSString *)arrayToString:(NSArray *)array{
    
    NSString *representation=nil;
    
    if ([array count]==1) {
        representation=[@"100% " stringByAppendingString:[array lastObject]];
    }
    else{
        representation=[[array componentsJoinedByString:@", "]stringByAppendingString:@"."];
    }
    return representation;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - UISplitViewControllerDelegate

-(void)splitViewController:(UISplitViewController *)svc willChangeToDisplayMode:(UISplitViewControllerDisplayMode)displayMode{
    if(displayMode==UISplitViewControllerDisplayModePrimaryHidden){
        [[self navigationItem]setLeftBarButtonItem:[svc displayModeButtonItem]];
    }
}

@end
