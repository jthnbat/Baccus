//
//  JBFWineViewController.h
//  Baccus
//
//  Created by Jonathan on 12/31/15.
//  Copyright © 2015 JBF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JBFWineModel.h"

@interface JBFWineViewController : UIViewController

//IBOutlet significa Interface Builder Outlet y no es nada mas que un puntero a void. Sirve para indicar al compilador que la view esta definida en el xib.
@property (weak,nonatomic) IBOutlet UILabel *nameLabel;
@property (weak,nonatomic) IBOutlet UILabel *wineryNameLabel;
@property (weak,nonatomic) IBOutlet UILabel *typeLabel;
@property (weak,nonatomic) IBOutlet UILabel *originLabel;
@property (weak,nonatomic) IBOutlet UILabel *grapesLabel;
@property (weak,nonatomic) IBOutlet UILabel *notesLabel;
@property (weak,nonatomic) IBOutlet UIImageView *photoView;

@property (strong,nonatomic) IBOutletCollection(UIImageView) NSArray *ratingViews;

@property (strong,nonatomic) JBFWineModel *model;

-(id)initWithModel: (JBFWineModel *)model;

-(IBAction)displayWeb:(id)sender;

@end
