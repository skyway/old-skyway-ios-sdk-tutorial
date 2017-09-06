//
// PeerListViewController.h
//  eclwebrtc-ios-sdk-tutorial
//
//  Created by xxxxx on xxxx/xx/xx.
//  Copyright © xxxx年 xxxxx. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PeerListDelegate <NSObject>

- (void) didSelectPeer:(NSString*)peerId;

@end

@interface PeerListViewController : UITableViewController

@property (strong, nonatomic) NSArray* items;
@property (nonatomic, weak) id<PeerListDelegate> delegate;

@end
