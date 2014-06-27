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
@property (weak, nonatomic) IBOutlet UIView *composeView;

@property (weak, nonatomic) IBOutlet UIView *buttonsContainerView;
@property (weak, nonatomic) IBOutlet UIButton *dashboardButton;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
@property (weak, nonatomic) IBOutlet UIButton *composeButton;
@property (weak, nonatomic) IBOutlet UIButton *accountButton;
@property (weak, nonatomic) IBOutlet UIButton *activityButton;
@property (weak, nonatomic) IBOutlet UIButton *nevermindButton;

@property (nonatomic, strong) NSMutableDictionary *views;
@property (nonatomic, strong) NSMutableDictionary *buttons;

- (IBAction)handleDashboardButtonTap:(id)sender;
- (IBAction)handleSearchButtonTap:(id)sender;
- (IBAction)handleComposeButtonTap:(id)sender;
- (IBAction)handleAccountButtonTap:(id)sender;
- (IBAction)handleActivityButtonTap:(id)sender;
- (IBAction)handleNevermindButtonTap:(id)sender;

- (void)hideComposeView;
- (void)loadViewWithString:(NSString *)name;
- (void)setSelectedButtonWithString:(NSString *)name;
- (void)setupButtons;
- (void)setupButtonsContainer;
- (void)showComposeView;


@end

@implementation TabBarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    
        [self.view setBackgroundColor:[AVHexColor colorWithHexString:@"#2e3f53"]];
        
        [self.composeView setBackgroundColor:[UIColor redColor]];
        [self.composeView setHidden:YES];
        
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
    [self setupButtons];

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
}

- (IBAction)handleDashboardButtonTap:(id)sender
{
    NSLog(@"Dashboard Button Tapped");
    
    [self setSelectedButtonWithString:@"dashboard"];
    [self loadViewWithString:@"dashboard"];
}

- (IBAction)handleSearchButtonTap:(id)sender
{
    NSLog(@"Search Button Tapped");

    [self setSelectedButtonWithString:@"search"];
    [self loadViewWithString:@"search"];
}

- (IBAction)handleComposeButtonTap:(id)sender
{
    NSLog(@"Compose Button Tapped");
    
    [self setSelectedButtonWithString:@"compose"];
    //[self loadViewWithString:@"compose"];

    [self showComposeView];
}

- (IBAction)handleAccountButtonTap:(id)sender
{
    NSLog(@"Account Button Tapped");
    
    [self setSelectedButtonWithString:@"account"];
    [self loadViewWithString:@"account"];
}

- (IBAction)handleActivityButtonTap:(id)sender
{
    NSLog(@"Activity Button Tapped");
    
    [self setSelectedButtonWithString:@"activity"];
    [self loadViewWithString:@"activity"];
}

- (IBAction)handleNevermindButtonTap:(id)sender
{
    NSLog(@"Nevermind Button Tapped");
    [self hideComposeView];
    [self.nevermindButton setHidden:YES];
}

- (void)hideComposeView
{
    NSLog(@"Hide compose view");
    [self.composeView setHidden:YES];
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

    for (id key in self.buttons) {
        
        if ([@"compose" isEqualToString:key]) {
            // COMPOSE
        }
        else {
            // DASHBOARD | SEARCH | ACCOUNT | ACTIVITY
            if ([name isEqualToString:key]) {
                // SELECTED
                [self.buttons[key] setSelected:YES];
                [self.buttons[key] setTintColor:[AVHexColor colorWithHexString:@"#ffffff"]];
            }
            else {
                // NOT SELECTED
                [self.buttons[key] setSelected:NO];
                [self.buttons[key] setTintColor:[AVHexColor colorWithHexString:@"#858d98"]];
            }
        }
    }
}

- (void)setupButtonWithString:(NSString *)name
{
    NSLog(@"Setup button with string: %@", name);

    UIButton *button = self.buttons[name];
    UIImage *image = [[button currentImage] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [button setImage:image forState:UIControlStateNormal];

    if ([@"compose" isEqualToString:name]) {
        // COMPOSE
        [button setAdjustsImageWhenHighlighted:YES];
        button.backgroundColor = [AVHexColor colorWithHexString:@"#589fc8"];
        button.layer.cornerRadius = 5.0f;
        
        if ([button isHighlighted] || [button isSelected]) {
            button.tintColor = [AVHexColor colorWithHexString:@"#ffffff"];
        }
        else {
            button.tintColor = [AVHexColor colorWithHexString:@"#334256"];
        }
    }
    else {
        // DASHBOARD | SEARCH | ACCOUNT | ACTIVITY
        [button setAdjustsImageWhenHighlighted:NO];
        
        if ([button isHighlighted] || [button isSelected]) {
            button.tintColor = [AVHexColor colorWithHexString:@"#ffffff"];
        }
        else {
            button.tintColor = [AVHexColor colorWithHexString:@"#858d98"];
        }
    }
}

- (void)setupButtons
{
    // Dashboard | Search | Compose | Account | Activity
    if ([self.buttons count] == 0) {
        self.buttons =
        [@{
           @"dashboard":    self.dashboardButton,
           @"search":       self.searchButton,
           @"compose":      self.composeButton,
           @"account":      self.accountButton,
           @"activity":     self.activityButton
        } mutableCopy];
    }
    
    for (id key in self.buttons) {
        [self setupButtonWithString:key];
    }
    
    // Nevermind
    [self.nevermindButton setHidden:YES];
    [self.nevermindButton setBackgroundColor:[AVHexColor colorWithHexString:@"#3d4d61"]];
    [self.nevermindButton setTintColor:[AVHexColor colorWithHexString:@"#858d98"]];
}

- (void)showComposeView
{
    NSLog(@"Show compose view");
    [self.composeView setHidden:NO];
    [self.nevermindButton setHidden:NO];
}

@end