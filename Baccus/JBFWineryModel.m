//
//  JBFWineryModel.m
//  Baccus
//
//  Created by Jonathan Batlle on 9/24/16.
//  Copyright © 2016 JBF. All rights reserved.
//

#import "JBFWineryModel.h"

@interface JBFWineryModel ()

@property (strong, nonatomic) NSArray *redWines;
@property (strong, nonatomic) NSArray *whiteWines;
@property (strong, nonatomic) NSArray *otherWines;

@end

@implementation JBFWineryModel

# pragma mark - Properties

-(NSInteger) redWineCount{
    return [[self redWines]count];
}

-(NSInteger) whiteWineCount{
    return [[self whiteWines]count];
}

-(NSInteger) otherWineCount{
    return [[self otherWines]count];
}

-(id) init{
    
    if (self = [super init]) {
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
        
        [self setRedWines:@[tintorro]];
        [self setWhiteWines:@[albarinho]];
        [self setOtherWines:@[champagne]];
        
    }
    
    return self;
}

-(JBFWineModel *) redWineAtIndex: (NSUInteger) index{
    return [[self redWines]objectAtIndex:index];
}

-(JBFWineModel *) whiteWineAtIndex: (NSUInteger) index{
    return [[self whiteWines]objectAtIndex:index];
}

-(JBFWineModel *) otherWineAtIndex: (NSUInteger) index{
    return [[self otherWines]objectAtIndex:index];
}

@end
