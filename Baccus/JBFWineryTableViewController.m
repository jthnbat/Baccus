//
//  JBFWineryTableViewController.m
//  Baccus
//
//  Created by Jonathan Batlle on 9/25/16.
//  Copyright © 2016 JBF. All rights reserved.
//

#import "JBFWineryTableViewController.h"
#import "JBFWineViewController.h"

@interface JBFWineryTableViewController ()

@end

@implementation JBFWineryTableViewController

-(id) initWithModel: (JBFWineryModel *) model
              style:(UITableViewStyle)style{
    if (self = [super initWithStyle:style]) {
        _model=model;
        [self setTitle:@"Baccus"];
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

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[[self navigationController]navigationBar]setTintColor:[UIColor colorWithRed:0.5
                                                                            green:0
                                                                             blue:0.13
                                                                            alpha:1]];
}

#pragma mark - JBFWineryTAbleViewControllerDelegate

-(void) wineryTableViewController:(JBFWineryTableViewController *)wineryVC
                    didSelectWine:(JBFWineModel *)wine{
    // Crea el controlador
    JBFWineViewController *wineVC = [[JBFWineViewController alloc]initWithModel:wine];
    
    [[self navigationController]pushViewController:wineVC animated:YES];
}

#pragma mark - Table view data source

-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if(section == RED_WINE_SECTION){
        return @"Red wine";
    }
    
    else if(section == WHITE_WINE_SECTION){
        return @"White wine";
    }
    
    else{
        return @"Other wine";
    }
}

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

-(JBFWineModel *) wineForIndexPath:(NSIndexPath *)indexPath{
    
    // Averiguamos de que vino se trata.
    JBFWineModel *wine = nil;
    
    if ([indexPath section] == RED_WINE_SECTION) {
        wine = [[self model]redWineAtIndex:[indexPath row]];
    }
    else if ([indexPath section] == WHITE_WINE_SECTION){
        wine = [[self model]whiteWineAtIndex:[indexPath row]];
    }
    else{
        wine = [[self model]otherWineAtIndex:[indexPath row]];
    }
    
    return wine;
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
    
    [[self delegate]wineryTableViewController:self didSelectWine:wine];
    
    // Notificacion
    // @{algo:algo} serveix per cread "diccionaris"
    NSNotification *n = [NSNotification notificationWithName:NEW_WINE_NOTIFICATION_NAME
                                                      object:self
                                                    userInfo:@{WINE_KEY: wine}];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:[n name]
                                                       object:nil];
    
    /*
    // Creamos un controlador para dicho vino
    JBFWineViewController *wineVC = [[JBFWineViewController alloc]initWithModel:wine];
    
    // Hacemos un push al navigation controller dentro del cual estamos
    [[self navigationController]pushViewController:wineVC animated:YES];
    */
    
    // Guardamos el ultimo vino seleccionado para recuperarlo luego.
    [self saveLastSelectedWineAtSection:[indexPath section] row:[indexPath row]];
}

#pragma mark NSUserDefaults

- (NSDictionary *)setDefaults{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    //Por defecto mostraremos uno de los tintos
    NSDictionary *defaultWineCoords = @{SECTION_KEY : @(RED_WINE_SECTION), ROW_KEY : @0};
    
    // Lo asignamos
    [defaults setObject:defaultWineCoords
                 forKey:LAST_WINE_KEY];
    
    // Guardamos por si acaso
    [defaults synchronize];
    
    return defaultWineCoords;
}

-(void) saveLastSelectedWineAtSection:(NSUInteger)section row:(NSUInteger)row{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@{SECTION_KEY : @(section),
                          ROW_KEY : @(row)}
                 forKey:LAST_WINE_KEY];
    
    // Por si acaso se sincroniza para no perder nada.
    [defaults synchronize];
}

-(JBFWineModel *)lastSelectedWine{
    NSIndexPath *indexPath = nil;
    NSDictionary *coords = nil;
    
    coords = [[NSUserDefaults standardUserDefaults]objectForKey:LAST_WINE_KEY];
    
    if (coords == nil) {
        // No hay nada bajo la clave LAST_WINE_KEY.
        // Esto quiere decir que es la primera vez que se llama a la App.
        // Ponemos un valor por defecto: el primero de los tintos.
        coords = [self setDefaults];
    }
    
    else{
        // Ya hay algo, es decir, en algun momento se guardó.
        // No hay nada en especial que hacer.
    }
    
    // Transformamos las coordenadas en un indexpath.
    indexPath = [NSIndexPath indexPathForRow:[[coords objectForKey:ROW_KEY] integerValue]
                                   inSection:[[coords objectForKey:SECTION_KEY] integerValue]];
    
    return [self wineForIndexPath: indexPath];
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
