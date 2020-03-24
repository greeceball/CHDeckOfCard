//
//  CHCard.m
//  DeckOfCards
//
//  Created by Colby Harris on 3/24/20.
//  Copyright © 2020 Colby_Harris. All rights reserved.
//

#import "CHCard.h"

@implementation CHCard

-(instancetype)initWithSuit:(NSString *)suit image:(NSString *)image
{
    if (self = [super init])
    {
        _suit = suit;
        _image = image;
        
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *suit = dictionary[[CHCard suitKey]];
    NSString *image = dictionary[[CHCard imageKey]];
    
    return [self initWithSuit:suit image:image];
}

+ (NSString *)suitKey
{
    return @"suit";
}

+ (NSString *)imageKey
{
    return @"image";
}

@end
