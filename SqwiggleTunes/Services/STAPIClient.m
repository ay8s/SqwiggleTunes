//
//  STAPIClient.m
//  SqwiggleTunes
//
//  Created by Andrew Yates on 27/03/2014.
//  Copyright (c) 2014 Andrew Yates. All rights reserved.
//

#import "STAPIClient.h"
#import <SSKeychain/SSKeychain.h>

@implementation STAPIClient

NSString * const SqwiggleAPIBaseURLString = @"https://api.sqwiggle.com/";

+ (STAPIClient *)sharedClient {
    static STAPIClient *_sharedClient = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:SqwiggleAPIBaseURLString]];
        _sharedClient.responseSerializer = [AFJSONResponseSerializer serializer];
        _sharedClient.requestSerializer = [AFHTTPRequestSerializer serializer];
        
        // Add your access token within the username field
        [_sharedClient.requestSerializer setAuthorizationHeaderFieldWithUsername:@"" password:@"X"];
    });
    
    return _sharedClient;
}

@end
