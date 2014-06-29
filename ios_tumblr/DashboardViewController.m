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
@property (weak, nonatomic) IBOutlet UIImageView *homeImageView;
@property (weak, nonatomic) IBOutlet UIImageView *homeSpinnerImageView;
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIView *homeProxyView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

- (void)customizeTitleView;
- (void)customizeRightBarButton;
- (void)handleLoginButtonTap;
- (void)handleLoading;
- (void)showContent;
- (void)updateContent;

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

    self.homeImageView.image = [self.homeImageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    self.homeImageView.tintColor = [AVHexColor colorWithHexString:@"#ffffff"];

    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(handleLoading) userInfo:nil repeats:NO];
    [NSTimer scheduledTimerWithTimeInterval:2.5 target:self selector:@selector(showContent) userInfo:nil repeats:NO];
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

- (void)showContent
{
    self.loadingImageView.hidden = YES;

    // text
    self.containerView.hidden = NO;
    self.containerView.alpha = 0;
    [UIView animateWithDuration:0.2f
                          delay:0.0f
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         self.containerView.alpha = 1.0f;
                     }
                     completion:nil];

    // home
    self.homeImageView.hidden = NO;
    self.homeImageView.transform = CGAffineTransformMakeScale(0.5f, 0.5f);
    [UIView animateWithDuration:1.0f
                          delay:0.0f
         usingSpringWithDamping:0.6f
          initialSpringVelocity:0.8f
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         self.homeImageView.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
                     }
                     completion:^(BOOL finished) {
                         
                         self.homeSpinnerImageView.hidden = NO;
                         self.homeSpinnerImageView.transform = CGAffineTransformMakeScale(0.0f, 0.0f);
                         [UIView animateWithDuration:0.2f
                                          animations:^{
                                              self.homeSpinnerImageView.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
                                          }];
                         
                     }];
    
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(updateContent) userInfo:nil repeats:NO];
}

- (void)updateContent
{
    self.homeImageView.tintColor = [AVHexColor colorWithHexString:@"#aeb5be"];
    self.titleLabel.textColor = [AVHexColor colorWithHexString:@"#aeb5be"];
}
@end
