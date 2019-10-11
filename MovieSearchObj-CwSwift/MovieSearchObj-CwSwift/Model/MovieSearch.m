//
//  MovieSearch.m
//  MovieSearchObj-CwSwift
//
//  Created by Michael Di Cesare on 10/11/19.
//  Copyright © 2019 Michael Di Cesare. All rights reserved.
//

#import "MovieSearch.h"

static NSString * const kTitle = @"title";
static NSString * const kOverview = @"overview";
static NSString * const kRating = @"vote_average";
static NSString * const kPosterPath = @"poster_path";


@implementation MovieSearch

- (MovieSearch *)initWithMovieSearch:(NSString *)title
                          posterPath:(NSString *)posterPath
                              rating:(NSNumber *)rating
                            overview:(NSString *)overview
{
    self = [super init];
    if (self)
    {
        _title = title;
        _posterPath = posterPath;
        _rating = rating;
        _overview = overview;
    }
    return self;
}

@end

@implementation MovieSearch (JSONConvertable)

-(MovieSearch *)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString *title = dictionary[kTitle];
    NSString *overview = dictionary[kOverview];
    NSNumber *rating = [dictionary[kRating] stringValue];
    NSString *posterPath = dictionary[kPosterPath];
    
    return [self initWithMovieSearch:title
                          posterPath:posterPath
                              rating:rating
                            overview:overview];
                      
}
@end
