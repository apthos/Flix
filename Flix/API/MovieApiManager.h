//
//  MovieApiManager.h
//  Flix
//
//  Created by David Lara on 7/1/20.
//  Copyright © 2020 davol00. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MovieApiManager : NSObject

@property (nonatomic, strong) NSURLSession *session;

- (void)fetchNowPlaying:(void(^)(NSArray *movies, NSError *error))completion;

@end

NS_ASSUME_NONNULL_END
