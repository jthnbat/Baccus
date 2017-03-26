//
//  AppDelegate.m
//  Baccus
//
//  Created by Jonathan on 12/30/15.
//  Copyright © 2015 JBF. All rights reserved.
//

#import "AppDelegate.h"
#import "JBFWineModel.h"
#import "JBFWineViewController.h"
#import "JBFWebViewController.h"
#import "JBFWineryModel.h"
#import "JBFWineryTableViewController.h"
#import "Baccus-Prefix.pch"

@implementation AppDelegate

-(UIViewController *)rootViewControllerForPhoneWithModel: (JBFWineryModel *) aModel{
    // Controladores
    JBFWineryTableViewController *wineryVC = [[JBFWineryTableViewController alloc]initWithModel:aModel style:UITableViewStylePlain];
    
    // Combinador
    UINavigationController *wineryNav = [[UINavigationController alloc]initWithRootViewController:wineryVC];
    
    // Delegados
    [wineryVC setDelegate:wineryVC];
    return wineryNav;
}

-(UIViewController *)rootViewControllerForPadWithModel: (JBFWineryModel *) aModel{
    // Creamos los controladores
    JBFWineryTableViewController *wineryVC = [[JBFWineryTableViewController alloc]initWithModel:aModel style:UITableViewStylePlain];
    JBFWineViewController *wineVC = [[JBFWineViewController alloc]initWithModel:[wineryVC lastSelectedWine]];
    
    // Creamos los navigation
    UINavigationController *wineryNav = [[UINavigationController alloc]initWithRootViewController:wineryVC];
    UINavigationController *wineNav = [[UINavigationController alloc]initWithRootViewController:wineVC];
    
    
    // Creamos el combinador: SplitView
    UISplitViewController *splitVC = [[UISplitViewController alloc]init];
    
    [splitVC setViewControllers:@[wineryNav,wineNav]];
    [splitVC setDelegate:wineVC];
    [wineryVC setDelegate:wineVC];
    
    [[self window]setRootViewController:splitVC];
    
    return splitVC;
}

- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    JBFWineryModel *winery = [[JBFWineryModel alloc]init];
    //Configuramos controladores, combindores y delegados segun el tipo de dispositivo
    UIViewController *rootVC = nil;
    if (!(IS_IPHONE)) {
        rootVC = [self rootViewControllerForPadWithModel:winery];
    }
    else {
        rootVC = [self rootViewControllerForPhoneWithModel:winery];
    }
    [[self window]setRootViewController:rootVC];
    
    self.window.backgroundColor = [UIColor orangeColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
