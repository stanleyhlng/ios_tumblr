//
//  SearchViewController.m
//  ios_tumblr
//
//  Created by Stanley Ng on 6/24/14.
//  Copyright (c) 2014 Stanley Ng. All rights reserved.
//

#import "SearchViewController.h"
#import "AVHexColor.h"

@interface SearchViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *contentImageView;
@property (nonatomic, strong) UIRefreshControl *refreshControl;

- (void)handleRefreshControl;
- (void)handleReload;

@end

@implementation SearchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Search";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    [self.view setBackgroundColor:[AVHexColor colorWithHexString:@"#33465d"]];

    UIView *statusBar = [[UIView alloc] init];
    statusBar.frame = CGRectMake(0, 0, 320, 20);
    statusBar.backgroundColor = [AVHexColor colorWithHexString:@"#33465d"];
    [self.view addSubview:statusBar];

    [self.navigationController.navigationBar setHidden:YES];

    [self.contentImageView sizeToFit];
    CGRect frame = self.contentImageView.frame;
    frame.size.width = 320;
    frame.size.height = self.contentImageView.frame.size.height / self.contentImageView.frame.size.width * frame.size.width;
    self.contentImageView.frame = frame;
    NSLog(@"image size: %f %f", self.contentImageView.frame.size.width, self.contentImageView.frame.size.height);
    self.contentScrollView.contentSize = self.contentImageView.frame.size;
    self.contentScrollView.contentInset = UIEdgeInsetsMake(0, 0, 100, 0);
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    self.refreshControl.tintColor = [AVHexColor colorWithHexString:@"#ffffff"];
    [self.contentScrollView addSubview:self.refreshControl];
    [self.refreshControl addTarget:self action:@selector(handleRefreshControl) forControlEvents:UIControlEventValueChanged];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)handleRefreshControl
{
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(handleReload) userInfo:nil repeats:NO];
}

- (void)handleReload
{
    [self.refreshControl endRefreshing];
}

@end
