//
//  DashboardViewController.m
//  ios_tumblr
//
//  Created by Stanley Ng on 6/24/14.
//  Copyright (c) 2014 Stanley Ng. All rights reserved.
//

#import "DashboardViewController.h"
#import "AVHexColor.h"

@interface DashboardViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *logoImageView;

- (void)customizeTitleView;
- (void)customizeRightBarButton;
- (void)handleLoginButtonTap;

@end

@implementation DashboardViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization

        //self.title = @"Dashboard";
        [self customizeTitleView];
        [self customizeRightBarButton];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.view setBackgroundColor:[AVHexColor colorWithHexString:@"#33465d"]];

    [self.navigationController.navigationBar setTranslucent:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)customizeTitleView
{
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo-tumblr"]];
    [imageView setContentMode:UIViewContentModeScaleAspectFit];

    CGRect frame = imageView.frame;
    frame.size.width = 230;
    frame.size.height = imageView.frame.size.height / imageView.frame.size.width * frame.size.width;

    self.navigationItem.titleView = imageView;
}

- (void)customizeRightBarButton
{
    UIBarButtonItem *loginButton = [[UIBarButtonItem alloc] initWithTitle:@"Log in"
                                                                    style:UIBarButtonItemStylePlain
                                                                   target:self
                                                                   action:@selector(handleLoginButtonTap)];
    self.navigationItem.rightBarButtonItem = loginButton;
}

- (void)handleLoginButtonTap
{
    NSLog(@"Login Button Tapped");
    [self.delegate handleLoginButtonTap:self message:@"Login Button Tapped"];
};

@end
