//
//  JBFWineModel.h
//  Baccus
//
//  Created by Jonathan on 12/30/15.
//  Copyright © 2015 JBF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define NO_RATING -1

@interface JBFWineModel : NSObject

@property (strong,nonatomic) NSString *type;
@property (strong,nonatomic) UIImage *photo;
@property (strong,nonatomic) NSURL *wineCompanyWeb;
@property (strong,nonatomic) NSString *notes;
@property (strong,nonatomic) NSString *origin;
@property (nonatomic) int rating;
@property (strong,nonatomic) NSArray *grapes;
@property (strong,nonatomic) NSString *name;
@property (strong,nonatomic) NSString *wineCompanyName;

//Class Constructors (son funcions de clase, no hace falta reservar memoria o crear la clase para verlos, son como el static de java)
+(id)wineWithName: (NSString *)name
             type: (NSString *)type
            photo:(UIImage *)photo
       companyWeb:(NSURL *)wineCompanyWeb
            notes:(NSString *)notes
           origin:(NSString *)origin
           rating:(int)rating
           grapes:(NSArray *)grapes
      companyName:(NSString *)wineCompanyName;

+(id)wineWithName: (NSString *)name
      companyName:(NSString *)wineCompanyName
             type:(NSString *)type
           origin:(NSString *)origin;


//Initializers
-(id)initWithName: (NSString *)name
             type: (NSString *)type
            photo:(UIImage *)photo
       companyWeb:(NSURL *)wineCompanyWeb
            notes:(NSString *)notes
           origin:(NSString *)origin
           rating:(int)rating
           grapes:(NSArray *)grapes
      companyName:(NSString *)wineCompanyName;

-(id)initWithName: (NSString *)name
      companyName:(NSString *)wineCompanyName
             type:(NSString *)type
           origin:(NSString *)origin;


@end
