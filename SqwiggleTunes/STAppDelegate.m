//
//  STAppDelegate.m
//  SqwiggleTunes
//
//  Created by Andrew Yates on 27/03/2014.
//  Copyright (c) 2014 Andrew Yates. All rights reserved.
//

#import "STAppDelegate.h"
#import "STUserService.h"
#import "AXStatusItemPopup.h"

#import "STSetupViewController.h"
#import "STTeamViewController.h"

@interface STAppDelegate () {
    AXStatusItemPopup *_statusItemPopup;
}

@end

@implementation STAppDelegate

NSString *kSpotifyEventPlaybackChanged = @"com.spotify.client.PlaybackStateChanged";
NSString *kiTunesEventPlayerInfo = @"com.apple.iTunes.playerInfo";

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    
    [[NSDistributedNotificationCenter defaultCenter] addObserver:self selector:@selector(playbackStateChanged:) name:kSpotifyEventPlaybackChanged object:nil];
    [[NSDistributedNotificationCenter defaultCenter] addObserver:self selector:@selector(playbackStateChanged:) name:kiTunesEventPlayerInfo object:nil];
    
    //STSetupViewController *setupViewController = [[STSetupViewController alloc] init];
    STTeamViewController *teamViewController = [[STTeamViewController alloc] init];
    
    NSImage *image = [NSImage imageNamed:@"note"];
    NSImage *alternateImage = [NSImage imageNamed:@"notegrey"];
    
    _statusItemPopup = [[AXStatusItemPopup alloc] initWithViewController:teamViewController image:image alternateImage:alternateImage];
    
}

- (void)playbackStateChanged:(NSNotification *)notification {
    NSDictionary *info = [notification userInfo];
    
    NSString *trackString;
    
    // Available info
    NSLog(@"info=%@", info);
    
    // Check the track is playing
    if(![[info objectForKey:@"Player State"] isEqualToString:@"Playing"]) {
        trackString = @"";
    } else {
        trackString = [NSString stringWithFormat:@"♫ %@ - %@", [info valueForKey:@"Name"], [info valueForKey:@"Artist"]];
    }
    
    // Send the current track in Sqwiggle
    [STUserService updateWithTrack:trackString withSuccess:^(id responseObject) {
        NSLog(@"response %@", responseObject);
    } failure:^(NSError *error) {
        NSLog(@"error %@", error);
    }];
}


@end
