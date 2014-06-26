//
//  TabBarViewController.m
//  ios_tumblr
//
//  Created by Stanley Ng on 6/24/14.
//  Copyright (c) 2014 Stanley Ng. All rights reserved.
//

#import "TabBarViewController.h"
#import "DashboardViewController.h"
#import "SearchViewController.h"
#import "ComposeViewController.h"
#import "AccountViewController.h"
#import "ActivityViewController.h"
#import "AVHexColor.h"

@interface TabBarViewController ()

@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIView *buttonsContainerView;
@property (weak, nonatomic) IBOutlet UIButton *dashboardButton;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
@property (weak, nonatomic) IBOutlet UIButton *composeButton;
@property (weak, nonatomic) IBOutlet UIButton *accountButton;
@property (weak, nonatomic) IBOutlet UIButton *activityButton;

@property (nonatomic, strong) UINavigationController *dashboardNavigationController;
@property (nonatomic, strong) NSMutableDictionary *views;

- (IBAction)handleDashboardButtonTap:(id)sender;
- (IBAction)handleSearchButtonTap:(id)sender;
- (IBAction)handleComposeButtonTap:(id)sender;
- (IBAction)handleAccountButtonTap:(id)sender;
- (IBAction)handleActivityButtonTap:(id)sender;

- (void)loadViewWithString:(NSString *)name;
- (void)setSelectedButtonWithString:(NSString *)name;

@end

@implementation TabBarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.views =
        [@{
          @"dashboard": [[UINavigationController alloc] initWithRootViewController:[[DashboardViewController alloc] init]],
          @"search":    [[UINavigationController alloc] initWithRootViewController:[[SearchViewController alloc] init]],
          @"compose":   [[UINavigationController alloc] initWithRootViewController:[[ComposeViewController alloc] init]],
          @"account":   [[UINavigationController alloc] initWithRootViewController:[[AccountViewController alloc] init]],
          @"activity":  [[UINavigationController alloc] initWithRootViewController:[[ActivityViewController alloc] init]]
        } mutableCopy];
       
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    [self setupButtonsContainer];
    
    [self setupDashboardButton];
    [self setupSearchButton];
    [self setupComposeButton];
    [self setupAccountButton];
    [self setupActivityButton];

    [self performSelector:@selector(handleDashboardButtonTap:) withObject:nil afterDelay:1.0f];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupButtonsContainer
{
    [self.buttonsContainerView setBackgroundColor:[AVHexColor colorWithHexString:@"#334256"]];

    return;
}

- (void)setupDashboardButton
{
    UIImage *image = [[self.dashboardButton currentImage] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];

    [self.dashboardButton setAdjustsImageWhenHighlighted:NO];
    [self.dashboardButton setImage:image forState:UIControlStateNormal];

    if ([self.dashboardButton isHighlighted] || [self.dashboardButton isSelected]) {
        self.dashboardButton.tintColor = [AVHexColor colorWithHexString:@"#ffffff"];
    }
    else {
        self.dashboardButton.tintColor = [AVHexColor colorWithHexString:@"#858d98"];
    }
}

- (void)setupSearchButton
{
    UIImage *image = [[self.searchButton currentImage] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    [self.searchButton setAdjustsImageWhenHighlighted:NO];
    [self.searchButton setImage:image forState:UIControlStateNormal];
    
    if ([self.searchButton isHighlighted] || [self.searchButton isSelected]) {
        self.searchButton.tintColor = [AVHexColor colorWithHexString:@"#ffffff"];
    }
    else {
        self.searchButton.tintColor = [AVHexColor colorWithHexString:@"#858d98"];
    }
}

- (void)setupComposeButton
{
    UIImage *image = [[self.composeButton currentImage] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    [self.composeButton setAdjustsImageWhenHighlighted:YES];
    [self.composeButton setImage:image forState:UIControlStateNormal];
    self.composeButton.backgroundColor = [AVHexColor colorWithHexString:@"#589fc8"];
    self.composeButton.layer.cornerRadius = 5.0f;
    
    if ([self.composeButton isHighlighted] || [self.composeButton isSelected]) {
        self.composeButton.tintColor = [AVHexColor colorWithHexString:@"#ffffff"];
    }
    else {
        self.composeButton.tintColor = [AVHexColor colorWithHexString:@"#334256"];
    }
}

- (void)setupAccountButton
{
    UIImage *image = [[self.accountButton currentImage] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    [self.accountButton setAdjustsImageWhenHighlighted:NO];
    [self.accountButton setImage:image forState:UIControlStateNormal];
    
    if ([self.accountButton isHighlighted] || [self.accountButton isSelected]) {
        self.accountButton.tintColor = [AVHexColor colorWithHexString:@"#ffffff"];
    }
    else {
        self.accountButton.tintColor = [AVHexColor colorWithHexString:@"#858d98"];
    }
}

- (void)setupActivityButton
{
    UIImage *image = [[self.activityButton currentImage] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    [self.activityButton setAdjustsImageWhenHighlighted:NO];
    [self.activityButton setImage:image forState:UIControlStateNormal];
    
    if ([self.activityButton isHighlighted] || [self.activityButton isSelected]) {
        self.activityButton.tintColor = [AVHexColor colorWithHexString:@"#ffffff"];
    }
    else {
        self.activityButton.tintColor = [AVHexColor colorWithHexString:@"#858d98"];
    }
}

- (IBAction)handleDashboardButtonTap:(id)sender {
    NSLog(@"Dashboard Button Tapped");
    
    [self.dashboardButton setSelected:YES];
    self.dashboardButton.tintColor = [AVHexColor colorWithHexString:@"#ffffff"];

    [self.searchButton setSelected:NO];
    self.searchButton.tintColor = [AVHexColor colorWithHexString:@"#858d98"];

    [self.accountButton setSelected:NO];
    self.accountButton.tintColor = [AVHexColor colorWithHexString:@"#858d98"];

    [self.activityButton setSelected:NO];
    self.activityButton.tintColor = [AVHexColor colorWithHexString:@"#858d98"];
    
    [self setSelectedButtonWithString:@"dashboard"];
    [self loadViewWithString:@"dashboard"];
}

- (IBAction)handleSearchButtonTap:(id)sender {
    NSLog(@"Search Button Tapped");

    [self.dashboardButton setSelected:NO];
    self.dashboardButton.tintColor = [AVHexColor colorWithHexString:@"#858d98"];
    
    [self.searchButton setSelected:YES];
    self.searchButton.tintColor = [AVHexColor colorWithHexString:@"#ffffff"];
    
    [self.accountButton setSelected:NO];
    self.accountButton.tintColor = [AVHexColor colorWithHexString:@"#858d98"];
    
    [self.activityButton setSelected:NO];
    self.activityButton.tintColor = [AVHexColor colorWithHexString:@"#858d98"];
    
    [self loadViewWithString:@"search"];
}

- (IBAction)handleComposeButtonTap:(id)sender {
    NSLog(@"Compose Button Tapped");
    
    [self loadViewWithString:@"compose"];
}

- (IBAction)handleAccountButtonTap:(id)sender {
    NSLog(@"Account Button Tapped");

    [self.dashboardButton setSelected:NO];
    self.dashboardButton.tintColor = [AVHexColor colorWithHexString:@"#858d98"];
    
    [self.searchButton setSelected:NO];
    self.searchButton.tintColor = [AVHexColor colorWithHexString:@"#858d98"];
    
    [self.accountButton setSelected:YES];
    self.accountButton.tintColor = [AVHexColor colorWithHexString:@"#ffffff"];
    
    [self.activityButton setSelected:NO];
    self.activityButton.tintColor = [AVHexColor colorWithHexString:@"#858d98"];
    
    [self loadViewWithString:@"account"];
}

- (IBAction)handleActivityButtonTap:(id)sender {
    NSLog(@"Activity Button Tapped");
    
    [self.dashboardButton setSelected:NO];
    self.dashboardButton.tintColor = [AVHexColor colorWithHexString:@"#858d98"];
    
    [self.searchButton setSelected:NO];
    self.searchButton.tintColor = [AVHexColor colorWithHexString:@"#858d98"];
    
    [self.accountButton setSelected:NO];
    self.accountButton.tintColor = [AVHexColor colorWithHexString:@"#858d98"];
    
    [self.activityButton setSelected:YES];
    self.activityButton.tintColor = [AVHexColor colorWithHexString:@"#ffffff"];
    
    [self loadViewWithString:@"activity"];
}

- (void)loadViewWithString:(NSString *)name
{
    NSLog(@"Load view with string: %@", name);
    
    UIView *view = ((UINavigationController *)self.views[name]).view;
    view.frame = self.contentView.frame;
    [self.contentView addSubview:view];
}

- (void)setSelectedButtonWithString:(NSString *)name
{
    NSLog(@"Set selected with string: %@", name);

    for (id key in self.views) {
        NSLog(@"key: %@", key);

        if ([@"compose" isEqualToString:key]) {
            // COMPOSE
        }
        else {
            // DASHBOARD | SEARCH | ACCOUNT | ACTIVITY
            
        }
    }
}

@end