//
//  JBFWineModel.m
//  Baccus
//
//  Created by Jonathan on 12/30/15.
//  Copyright © 2015 JBF. All rights reserved.
//

#import "JBFWineModel.h"

@implementation JBFWineModel

// Cuando creas una propiedad de solo lectura e implementas un getter pesonalizado,
// como estamos haciendo con photo, el compilador da por hecho que no vas a necesitar la variable de instancia. En este caso no es asi,
// y si que se necesita la variable de instancia, asi que hay que obligarle a que la incluya. Esto se hace con la linia @synthesize, con la
// que indicamos que queremos una propiedad llamada photo con una variable de instancia llamada _photo. En la inmensa mayoria de casos
// esto es opcional.
// Más info en http://www.cocoaosx.com/2012/12/04/auto-synthesize-property-reglas-excepciones/

@synthesize photo = _photo;

#pragma mark - Properties
-(UIImage *)photo{
    
    // Este trozo de codigo va a bloquear la app hasta que la imagen no se decargue asi que deberia de hacerse en segundo plano
    // para evitar el bloqueo de la app.
    if(_photo == nil){
        _photo = [UIImage imageWithData:[NSData dataWithContentsOfURL:[self photoURL]]];
    }
    return _photo;
}

#pragma mark - Class Constructors

+(id)wineWithName: (NSString *)name
             type: (NSString *)type
       companyWeb:(NSURL *)wineCompanyWeb
            notes:(NSString *)notes
           origin:(NSString *)origin
           rating:(int)rating
           grapes:(NSArray *)grapes
         photoURL:(NSURL *)photoURL
      companyName:(NSString *)wineCompanyName{
    
    return [[JBFWineModel alloc]initWithName:name
                                        type:type
                                  companyWeb:wineCompanyWeb
                                       notes:notes
                                      origin:origin
                                      rating:rating
                                      grapes:grapes
                                 companyName:wineCompanyName
                                    photoURL:photoURL];
}

+(id)wineWithName: (NSString *)name
      companyName:(NSString *)wineCompanyName
             type:(NSString *)type
           origin:(NSString *)origin{
    
    return [[JBFWineModel alloc]initWithName:name
                                 companyName:wineCompanyName
                                        type:type
                                      origin:origin];
}


#pragma mark - Initializers

-(id)initWithName: (NSString *)name
             type: (NSString *)type
       companyWeb:(NSURL *)wineCompanyWeb
            notes:(NSString *)notes
           origin:(NSString *)origin
           rating:(int)rating
           grapes:(NSArray *)grapes
      companyName:(NSString *)wineCompanyName
         photoURL:(NSURL *)photoURL{
    
    if (self = [super init]){
        _name=name;
        _type=type;
        _wineCompanyWeb=wineCompanyWeb;
        _notes=notes;
        _origin=origin;
        _rating=rating;
        _grapes=grapes;
        _wineCompanyName=wineCompanyName;
        _photoURL=photoURL;
    }
    
    return self;
}

-(id)initWithName: (NSString *)name
      companyName:(NSString *)wineCompanyName
             type:(NSString *)type
           origin:(NSString *)origin{
    
    return[self initWithName:name
                        type:type
                  companyWeb:nil
                       notes:@""
                      origin:origin
                      rating:NO_RATING
                      grapes:nil
                 companyName:wineCompanyName
                    photoURL:nil];
}

#pragma mark - JSON
-(id) initWithDictionary:(NSDictionary *)dict{
    return [self initWithName:[dict objectForKey:@"name"]
                         type:[dict objectForKey:@"type"]
                   companyWeb:[dict objectForKey:@"companyweb"]
                        notes:[dict objectForKey:@"notes"]
                       origin:[dict objectForKey:@"origin"]
                       rating:[[dict objectForKey:@"rating"]intValue]
                       grapes:[self extractGrapesFromJSONArray:[dict objectForKey:@"grapes"]]
                  companyName:[dict objectForKey:@"companyname"]
                     photoURL:[NSURL URLWithString:[dict objectForKey:@"picture"]]];
}

-(NSDictionary *)proxyForJSON{
    return @{@"name"        : [self name],
             @"companyName" : [self wineCompanyName],
             @"type"        : [self type],
             @"origin"      : [self origin],
             @"grapes"      : [self grapes],
             @"wineCompanyWeb": [self wineCompanyWeb],
             @"notes"       : [self notes],
             @"rating"      : @([self rating]),
             @"picture"     : [[self photoURL] path]};
}

#pragma mark - Utils
-(NSArray*)extractGrapesFromJSONArray: (NSArray*)JSONArray{
    NSMutableArray *jsonArray = [NSMutableArray arrayWithCapacity:[JSONArray count]];
    
    for (NSString *grape in [self grapes]){
        [jsonArray addObject:@{@"grape":grape}];
    }
    return jsonArray;
}
            

@end
