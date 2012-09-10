//
//  LevelSelectionViewControllerViewController.m
//  Filomino
//
//  Created by Jeffrey Monte on 20/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LevelSelectionViewController.h"



@implementation LevelSelectionViewController 

@synthesize categoryID;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if(dataManage == nil ) {
        dataManage = [(AppDelegate *)[[UIApplication sharedApplication] delegate] dataManagement]; 
    }

    
    screen_width = self.view.frame.size.width;
    screen_height = self.view.frame.size.height;
    
    NSString *deviceType = [UIDevice currentDevice].model;
    
    isIphone = ([deviceType rangeOfString:@"iPhone"].location != NSNotFound
                || [deviceType rangeOfString:@"iPod"].location != NSNotFound);
    
    header_size = 106;
    if(isIphone) header_size = 44;
    
    imageBG = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"bg" ofType:@"png"]]];
    imageBG.frame = CGRectMake(0, 0, screen_width, screen_height);
    [self.view addSubview:imageBG];
    
    headerView = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"header_bg" ofType:@"png"]]];
    headerView.frame = CGRectMake(0, -header_size, screen_width, header_size);
    [self.view addSubview:headerView];
    
    
    int theme_width = 500;
    
    themeName = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2- (theme_width/2), 20, theme_width, 80)];
    themeName.backgroundColor = [UIColor clearColor];
    themeName.textColor = [UIColor whiteColor];
    themeName.font = [UIFont fontWithName:FONT_NAME size:60.0f];
    themeName.textAlignment = UITextAlignmentCenter;
    themeName.alpha = 0;
    [self.view addSubview:themeName];
    
    themeName.text = @"Baby Steps 1st";
    
    backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    if(isIphone ) {
        backButton.frame = CGRectMake(10,14,27,10);
    } else {
        backButton.frame = CGRectMake(24, 34, 65, 25);
    }
    backButton.alpha = 0;
    [backButton setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"backButton-active" ofType:@"png"]] forState:UIControlStateHighlighted];
    [backButton setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"backButton" ofType:@"png"]] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
    
    table = [[LevelTableView alloc] initWithFrame:CGRectMake(0, screen_height ,self.view.frame.size.width ,self.view.frame.size.height - header_size +16 )];
    table.separatorColor = [UIColor clearColor];
    table.alpha = 0;
    table.levelDelegate = self;
    [self.view addSubview:table];
    	// Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated {
    [UIView animateWithDuration:0.5 delay:0.0
                        options:UIViewAnimationCurveEaseIn | UIViewAnimationOptionAllowUserInteraction |  UIViewAnimationOptionAllowAnimatedContent
                     animations:^(void) {
                         headerView.frame = CGRectMake(0,0, screen_width, header_size);
                         table.alpha = 1.0;
                         table.frame = CGRectMake(0, header_size-16 ,self.view.frame.size.width ,self.view.frame.size.height - header_size +16 );
                     }
                     completion:^(BOOL finished) {
                         
                     }             
     ]; 
    [UIView animateWithDuration:0.2 delay:0.5
                        options:UIViewAnimationCurveEaseIn | UIViewAnimationOptionAllowUserInteraction |  UIViewAnimationOptionAllowAnimatedContent
                     animations:^(void) {
                         backButton.alpha = 1.0;
                         themeName.alpha = 1.0;
                     }
                     completion:^(BOOL finished) {
                         
                     }             
     ]; 
    
}

-(void)hideViews {
    [UIView animateWithDuration:0.5 delay:0.2
                        options:UIViewAnimationCurveEaseInOut | UIViewAnimationOptionAllowUserInteraction |  UIViewAnimationOptionAllowAnimatedContent
                     animations:^(void) {
                         headerView.frame = CGRectMake(0,-header_size, screen_width, header_size);
                         table.alpha = 0;
                         table.frame = CGRectMake(0, screen_height ,self.view.frame.size.width ,self.view.frame.size.height - header_size +16 );
                     }
                     completion:^(BOOL finished) {
                         if( viewController == nil ) {
                             [self dismissModalViewControllerAnimated:NO];
                         } else {
                             [self presentModalViewController:viewController animated:NO];
                         }
                         
                     }             
     ]; 
    [UIView animateWithDuration:0.2 delay:0.0
                        options:UIViewAnimationCurveEaseIn | UIViewAnimationOptionAllowUserInteraction |  UIViewAnimationOptionAllowAnimatedContent
                     animations:^(void) {
                         backButton.alpha = 0;
                         themeName.alpha = 0;
                     }
                     completion:^(BOOL finished) {
                     }             
     ]; 
}

-(void) back {
    viewController = nil;
    [self hideViews];
}

-(void)openLevel:(int)levelID {
    
    NSLog(@"Open Another Level %i" , levelID);
    
    viewController = [[GameBoardViewController alloc] initWithNibName:nil bundle:nil];
    viewController.levelID = levelID;
    [self hideViews];
}




- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
