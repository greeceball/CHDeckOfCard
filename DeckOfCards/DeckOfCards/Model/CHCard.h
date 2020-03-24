//
//  CHCard.h
//  DeckOfCards
//
//  Created by Colby Harris on 3/24/20.
//  Copyright © 2020 Colby_Harris. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CHCard : NSObject


@property (nonatomic, copy, readonly) NSString *suit;
@property (nonatomic, copy, readonly) NSString *image;

- (instancetype)initWithSuit:(NSString *)suit image:(NSString *)image;

- (instancetype) initWithDictionary:(NSDictionary *)dictionary;


@end

NS_ASSUME_NONNULL_END
