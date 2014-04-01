//
//  STUserService.m
//  SqwiggleTunes
//
//  Created by Andrew Yates on 27/03/2014.
//  Copyright (c) 2014 Andrew Yates. All rights reserved.
//

#import "STUserService.h"
#import "STAPIClient.h"

@implementation STUserService

+ (void)getCurrentUserWithSuccess:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure {
    [[STAPIClient sharedClient] GET:@"users/me" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}

+ (void)updateWithTrack:(NSString *)track withSuccess:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure {
    
    // Set up paramaters
    NSMutableDictionary *parameters = [NSMutableDictionary new];
    
    // Add Email to parameters
    [parameters addEntriesFromDictionary:@{ @"message" : track }];
        
    [[STAPIClient sharedClient] PUT:@"users/me" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}


@end
