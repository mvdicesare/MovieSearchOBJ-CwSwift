//
//  MovieSearch.h
//  MovieSearchObj-CwSwift
//
//  Created by Michael Di Cesare on 10/11/19.
//  Copyright © 2019 Michael Di Cesare. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


// this is my class
@interface MovieSearch : NSObject

@property(nonatomic, readonly, copy)NSString * title;
@property(nonatomic, readonly, copy, nullable)NSString * posterPath;
@property(nonatomic, readonly, copy, nullable)NSNumber * rating;
@property(nonatomic, readonly, copy)NSString * overview;


-(MovieSearch *)initWithMovieSearch:(NSString *)title
                            posterPath:(NSString *)posterPath
                                rating:(NSNumber *)rating
                              overview:(NSString*)overview;


@end

// extenition
@interface MovieSearch (JSONConvertable)

-(MovieSearch *)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
