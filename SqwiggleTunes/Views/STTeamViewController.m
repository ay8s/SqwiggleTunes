//
//  STTeamViewController.m
//  SqwiggleTunes
//
//  Created by Andrew Yates on 31/03/2014.
//  Copyright (c) 2014 Andrew Yates. All rights reserved.
//

#import "STTeamViewController.h"
#import "STUsersService.h"

@implementation STTeamViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self getUsers];
    }
    return self;
}

- (void)getUsers {
    [STUsersService getUsersWithSuccess:^(id responseObject) {

    } failure:^(NSError *error) {

    }];
}

@end
