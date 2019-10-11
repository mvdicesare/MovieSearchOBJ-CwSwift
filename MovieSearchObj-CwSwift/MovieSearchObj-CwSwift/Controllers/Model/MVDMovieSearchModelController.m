//
//  MVDMovieSearchModelController.m
//  MovieSearchObj-CwSwift
//
//  Created by Michael Di Cesare on 10/11/19.
//  Copyright © 2019 Michael Di Cesare. All rights reserved.
//

#import "MVDMovieSearchModelController.h"

static NSString * const kBaseURL = @"https://api.themoviedb.org/3/search/movie";
static NSString * const lApiKey = @"api_key";
static NSString * const kApiValue = @"d35a83296f73b5f99cf79411686ca8dc";
static NSString * const kImageURL = @"https://image.tmdb.org/t/p/w500";

@implementation MVDMovieSearchModelController

+ (void)fetchMovieDetailsWithTitle:(NSString *)title
                        completion:(void (^)(NSArray<MovieSearch*> *))completion
{
    NSURL *baseURL = [NSURL URLWithString:kBaseURL];
    
    NSURLQueryItem *apiKey =[[NSURLQueryItem alloc] initWithName:lApiKey value:kApiValue];
    NSURLQueryItem *searchTerm =[[NSURLQueryItem alloc]initWithName:@"query" value:title];
    
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:true];
    components.queryItems = @[apiKey, searchTerm];
    
    NSURL *finalURL = components.URL;
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
    {
        if (error)
        {
            NSLog(@"error with URL %@", error);
        }
        if (response)
        {
            NSLog(@"%@", response);
        }
        if (data)
        {
            NSDictionary *topLevelDict = [NSJSONSerialization JSONObjectWithData:data options:2 error:&error];
            if (topLevelDict == nil)
            {
                NSLog(@"error array didnt work %@", error);
                return;
            }
            NSArray<NSDictionary*> *oneLevelDown = topLevelDict[@"results"];
            NSMutableArray *movieArray = [NSMutableArray new];
            for (NSDictionary *movieDict in oneLevelDown)
            {
                MovieSearch *movie = [[MovieSearch alloc] initWithDictionary:movieDict];
                [movieArray addObject:movie];
            }
            if (movieArray.count !=0)
            {
                completion(movieArray);
            }
            else
            {
                completion([NSArray new]);
            }
            
        }
            
    }] resume];
    
    
}
//
//+ (void)FetchMovieSearchForImage:(MovieSearch *)image completion:(void (^)(UIImage * _Nullable))completion
//{
//
//}

@end



