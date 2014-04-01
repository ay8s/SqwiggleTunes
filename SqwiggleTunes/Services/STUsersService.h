//
//  STUsersService.h
//  SqwiggleTunes
//
//  Created by Andrew Yates on 31/03/2014.
//  Copyright (c) 2014 Andrew Yates. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STUsersService : NSObject

+ (void)getUsersWithSuccess:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

@end
