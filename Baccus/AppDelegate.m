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

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    JBFWineModel *tintorro = [JBFWineModel wineWithName:@"Bembibre"
                                                   type:@"tinto"
                                                  photo:[UIImage imageNamed:@"bembibre.jpg"]
                                             companyWeb:[NSURL URLWithString:@"http://www.avgvstvsforvm.com"]
                                                  notes:@"Agregue aqui su comentario sobre el vino."
                                                 origin:@"El Bierzo"
                                                 rating:5
                                                 grapes:@[@"Menzia",@"Garnatxa"]
                                            companyName:@"Dominio de Tares"];
    
    JBFWineModel *albarinho = [JBFWineModel wineWithName:@"Zarate"
                                                   type:@"blanco"
                                                  photo:[UIImage imageNamed:@"zarate.gif"]
                                             companyWeb:[NSURL URLWithString:@"http://www.google.es"]
                                                  notes:@"Agregue aqui su comentario sobre el vino."
                                                 origin:@"El Bierzo"
                                                 rating:5
                                                 grapes:@[@"Menzia",@"Garnatxa"]
                                            companyName:@"Dominio de Tares"];
    
    JBFWineModel *champagne = [JBFWineModel wineWithName:@"Champange"
                                                   type:@"Otros"
                                                  photo:[UIImage imageNamed:@"comtesDeChampagne.jpg"]
                                             companyWeb:[NSURL URLWithString:@"http://www.freixenet.es"]
                                                  notes:@"Agregue aqui su comentario sobre el vino."
                                                 origin:@"El Bierzo"
                                                 rating:5
                                                 grapes:@[@"Menzia",@"Garnatxa"]
                                            companyName:@"Dominio de Tares"];
    
    // Creamos los controladores
    //JBFWineViewController *wineVC = [[JBFWineViewController alloc]initWithModel:tintorro];
    //JBFWebViewController *webVC =[[JBFWebViewController alloc]initWithModel:tintorro];
    JBFWineViewController *tintoVC = [[JBFWineViewController alloc]initWithModel:tintorro];
    JBFWineViewController *blancoVC = [[JBFWineViewController alloc]initWithModel:albarinho];
    JBFWineViewController *champagneVC = [[JBFWineViewController alloc]initWithModel:champagne];
    
    // Creamos un combinador
    UINavigationController *tintoNav = [[UINavigationController alloc]initWithRootViewController:tintoVC];
    UINavigationController *blancoNav = [[UINavigationController alloc]initWithRootViewController:blancoVC];
    UINavigationController *champagneNav = [[UINavigationController alloc]initWithRootViewController:champagneVC];
    
    UITabBarController *tabVC = [[UITabBarController alloc]init];
    [tabVC setViewControllers:@[tintoNav,blancoNav,champagneNav]];
    
    
    /*
    UITabBarController *tabVC = [[UITabBarController alloc]init];
    [tabVC setViewControllers:@[wineVC,webVC]];
     */
    
    [[self window]setRootViewController:tabVC];
    
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
