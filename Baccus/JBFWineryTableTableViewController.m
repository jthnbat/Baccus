//
//  JBFWineryTableTableViewController.m
//  Baccus
//
//  Created by Jonathan Batlle on 9/25/16.
//  Copyright © 2016 JBF. All rights reserved.
//

#import "JBFWineryTableTableViewController.h"
#import "JBFWineViewController.h"

@interface JBFWineryTableTableViewController ()

@end

@implementation JBFWineryTableTableViewController

-(id) initWithModel: (JBFWineryModel *) model
              style:(UITableViewStyle)style{
    if (self = [super initWithStyle:style]) {
        _model=model;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == RED_WINE_SECTION) {
        return [[self model] redWineCount];
    }
    else if(section == WHITE_WINE_SECTION){
        return [[self model]whiteWineCount];
    }
    else if(section == OTHER_WINE_SECTION){
        return [[self model]otherWineCount];
    }
    else
        return -1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        
        // Si no hay celda hay que crearla a mano
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    // Averiguar de que modelo nos estan hablando
    JBFWineModel *wine = nil;
    if ([indexPath section] == RED_WINE_SECTION) {
        wine = [[self model]redWineAtIndex:[indexPath row]];
    }
    
    else if([indexPath section] == WHITE_WINE_SECTION){
        wine = [[self model]whiteWineAtIndex:[indexPath row]];
    }
    
    else{
        wine = [[self model]otherWineAtIndex:[indexPath row]];
    }
    
    // Sincronizar celda (vista) y modelo (vino)
    [[cell imageView]setImage:[wine photo]];
    [[cell textLabel]setText:[wine name]];
    [[cell detailTextLabel]setText:[wine wineCompanyName]];
    
    return cell;
}

#pragma mark - Table view delegate

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // Suponemos que estamos en un navigation controller
    // Averiguamos de que vino se trata
    JBFWineModel *wine = nil;
    
    if ([indexPath section] == RED_WINE_SECTION) {
        wine = [[self model]redWineAtIndex:[indexPath row]];
    }
    
    else if ([indexPath section] == WHITE_WINE_SECTION){
        wine = [[self model]whiteWineAtIndex:[indexPath row]];
    }
    
    else if ([indexPath section] == OTHER_WINE_SECTION){
        wine = [[self model]otherWineAtIndex:[indexPath row]];
    }
    
    // Creamos un controlador para dicho vino
    JBFWineViewController *wineVC = [[JBFWineViewController alloc]initWithModel:wine];
    
    // Hacemos un push al navigation controller dentro del cual estamos
    [[self navigationController]pushViewController:wineVC animated:YES];
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
