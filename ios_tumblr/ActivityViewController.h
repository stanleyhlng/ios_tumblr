//
//  ActivityViewController.h
//  ios_tumblr
//
//  Created by Stanley Ng on 6/24/14.
//  Copyright (c) 2014 Stanley Ng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ActivityViewController;

@protocol ActivityViewControllerDelegate <NSObject>
- (void)handleLoginButtonTapFromActivity:(ActivityViewController *)controller message:(NSString *)message;
@end

@interface ActivityViewController : UIViewController
@property(nonatomic, weak) id <ActivityViewControllerDelegate> delegate;
@end
