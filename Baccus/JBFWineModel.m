//
//  JBFWineModel.m
//  Baccus
//
//  Created by Jonathan on 12/30/15.
//  Copyright © 2015 JBF. All rights reserved.
//

#import "JBFWineModel.h"

@implementation JBFWineModel

#pragma mark - Class Constructors

+(id)wineWithName: (NSString *)name
             type: (NSString *)type
            photo:(UIImage *)photo
       companyWeb:(NSURL *)wineCompanyWeb
            notes:(NSString *)notes
           origin:(NSString *)origin
           rating:(int)rating
           grapes:(NSArray *)grapes
      companyName:(NSString *)wineCompanyName{
    
    return [[JBFWineModel alloc]initWithName:name type:type photo:photo companyWeb:wineCompanyWeb notes:notes origin:origin rating:rating grapes:grapes companyName:wineCompanyName];
}

+(id)wineWithName: (NSString *)name
      companyName:(NSString *)wineCompanyName
             type:(NSString *)type
           origin:(NSString *)origin{
    
    return [[JBFWineModel alloc]initWithName:name companyName:wineCompanyName type:type origin:origin];
}


#pragma mark - Initializers

-(id)initWithName: (NSString *)name
             type: (NSString *)type
            photo:(UIImage *)photo
       companyWeb:(NSURL *)wineCompanyWeb
            notes:(NSString *)notes
           origin:(NSString *)origin
           rating:(int)rating
           grapes:(NSArray *)grapes
      companyName:(NSString *)wineCompanyName{
    
    if (self = [super init]){
        _name=name;
        _type=type;
        _photo=photo;
        _wineCompanyWeb=wineCompanyWeb;
        _notes=notes;
        _origin=origin;
        _rating=rating;
        _grapes=grapes;
        _wineCompanyName=wineCompanyName;
    }
    
    return self;
}

-(id)initWithName: (NSString *)name
      companyName:(NSString *)wineCompanyName
             type:(NSString *)type
           origin:(NSString *)origin{
    
    return[self initWithName:name type:type photo:nil companyWeb:nil notes:@"" origin:origin rating:NO_RATING grapes:nil companyName:wineCompanyName];
}

@end
