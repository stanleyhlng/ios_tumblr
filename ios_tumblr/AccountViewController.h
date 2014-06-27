//
//  AccountViewController.h
//  ios_tumblr
//
//  Created by Stanley Ng on 6/24/14.
//  Copyright (c) 2014 Stanley Ng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AccountViewController;

@protocol AccountViewControllerDelegate <NSObject>
- (void)handleLoginButtonTapFromAccount:(AccountViewController *)controller message:(NSString *)message;
@end

@interface AccountViewController : UIViewController
@property(nonatomic, weak) id <AccountViewControllerDelegate> delegate;
@end
