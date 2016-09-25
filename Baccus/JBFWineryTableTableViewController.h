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

@interface JBFWineryTableTableViewController : UITableViewController

@property (nonatomic,strong) JBFWineryModel *model;

-(id) initWithModel: (JBFWineryModel *) model
              style:(UITableViewStyle)style;

@end
