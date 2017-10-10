//
//  Pokemon.h
//  PokemonHybrid
//
//  Created by Michael Meyers on 10/10/17.
//  Copyright © 2017 Michael Meyers. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface Pokemon : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, readonly) NSInteger identifier;
@property (nonatomic, copy, readonly) NSArray<NSString *> *abilities;

-(instancetype)initWithName:(NSString *)name identifier:(NSInteger)indentifier abilities:(NSArray<NSString *> *)abilities NS_DESIGNATED_INITIALIZER;
// NS_DESGNATED_INITIALIZER tells the compiler which one is the main initializer.  Without this the compiler will take the initializer with the greatest amount of arguments

@end

@interface Pokemon (JSONConvertiable)

-(instancetype)initWithDictionary:(NSDictionary <NSString *, id> *)dictionary;

@end
NS_ASSUME_NONNULL_END

