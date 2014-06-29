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
@property (weak, nonatomic) IBOutlet UIImageView *loadingImageView;
@property (weak, nonatomic) IBOutlet UIImageView *textImageView;

- (void)customizeTitleView;
- (void)customizeRightBarButton;
- (void)handleLoginButtonTap;
- (void)handleLoading;
- (void)showText;

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
    
        CGRect frame = self.view.frame;
        frame.origin.y -= 64;
        self.view.frame = frame;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.view setBackgroundColor:[AVHexColor colorWithHexString:@"#33465d"]];

    [self.navigationController.navigationBar setTranslucent:NO];
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(handleLoading) userInfo:nil repeats:NO];
    [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(showText) userInfo:nil repeats:NO];
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
    [self.delegate handleLoginButtonTapFromDashboard:self message:@"Login Button Tapped"];
};

- (void)handleLoading
{
    NSLog(@"Setup loading");
    
    NSArray *imageNames = @[@"loading-1", @"loading-2", @"loading-3"];
    NSMutableArray *images = [[NSMutableArray alloc] init];
    for (int i = 0; i < imageNames.count; i++) {
        [images addObject:[UIImage imageNamed:[imageNames objectAtIndexedSubscript:i]]];
    }
    
    self.loadingImageView.animationImages = images;
    self.loadingImageView.animationDuration = 0.9f;
    [self.loadingImageView startAnimating];
}

- (void)showText
{
    self.textImageView.hidden = NO;
    self.textImageView.alpha = 0;
    [UIView animateWithDuration:0.2f
                          delay:0.0f
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         self.textImageView.alpha = 1.0f;
                     }
                     completion:nil];
}
@end
