//
//  Movie.h
//  Flix
//
//  Created by David Lara on 7/1/20.
//  Copyright © 2020 davol00. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Movie : NSObject

@property (nonatomic, strong) NSString *overview;
@property (nonatomic, strong) NSString *releaseDate;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSURL *backdropURL;
@property (nonatomic, strong) NSURL *posterURL;

- (id)initWithDictionary:(NSDictionary *)dictionary;

+ (NSArray *)moviesWithDictionaries:(NSArray *)dictionaries;

@end

NS_ASSUME_NONNULL_END
