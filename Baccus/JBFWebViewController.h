//
//  JBFWebViewController.h
//  Baccus
//
//  Created by Jonathan Batlle on 9/17/16.
//  Copyright © 2016 JBF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JBFWineModel.h"

@interface JBFWebViewController : UIViewController <UIWebViewDelegate>

@property (strong, nonatomic) JBFWineModel *model;
@property (weak, nonatomic) IBOutlet UIWebView *browser;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityView;

-(id) initWithModel: (JBFWineModel *) model;


@end
