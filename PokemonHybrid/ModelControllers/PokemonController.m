//
//  PokemonController.m
//  PokemonHybrid
//
//  Created by Michael Meyers on 10/10/17.
//  Copyright © 2017 Michael Meyers. All rights reserved.
//

#import "PokemonController.h"
#import "Pokemon.h"
#import "PokemonHybrid-Swift.h"

static NSString * const baseURLString = @"https://pokeapi.co/api/v2/pokemon";

@implementation PokemonController

+(PokemonController *)sharedInstance {
    static PokemonController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [PokemonController new];
    });
    return sharedInstance;
}

-(void)fetchPokemonForSearchTerm:(NSString *)searchTerm completion:(void (^)(Pokemon *))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *searchURL = [baseURL URLByAppendingPathComponent:[searchTerm lowercaseString]];
    
    [NetworkController performRequestFor:searchURL httpMethod:@"GET" urlParameters:nil body:nil completion:^(NSData *data, NSError *error) {
        
        if (error) {
            NSLog(@"Error getting the pokemon from URLsearch: %@", error.localizedDescription);
            completion(nil);
            return;
        }
        
        if (!data) {
            NSLog(@"Error no data returned from search: %@", error.localizedDescription);
        }
        
        NSDictionary *jsondDictionary = [NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingAllowFragments error:&error];
        
        if (!jsondDictionary || ![jsondDictionary isKindOfClass:[NSDictionary class]]) {
            NSLog(@"Could not serilize JSon data is not a NSDictionary: &@", error.localizedDescription);
            completion(nil);
            return;
        }
        
        Pokemon *pokemon = [[Pokemon alloc]  initWithDictionary:jsondDictionary];
        
        completion(pokemon);
    }];
}

@end
