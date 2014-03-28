//
//  STUserService.h
//  SqwiggleTunes
//
//  Created by Andrew Yates on 27/03/2014.
//  Copyright (c) 2014 Andrew Yates. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STUserService : NSObject

+ (void)getCurrentUserWithSuccess:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

+ (void)updateWithTrack:(NSString *)track withSuccess:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

@end
