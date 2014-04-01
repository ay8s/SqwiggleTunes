//
//  STUsersService.m
//  SqwiggleTunes
//
//  Created by Andrew Yates on 31/03/2014.
//  Copyright (c) 2014 Andrew Yates. All rights reserved.
//

#import "STUsersService.h"
#import "STAPIClient.h"

@implementation STUsersService

+ (void)getUsersWithSuccess:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure {
    [[STAPIClient sharedClient] GET:@"users" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}

@end
