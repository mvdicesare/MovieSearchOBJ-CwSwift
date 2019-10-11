//
//  MVDMovieSearchModelController.h
//  MovieSearchObj-CwSwift
//
//  Created by Michael Di Cesare on 10/11/19.
//  Copyright © 2019 Michael Di Cesare. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieSearch.h"
NS_ASSUME_NONNULL_BEGIN

@interface MVDMovieSearchModelController : NSObject

+(void)fetchMovieDetailsWithTitle:(NSString *)title
                       completion:(void (^)(NSArray<MovieSearch*> *))completion;

//+(void)FetchMovieSearchForImage:(MovieSearch *)image
//                     completion:(void (^) (UIImage* _Nullable))completion;

@end
NS_ASSUME_NONNULL_END


