//
//  JBFWineryModel.m
//  Baccus
//
//  Created by Jonathan Batlle on 9/24/16.
//  Copyright © 2016 JBF. All rights reserved.
//

#import "JBFWineryModel.h"

@interface JBFWineryModel ()

@property (strong, nonatomic) NSMutableArray *redWines;
@property (strong, nonatomic) NSMutableArray *whiteWines;
@property (strong, nonatomic) NSMutableArray *otherWines;

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
        
        // Metodo del tutorial "deprecated", el nuevo modo de hacerlo es el siguiente.
        [self getRequest:@"action" withHandler:^(NSData *data, NSURLResponse *response, NSError *error){
            if(data!=nil){
                NSArray *JSONObjects = [NSJSONSerialization JSONObjectWithData:data
                                                                       options:kNilOptions
                                                                         error:&error];
                if(JSONObjects != nil){
                    for(NSDictionary *dict in JSONObjects){
                        JBFWineModel *wine = [[JBFWineModel alloc]initWithDictionary:dict];
                        
                        // Añadimos el tipo de vino adecuado
                        if([[wine type] isEqualToString:RED_WINE_KEY]){
                            if(![self redWines])
                                [self setRedWines:[NSMutableArray arrayWithObject:wine]];
                            else
                                [[self redWines]addObject:wine];
                        }
                        else if([[wine type] isEqualToString:WHITE_WINE_KEY]){
                            if(![self whiteWines])
                                [self setWhiteWines:[NSMutableArray arrayWithObject:wine]];
                            else
                                [[self whiteWines]addObject:wine];
                        }
                        else{
                            if(![self otherWines])
                                [self setOtherWines:[NSMutableArray arrayWithObject:wine]];
                            else
                                [[self otherWines]addObject:wine];
                        }
                    }
                }
                else{
                    // Se ha producido un error al parsear el JSON
                    NSLog(@"Error al parsear el JSON: %@", [error localizedDescription]);
                }
            }
            else{
                // Error al descargar los datos del servidor
                NSLog(@"Error al descargar el JSON: %@", [error localizedDescription]);
            }
            
        }];
        
        /*
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
        */
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

#pragma mark - Connection managing functions

-(void) getRequest:(NSString *)action withHandler: (void (^)(NSData *data, NSURLResponse *response, NSError *error))myBlock{
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://baccusapp.herokuapp.com/wines"]];
    [[[NSURLSession sharedSession]dataTaskWithRequest:request
                                    completionHandler:myBlock]resume];
}



@end
