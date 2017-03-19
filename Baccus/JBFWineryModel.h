//
//  JBFWineryModel.h
//  Baccus
//
//  Created by Jonathan Batlle on 9/24/16.
//  Copyright © 2016 JBF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JBFWineModel.h"

#define RED_WINE_KEY    @"Tinto"
#define WHITE_WINE_KEY  @"Blanco"
#define OTHER_WINE_KEY  @"Rosado"

@interface JBFWineryModel : NSObject

@property (readonly, nonatomic) NSInteger redWineCount;
@property (readonly, nonatomic) NSInteger whiteWineCount;
@property (readonly, nonatomic) NSInteger otherWineCount;

-(JBFWineModel *) redWineAtIndex: (NSUInteger) index;
-(JBFWineModel *) whiteWineAtIndex: (NSUInteger) index;
-(JBFWineModel *) otherWineAtIndex: (NSUInteger) index;

@end
