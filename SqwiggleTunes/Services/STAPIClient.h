//
//  STAPIClient.h
//  SqwiggleTunes
//
//  Created by Andrew Yates on 27/03/2014.
//  Copyright (c) 2014 Andrew Yates. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperationManager.h"

@interface STAPIClient : AFHTTPRequestOperationManager
+ (STAPIClient *)sharedClient;
@end
