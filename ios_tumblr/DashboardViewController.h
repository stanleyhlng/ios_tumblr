//
//  DashboardViewController.h
//  ios_tumblr
//
//  Created by Stanley Ng on 6/24/14.
//  Copyright (c) 2014 Stanley Ng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DashboardViewController;

@protocol DashboardViewControllerDelegate <NSObject>
- (void)handleLoginButtonTapFromDashboard:(DashboardViewController *)controller message:(NSString *)message;
@end

@interface DashboardViewController : UIViewController
@property (nonatomic, weak) id <DashboardViewControllerDelegate> delegate;
@end
