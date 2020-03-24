//
//  CHCardController.h
//  DeckOfCards
//
//  Created by Colby Harris on 3/24/20.
//  Copyright © 2020 Colby_Harris. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class CHCard;

NS_ASSUME_NONNULL_BEGIN

@interface CHCardController : NSObject

+(void)drawNewCard:(NSNumber *)numberOfCards completion:(void (^) (NSArray<CHCard *> * _Nullable cards))completion;

+(void)fetchCardImage:(CHCard *)card completion:(void(^) (UIImage *_Nullable image))completion;

@end

NS_ASSUME_NONNULL_END
