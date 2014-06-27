//
//  ActivityViewController.m
//  ios_tumblr
//
//  Created by Stanley Ng on 6/24/14.
//  Copyright (c) 2014 Stanley Ng. All rights reserved.
//

#import "ActivityViewController.h"
#import "AVHexColor.h"

@interface ActivityViewController ()
- (IBAction)handleLoginButtonTap:(id)sender;
@end

@implementation ActivityViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Activity";
        [self.view setBackgroundColor:[AVHexColor colorWithHexString:@"#ffffff"]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)handleLoginButtonTap:(id)sender
{
    NSLog(@"Login Button Tapped");
    [self.delegate handleLoginButtonTapFromActivity:self message:@"Login Button Tapped"];
}

@end
