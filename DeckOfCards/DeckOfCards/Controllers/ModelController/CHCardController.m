//
//  CHCardController.m
//  DeckOfCards
//
//  Created by Colby Harris on 3/24/20.
//  Copyright © 2020 Colby_Harris. All rights reserved.
//

#import "CHCardController.h"
#import "CHCard.h"

static NSString * const tempBaseURL = @"https://deckofcardsapi.com/api/deck/new/";
static NSString * const tempDrawComponent = @"draw/";
static NSString * const tempCountQueryName = @"count";
static NSString * const tempCardsArray = @"cards";


@implementation CHCardController
+ (void)drawNewCard:(NSNumber *)numberOfCards completion:(void (^)(NSArray<CHCard *> * _Nullable))completion
{
    
    NSURL * baseURL = [NSURL URLWithString:tempBaseURL];
    NSURL * drawURL = [baseURL URLByAppendingPathComponent:tempDrawComponent];
    NSString *cardCount = [numberOfCards stringValue];
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:drawURL resolvingAgainstBaseURL:true];
    NSURLQueryItem *queryItem = [NSURLQueryItem queryItemWithName:tempCountQueryName value:cardCount];
    
    urlComponents.queryItems = @[queryItem];
    NSURL *searchURL = urlComponents.URL;
    
    [[[NSURLSession sharedSession] dataTaskWithURL:searchURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error){
        
        if (error)
        {
            NSLog(@"%@", error.localizedDescription);
            completion(nil);
            return;
        }
        if (!data)
        {
            NSLog(@"Error: no data returned from task");
            completion(nil);
            return;
        }
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData: data options: 2 error: &error];
        
        if (!jsonDictionary || ![jsonDictionary isKindOfClass:[NSDictionary class]])
        {
            NSLog(@"Unable to create a dictionary from the data");
            completion(nil);
            return;
        }
        
        NSArray * cardsArray = jsonDictionary[tempCardsArray];
        NSMutableArray *cardsPlaceHolder = [NSMutableArray array];
        
        for (NSDictionary *cardDictionary in cardsArray)
        {
            CHCard *card = [[CHCard alloc] initWithDictionary: cardDictionary];
            [cardsPlaceHolder addObject:card];
        }
        completion(cardsPlaceHolder);
    }]resume];
    
}

+ (void)fetchCardImage:(CHCard *)card completion:(void (^)(UIImage * _Nullable))completion
{
    NSURL *imageURL = [NSURL URLWithString:card.image];
    [[[NSURLSession sharedSession] dataTaskWithURL:imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
      {
        if (error)
        {
            NSLog(@"%@", error.localizedDescription);
            completion(nil);
            return;
        }
        if (!data)
        {
            NSLog(@"Error: no data returned from task");
            completion(nil);
            return;
        }
        UIImage *cardImage = [UIImage imageWithData:data];
        completion(cardImage);
    }]resume];
}
@end
