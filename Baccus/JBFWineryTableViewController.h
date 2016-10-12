//
//  JBFWineryTableTableViewController.h
//  Baccus
//
//  Created by Jonathan Batlle on 9/25/16.
//  Copyright © 2016 JBF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JBFWineryModel.h"

#define RED_WINE_SECTION 0
#define WHITE_WINE_SECTION 1
#define OTHER_WINE_SECTION 2
#define NEW_WINE_NOTIFICATION_NAME @"newWine"
#define WINE_KEY @"wine"

// @class sirve para que el compilador entienda que esto es una clase y que si hay algo que encuentra que todavia no esta definido se espere al final para compilar.
// Es muy recomendable no importar en el .h librerias que hayamos definido nosotros para evitar una importacion circular. Es recomendable poner @class y luego en el .m importar las clases necesarias.
@class JBFWineryTableViewController;

@protocol WineryTableViewControllerDelegate <NSObject>

-(void) wineryTableViewController: (JBFWineryTableViewController *)wineryVC
                    didSelectWine: (JBFWineModel *) wine;

@end

@interface JBFWineryTableViewController : UITableViewController

@property (nonatomic,strong) JBFWineryModel *model;
@property (nonatomic,weak) id<WineryTableViewControllerDelegate> delegate;

-(id) initWithModel: (JBFWineryModel *) model
              style:(UITableViewStyle)style;

@end
