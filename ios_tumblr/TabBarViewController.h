//
//  TabBarViewController.h
//  ios_tumblr
//
//  Created by Stanley Ng on 6/24/14.
//  Copyright (c) 2014 Stanley Ng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DashboardViewController.h"
#import "AccountViewController.h"
#import "ActivityViewController.h"

@interface TabBarViewController : UIViewController<DashboardViewControllerDelegate,AccountViewControllerDelegate, ActivityViewControllerDelegate>

@end
