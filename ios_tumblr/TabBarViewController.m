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
@property (weak, nonatomic) IBOutlet UIView *composeBackgroundView;
@property (weak, nonatomic) IBOutlet UIView *loginView;
@property (weak, nonatomic) IBOutlet UIView *loginBackgroundView;
@property (weak, nonatomic) IBOutlet UIView *loginPanelContainerView;
@property (weak, nonatomic) IBOutlet UIView *buttonsContainerView;
@property (weak, nonatomic) IBOutlet UIView *composeTextProxyView;
@property (weak, nonatomic) IBOutlet UIView *composeLinkProxyView;
@property (weak, nonatomic) IBOutlet UIView *composePhotoProxyView;
@property (weak, nonatomic) IBOutlet UIView *composeChatProxyView;
@property (weak, nonatomic) IBOutlet UIView *composeQuoteProxyView;
@property (weak, nonatomic) IBOutlet UIView *composeVideoProxyView;
@property (weak, nonatomic) IBOutlet UIButton *dashboardButton;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
@property (weak, nonatomic) IBOutlet UIButton *composeButton;
@property (weak, nonatomic) IBOutlet UIButton *accountButton;
@property (weak, nonatomic) IBOutlet UIButton *activityButton;
@property (weak, nonatomic) IBOutlet UIButton *nevermindButton;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UIImageView *tooltipImageView;
@property (weak, nonatomic) IBOutlet UIImageView *composeTextImageView;
@property (weak, nonatomic) IBOutlet UIImageView *composeLinkImageView;
@property (weak, nonatomic) IBOutlet UIImageView *composePhotoImageView;
@property (weak, nonatomic) IBOutlet UIImageView *composeChatImageView;
@property (weak, nonatomic) IBOutlet UIImageView *composeQuoteImageView;
@property (weak, nonatomic) IBOutlet UIImageView *composeVideoImageView;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@property (nonatomic, strong) NSMutableDictionary *views;
@property (nonatomic, strong) NSMutableDictionary *buttons;

- (IBAction)handleDashboardButtonTap:(id)sender;
- (IBAction)handleSearchButtonTap:(id)sender;
- (IBAction)handleComposeButtonTap:(id)sender;
- (IBAction)handleAccountButtonTap:(id)sender;
- (IBAction)handleActivityButtonTap:(id)sender;
- (IBAction)handleNevermindButtonTap:(id)sender;
- (IBAction)handleCancelButtonTap:(id)sender;
- (IBAction)handleCancelButtonTouchDown:(id)sender;

- (void)hideComposeView;
- (void)hideLoginView;
- (void)hideTooltipImageView;
- (void)loadViewWithString:(NSString *)name;
- (void)setSelectedButtonWithString:(NSString *)name;
- (void)setupButtons;
- (void)setupButtonsContainer;
- (void)showComposeView;
- (void)showLoginView;
- (void)showTooltopImageView;

@end

@implementation TabBarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    
        [self.view setBackgroundColor:[AVHexColor colorWithHexString:@"#2e3f53"]];
        
        [self.composeBackgroundView setBackgroundColor:[AVHexColor colorWithHexString:@"#2e3f53"]];
        [self.composeBackgroundView setAlpha:0.9f];
        [self.composeView setHidden:YES];
        
        [self.tooltipImageView setHidden:YES];
        
        [self.loginBackgroundView setBackgroundColor:[AVHexColor colorWithHexString:@"#2e3f53"]];
        [self.loginBackgroundView setAlpha:0.9f];
        [self.loginView setHidden:YES];
        
        DashboardViewController *dashboardViewController = [[DashboardViewController alloc] init];
        dashboardViewController.delegate = self;
        
        AccountViewController *accountViewController = [[AccountViewController alloc] init];
        accountViewController.delegate = self;
        
        ActivityViewController *activityViewController = [[ActivityViewController alloc] init];
        activityViewController.delegate = self;
        
        self.views =
        [@{
          @"dashboard": [[UINavigationController alloc] initWithRootViewController:dashboardViewController],
          @"search":    [[UINavigationController alloc] initWithRootViewController:[[SearchViewController alloc] init]],
          @"compose":   [[UINavigationController alloc] initWithRootViewController:[[ComposeViewController alloc] init]],
          @"account":   [[UINavigationController alloc] initWithRootViewController:accountViewController],
          @"activity":  [[UINavigationController alloc] initWithRootViewController:activityViewController]
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
    [self showTooltopImageView];
}

- (IBAction)handleSearchButtonTap:(id)sender
{
    NSLog(@"Search Button Tapped");

    [self setSelectedButtonWithString:@"search"];
    [self loadViewWithString:@"search"];
    [self hideTooltipImageView];
}

- (IBAction)handleComposeButtonTap:(id)sender
{
    NSLog(@"Compose Button Tapped");
    
    //[self setSelectedButtonWithString:@"compose"];
    //[self loadViewWithString:@"compose"];

    [self showComposeView];
}

- (IBAction)handleAccountButtonTap:(id)sender
{
    NSLog(@"Account Button Tapped");
    
    [self setSelectedButtonWithString:@"account"];
    [self loadViewWithString:@"account"];
    [self showTooltopImageView];
}

- (IBAction)handleActivityButtonTap:(id)sender
{
    NSLog(@"Activity Button Tapped");
    
    [self setSelectedButtonWithString:@"activity"];
    [self loadViewWithString:@"activity"];
    [self showTooltopImageView];
}

- (IBAction)handleNevermindButtonTap:(id)sender
{
    NSLog(@"Nevermind Button Tapped");
    [self hideComposeView];
}

- (IBAction)handleCancelButtonTap:(id)sender
{
    NSLog(@"Cancel Button Tapped");
    [self.cancelButton setBackgroundColor:[UIColor clearColor]];
    
    [self.view endEditing:YES];
    [self.loginView setHidden:YES];
}

- (IBAction)handleCancelButtonTouchDown:(id)sender
{
    [self.cancelButton setBackgroundColor:[AVHexColor colorWithHexString:@"#d9d9d9"]];
}

- (void)hideComposeView
{
    NSLog(@"Hide compose view");
    [self.composeView setHidden:YES];
    [self.nevermindButton setHidden:YES];
}

- (void)hideLoginView
{
    NSLog(@"Hide login view");
    [self.loginView setHidden:YES];
}

- (void)hideTooltipImageView
{
    NSLog(@"Hide tooltip image view");
    [self.tooltipImageView setHidden:YES];
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

    {
        CGRect source;

        CGRect target = self.nevermindButton.frame;
        target.origin.y = self.composeView.frame.size.height - target.size.height;
        source = target;
        source.origin.y = self.composeView.frame.size.height;
        self.nevermindButton.frame = source;
        [self.nevermindButton setHidden:NO];
        
        [UIView animateWithDuration:0.3f
                              delay:0.3f
                            options:UIViewAnimationOptionCurveEaseOut
                         animations:^{
                             self.nevermindButton.frame = target;
                         }
                         completion:nil];
    }
    
    // GROUP 1: Photo
    {
        CGRect source;
        
        CGRect targetPhoto = self.composePhotoImageView.frame;
        source = targetPhoto;
        source.origin.y += 500;
        self.composePhotoImageView.frame = source;

        [UIView animateWithDuration:0.6f
                              delay:0.0f
             usingSpringWithDamping:0.7f
              initialSpringVelocity:1.0f
                            options:UIViewAnimationOptionCurveEaseOut
                         animations:^{
                             self.composePhotoImageView.frame = targetPhoto;
                         } completion:nil];
    }
    
    // GROUP 2: Text | Chat | Quote
    {
        CGRect source;
        
        CGRect targetText = self.composeTextImageView.frame;
        source = targetText;
        source.origin.y += 500;
        self.composeTextImageView.frame = source;

        CGRect targetChat = self.composeChatImageView.frame;
        source = targetChat;
        source.origin.y += 500;
        self.composeChatImageView.frame = source;

        CGRect targetQuote = self.composeQuoteImageView.frame;
        source = targetQuote;
        source.origin.y += 500;
        self.composeQuoteImageView.frame = source;
        
        [UIView animateWithDuration:0.6f
                              delay:0.1f
             usingSpringWithDamping:0.7f
              initialSpringVelocity:1.0f
                            options:UIViewAnimationOptionCurveEaseOut
                         animations:^{
                             self.composeTextImageView.frame = targetText;
                             self.composeChatImageView.frame = targetChat;
                             self.composeQuoteImageView.frame = targetQuote;
                         } completion:nil];
    }
    
    // Group 3: Link | Video
    {
        CGRect source;
        
        CGRect targetLink = self.composeLinkImageView.frame;
        source = targetLink;
        source.origin.y += 500;
        self.composeLinkImageView.frame = source;
        
        CGRect targetVideo = self.composeVideoImageView.frame;
        source = targetVideo;
        source.origin.y += 500;
        self.composeVideoImageView.frame = source;
        
        [UIView animateWithDuration:0.6f
                              delay:0.2f
             usingSpringWithDamping:0.7f
              initialSpringVelocity:1.0f
                            options:UIViewAnimationOptionCurveEaseOut
                         animations:^{
                             self.composeLinkImageView.frame = targetLink;
                             self.composeVideoImageView.frame = targetVideo;
                         } completion:nil];
    }
}

- (void)showLoginView
{
    NSLog(@"Show login view");
    
    if (self.loginView.hidden == YES) {
        [self.loginView setHidden:NO];

        [self.emailTextField setText:@""];
        [self.passwordTextField setText:@""];
        [self.emailTextField becomeFirstResponder];

        NSLog(@"Login Panel @ origin: %f %f", self.loginPanelContainerView.frame.origin.x, self.loginPanelContainerView.frame.origin.y);
       
        CGRect target = self.loginPanelContainerView.frame;
        CGRect source = target;
        source.origin.y += 50;
        self.loginPanelContainerView.frame = source;
        
        [UIView animateWithDuration:1.0f
                              delay:0.0f
             usingSpringWithDamping:0.5f
              initialSpringVelocity:0.8f
                            options:UIViewAnimationOptionCurveEaseOut
                         animations:^{
                             self.loginPanelContainerView.frame = target;
                         }
                         completion:nil];
    }
}

- (void)showTooltopImageView
{
    NSLog(@"Show tooltip image view");

    if (self.tooltipImageView.hidden == YES) {
        NSLog(@"Tooltip @ origin: %f %f", self.tooltipImageView.frame.origin.x, self.tooltipImageView.frame.origin.y);
        
        [self.tooltipImageView setHidden:NO];

        [UIView animateWithDuration:1.0f
                              delay:0
                            options:UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse
                         animations:^{
                             CGRect frame = self.tooltipImageView.frame;
                             frame.origin.y = 442.0f;
                             self.tooltipImageView.frame = frame;
                         }
                         completion:nil];
    }
}

# pragma DashboardViewControllerDelegate methods

- (void)handleLoginButtonTapFromDashboard:(DashboardViewController *)controller message:(NSString *)message
{
    NSLog(@"Handle Login Button Tap: %@", message);
    [self showLoginView];
}

# pragma AccountViewControllerDelegate methods

- (void)handleLoginButtonTapFromAccount:(AccountViewController *)controller message:(NSString *)message
{
    NSLog(@"Handle Login Button Tap: %@", message);
    [self showLoginView];
}

# pragma ActivityViewControllerDelegate methods

- (void)handleLoginButtonTapFromActivity:(ActivityViewController *)controller message:(NSString *)message
{
    NSLog(@"Handle Login Button Tap: %@", message);
    [self showLoginView];
}

@end