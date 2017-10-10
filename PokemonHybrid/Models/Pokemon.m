//
//  Pokemon.m
//  PokemonHybrid
//
//  Created by Michael Meyers on 10/10/17.
//  Copyright © 2017 Michael Meyers. All rights reserved.
//


#import "Pokemon.h"

@implementation Pokemon

-(instancetype)initWithName:(NSString *)name identifier:(NSInteger)indentifier abilities:(NSArray<NSString *> *)abilities
{
    self = [super init];
    if (self){
        _name = name;
        _identifier = indentifier;
        _abilities = abilities;
    }
    return self;
}

-(instancetype)init
{
    return [self initWithName:@"" identifier:0 abilities:@[]];
}

@end

@implementation Pokemon (JSONConvertiable)

// WHen declaring a pointer to hold the address of an object, most of the time you specify the class of the object that the pointer will refer to. However, often you need a way to create a pointer withOut knowing excatly what kind of object the pointer will be refering to. "a pointer to some kind of Objective-C object" id implies the asterisk.
-(instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString *name = dictionary[@"name"];
    NSInteger id = [dictionary[@"id"] integerValue];
    NSArray *abilitiesDict = dictionary[@"abilities"];
    
    NSMutableArray<NSString *> *abilities = [[NSMutableArray alloc] init];
    for (NSDictionary *abilityDict in abilitiesDict)
    {
        NSDictionary *ability = abilityDict[@"ability"];
        NSString *name = ability[@"name"];
        [abilities addObject:name];
    }
    return [self initWithName:name identifier:id abilities:abilities];
}

@end
