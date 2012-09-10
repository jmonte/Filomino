//
//  MainMenuViewController.m
//  Filomino
//
//  Created by Jeffrey Monte on 23/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MainMenuViewController.h"


@implementation MainMenuViewController

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
    
    [super viewDidLoad];
    if(dataManage == nil ) {
        dataManage = [(AppDelegate *)[[UIApplication sharedApplication] delegate] dataManagement]; 
    }
    
    
    NSLog(@"Categories %@" , [dataManage getAllCategories]);
    
    if( [[dataManage getAllLevels:1] count] == 0 ) {
        [self addLevel];
    }
   
    isStart = YES;
    
    int screen_width = self.view.frame.size.width;
    int screen_height = self.view.frame.size.height;
    
    NSString *deviceType = [UIDevice currentDevice].model;
    
    isIphone = ([deviceType rangeOfString:@"iPhone"].location != NSNotFound
                || [deviceType rangeOfString:@"iPod"].location != NSNotFound);
    
    int header_size = 106;
    if(isIphone) header_size = 44;
    
    imageBG = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"bg" ofType:@"png"]]];
    imageBG.frame = CGRectMake(0, 0, screen_width, screen_height);
    [self.view addSubview:imageBG];
    
    
    playButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [playButton setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"playButton" ofType:@"png"]] forState:UIControlStateNormal];
    playButton.frame = CGRectMake(768, 410, 768, 105);
    [playButton addTarget:self action:@selector(play) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:playButton];
    
    shopButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [shopButton setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"shopButton" ofType:@"png"]] forState:UIControlStateNormal];
    shopButton.frame = CGRectMake(768, 530, 792, 105);
    [shopButton addTarget:self action:@selector(shop) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:shopButton];
    
    newHighlight = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"newHighlight" ofType:@"png"]]];
    newHighlight.frame = CGRectMake(216, 515, 83, 41);
    newHighlight.alpha = 0.0;
    [self.view addSubview:newHighlight];
    
    int y_menu = 846;
    y_menu = 1024;
    soundButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [soundButton setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"soundButton-active" ofType:@"png"]] forState:UIControlStateNormal];
    soundButton.frame = CGRectMake(205, y_menu, 96, 96);
    soundButton.alpha = 0;
    [self.view addSubview:soundButton];
    
    achivements = [UIButton buttonWithType:UIButtonTypeCustom];
    [achivements setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"achivementButton" ofType:@"png"]] forState:UIControlStateNormal];
    achivements.frame = CGRectMake(362,y_menu, 96, 96);
    achivements.alpha = 0;
    [self.view addSubview:achivements];
    
    scoreBoard = [UIButton buttonWithType:UIButtonTypeCustom];
    [scoreBoard setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"leaderboard" ofType:@"png"]] forState:UIControlStateNormal];
    scoreBoard.frame = CGRectMake(514, y_menu, 96, 96);
    scoreBoard.alpha = 0;
    [self.view addSubview:scoreBoard];
    
	// Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated {
    [UIView animateWithDuration:0.6 delay:0.0
                        options:UIViewAnimationCurveEaseIn | UIViewAnimationOptionAllowUserInteraction |  UIViewAnimationOptionAllowAnimatedContent
                     animations:^(void) {
                         
                         playButton.frame = CGRectMake(0, 410, 768, 105);
                     }
                     completion:^(BOOL finished) {
                         
                     }             
     ]; 
    [UIView animateWithDuration:0.4 delay:0.2
                        options:UIViewAnimationCurveEaseIn | UIViewAnimationOptionAllowUserInteraction |  UIViewAnimationOptionAllowAnimatedContent
                     animations:^(void) {
                         shopButton.frame = CGRectMake(-10, 530, 792, 105);
                     }
                     completion:^(BOOL finished) {
                         
                     }             
     ]; 
    [UIView animateWithDuration:0.20 delay:0.4
                        options:UIViewAnimationCurveEaseIn | UIViewAnimationOptionAllowUserInteraction |  UIViewAnimationOptionAllowAnimatedContent
                     animations:^(void) {
                         soundButton.alpha = 1.0;
                         soundButton.frame = CGRectMake(205, 846, 96, 96);
                     }
                     completion:^(BOOL finished) {
                         
                     }             
     ]; 
    [UIView animateWithDuration:0.15 delay:0.45
                        options:UIViewAnimationCurveEaseIn | UIViewAnimationOptionAllowUserInteraction |  UIViewAnimationOptionAllowAnimatedContent
                     animations:^(void) {
                         achivements.alpha = 1.0;
                         achivements.frame = CGRectMake(362,846, 96, 96);
                     }
                     completion:^(BOOL finished) {
                         
                     }             
     ];
    [UIView animateWithDuration:0.10 delay:0.50
                        options:UIViewAnimationCurveEaseIn | UIViewAnimationOptionAllowUserInteraction |  UIViewAnimationOptionAllowAnimatedContent
                     animations:^(void) {
                         scoreBoard.alpha = 1.0;
                         scoreBoard.frame = CGRectMake(514, 846, 96, 96);
                     }
                     completion:^(BOOL finished) {
                         
                     }             
     ];
    [UIView animateWithDuration:0.3 delay:0.6
                        options:UIViewAnimationCurveEaseInOut | UIViewAnimationOptionAllowUserInteraction |  UIViewAnimationOptionAllowAnimatedContent
                     animations:^(void) {
                         newHighlight.alpha = 1.0;
                     }
                     completion:^(BOOL finished) {
                         
                     }             
     ];

}

-(void)viewDidAppear:(BOOL)animated {
        [UIView animateWithDuration:0.6 delay:0.0
                            options:UIViewAnimationCurveEaseIn | UIViewAnimationOptionAllowUserInteraction |  UIViewAnimationOptionAllowAnimatedContent
             animations:^(void) {
                 
                 playButton.frame = CGRectMake(0, 410, 768, 105);
             }
             completion:^(BOOL finished) {
                 
             }             
         ]; 
        [UIView animateWithDuration:0.4 delay:0.2
                            options:UIViewAnimationCurveEaseIn | UIViewAnimationOptionAllowUserInteraction |  UIViewAnimationOptionAllowAnimatedContent
             animations:^(void) {
                 shopButton.frame = CGRectMake(-10, 530, 792, 105);
             }
             completion:^(BOOL finished) {
                 
             }             
         ]; 
        [UIView animateWithDuration:0.20 delay:0.4
                            options:UIViewAnimationCurveEaseIn | UIViewAnimationOptionAllowUserInteraction |  UIViewAnimationOptionAllowAnimatedContent
             animations:^(void) {
                 soundButton.alpha = 1.0;
                 soundButton.frame = CGRectMake(205, 846, 96, 96);
             }
             completion:^(BOOL finished) {
                 
             }             
         ]; 
        [UIView animateWithDuration:0.15 delay:0.45
                            options:UIViewAnimationCurveEaseIn | UIViewAnimationOptionAllowUserInteraction |  UIViewAnimationOptionAllowAnimatedContent
             animations:^(void) {
                 achivements.alpha = 1.0;
                 achivements.frame = CGRectMake(362,846, 96, 96);
             }
             completion:^(BOOL finished) {
                 
             }             
         ];
        [UIView animateWithDuration:0.10 delay:0.50
                            options:UIViewAnimationCurveEaseIn | UIViewAnimationOptionAllowUserInteraction |  UIViewAnimationOptionAllowAnimatedContent
             animations:^(void) {
                 scoreBoard.alpha = 1.0;
                 scoreBoard.frame = CGRectMake(514, 846, 96, 96);
             }
             completion:^(BOOL finished) {
                 
             }             
         ];
        [UIView animateWithDuration:0.3 delay:0.6
                            options:UIViewAnimationCurveEaseInOut | UIViewAnimationOptionAllowUserInteraction |  UIViewAnimationOptionAllowAnimatedContent
             animations:^(void) {
                 newHighlight.alpha = 1.0;
             }
             completion:^(BOOL finished) {
                 
             }             
         ];
}

-(void)hideViews {
    newHighlight.alpha = 0;
    [UIView animateWithDuration:0.6 delay:0.0
                        options:UIViewAnimationCurveEaseIn | UIViewAnimationOptionAllowUserInteraction |  UIViewAnimationOptionAllowAnimatedContent
                     animations:^(void) {
                         
                         playButton.frame = CGRectMake(768, 410, 768, 105);
                     }
                     completion:^(BOOL finished) {
                         
                     }             
     ]; 
    [UIView animateWithDuration:0.4 delay:0.2
                        options:UIViewAnimationCurveEaseIn | UIViewAnimationOptionAllowUserInteraction |  UIViewAnimationOptionAllowAnimatedContent
                     animations:^(void) {
                         shopButton.frame = CGRectMake(768, 530, 792, 105);
                     }
                     completion:^(BOOL finished) {
                         
                     }             
     ]; 
    [UIView animateWithDuration:0.45 delay:0.15
                        options:UIViewAnimationCurveEaseIn | UIViewAnimationOptionAllowUserInteraction |  UIViewAnimationOptionAllowAnimatedContent
                     animations:^(void) {
                         soundButton.alpha = 1.0;
                         soundButton.frame = CGRectMake(205, 1024, 96, 96);
                     }
                     completion:^(BOOL finished) {
                         
                     }             
     ]; 
    [UIView animateWithDuration:0.4 delay:0.20
                        options:UIViewAnimationCurveEaseIn | UIViewAnimationOptionAllowUserInteraction |  UIViewAnimationOptionAllowAnimatedContent
                     animations:^(void) {
                         achivements.alpha = 1.0;
                         achivements.frame = CGRectMake(362,1024, 96, 96);
                     }
                     completion:^(BOOL finished) {
                         
                     }             
     ];
    [UIView animateWithDuration:0.35 delay:0.25
                        options:UIViewAnimationCurveEaseIn | UIViewAnimationOptionAllowUserInteraction |  UIViewAnimationOptionAllowAnimatedContent
                     animations:^(void) {
                         scoreBoard.alpha = 0;
                         scoreBoard.frame = CGRectMake(514, 1024, 96, 96);
                     }
                     completion:^(BOOL finished) {
                         [self.navigationController presentModalViewController:viewController animated:NO];
                     }             
     ];     
}


-(void) play {
    
    viewController = [[CategoryViewController alloc] initWithNibName:nil bundle:nil];
    [self hideViews];
    
}

-(void) shop {
    ShopViewController *view = [[ShopViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:view animated:YES];
    [view release];
}

-(void) addLevel {
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setValue:[NSNumber numberWithInt:1] forKey:@"categoryID"];
    [dict setValue:@"Novice" forKey:@"name"];
    [dict setValue:@"Lets gear up for the game!" forKey:@"categoryDescription"];
    [dataManage addCategory:dict];
    
    
    int i = 0;
    int j = 1;
    int categoryID  =1;
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setValue:[NSNumber numberWithInt:i++] forKey:@"levelID"];
    [dict setValue:[NSString stringWithFormat:@"Level %i",j++] forKey:@"name"];
    [dict setValue:[NSNumber numberWithInt:categoryID] forKey:@"categoryID"];
    [dict setValue:@"5x5" forKey:@"size"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isDone"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isGold"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"star"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"score"];
    [dict setValue:[NSNumber numberWithFloat:0.0] forKey:@"time"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"steps"];
    [dict setValue:@"4,0,0,3,0|0,3,3,1,0|2,0,0,0,4|0,3,4,4,0|0,1,0,0,3" forKey:@"tiles"];
    [dict setValue:@"4,4,4,3,3|4,3,3,1,3|2,2,3,4,4|3,3,4,4,1|3,1,3,3,3" forKey:@"solution"];
    [dataManage addLevel:dict];
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setValue:[NSNumber numberWithInt:i++] forKey:@"levelID"];
    [dict setValue:[NSString stringWithFormat:@"Level %i",j++] forKey:@"name"];
    [dict setValue:[NSNumber numberWithInt:categoryID] forKey:@"categoryID"];
    [dict setValue:@"5x5" forKey:@"size"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isDone"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isGold"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"star"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"score"];
    [dict setValue:[NSNumber numberWithFloat:0.0] forKey:@"time"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"steps"];
    [dict setValue:@"0,1,0,2,0|0,3,0,0,1|0,0,3,0,3|0,0,0,0,0|0,3,0,0,1" forKey:@"tiles"];
    [dict setValue:@"2,1,4,2,2|2,3,4,4,1|1,3,3,4,3|3,4,4,3,3|3,3,4,4,1" forKey:@"solution"];
    [dataManage addLevel:dict];
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setValue:[NSNumber numberWithInt:i++] forKey:@"levelID"];
    [dict setValue:[NSString stringWithFormat:@"Level %i",j++] forKey:@"name"];
    [dict setValue:[NSNumber numberWithInt:categoryID] forKey:@"categoryID"];
    [dict setValue:@"5x5" forKey:@"size"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isDone"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isGold"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"star"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"score"];
    [dict setValue:[NSNumber numberWithFloat:0.0] forKey:@"time"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"steps"];
    [dict setValue:@"1,0,0,2,0|0,0,3,0,1|0,1,3,0,0|0,3,0,1,0|3,0,0,0,1" forKey:@"tiles"];
    [dict setValue:@"1,4,3,2,2|4,4,3,4,1|4,1,3,4,4|3,3,4,1,4|3,4,4,4,1" forKey:@"solution"];
    [dataManage addLevel:dict];
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setValue:[NSNumber numberWithInt:i++] forKey:@"levelID"];
    [dict setValue:[NSString stringWithFormat:@"Level %i",j++] forKey:@"name"];
    [dict setValue:[NSNumber numberWithInt:categoryID] forKey:@"categoryID"];
    [dict setValue:@"5x5" forKey:@"size"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isDone"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isGold"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"star"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"score"];
    [dict setValue:[NSNumber numberWithFloat:0.0] forKey:@"time"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"steps"];
    [dict setValue:@"0,2,1,0,0|0,2,0,0,2|0,0,3,3,2|0,1,0,0,0|2,2,0,2,2" forKey:@"tiles"];
    [dict setValue:@"4,2,1,4,4|4,2,4,4,2|4,3,3,3,2|4,1,4,4,4|2,2,4,2,2" forKey:@"solution"];
    [dataManage addLevel:dict];
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setValue:[NSNumber numberWithInt:i++] forKey:@"levelID"];
    [dict setValue:[NSString stringWithFormat:@"Level %i",j++] forKey:@"name"];
    [dict setValue:[NSNumber numberWithInt:categoryID] forKey:@"categoryID"];
    [dict setValue:@"5x5" forKey:@"size"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isDone"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isGold"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"star"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"score"];
    [dict setValue:[NSNumber numberWithFloat:0.0] forKey:@"time"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"steps"];
    [dict setValue:@"0,0,3,2,0|0,0,0,1,4|0,3,0,3,0|1,4,0,0,0|0,4,2,0,0" forKey:@"tiles"];
    [dict setValue:@"3,3,3,2,2|4,4,4,1,4|4,3,3,3,4|1,4,4,1,4|4,4,2,2,4" forKey:@"solution"];
    [dataManage addLevel:dict];
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setValue:[NSNumber numberWithInt:i++] forKey:@"levelID"];
    [dict setValue:[NSString stringWithFormat:@"Level %i",j++] forKey:@"name"];
    [dict setValue:[NSNumber numberWithInt:categoryID] forKey:@"categoryID"];
    [dict setValue:@"5x5" forKey:@"size"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isDone"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isGold"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"star"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"score"];
    [dict setValue:[NSNumber numberWithFloat:0.0] forKey:@"time"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"steps"];
    [dict setValue:@"4,3,0,0,0|0,2,2,0,0|0,0,0,0,0|0,0,4,2,0|0,0,0,1,4" forKey:@"tiles"];
    [dict setValue:@"4,3,3,3,1|4,2,2,1,4|4,4,1,2,4|2,2,4,2,4|4,4,4,1,4" forKey:@"solution"];
    [dataManage addLevel:dict];
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setValue:[NSNumber numberWithInt:i++] forKey:@"levelID"];
    [dict setValue:[NSString stringWithFormat:@"Level %i",j++] forKey:@"name"];
    [dict setValue:[NSNumber numberWithInt:categoryID] forKey:@"categoryID"];
    [dict setValue:@"5x5" forKey:@"size"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isDone"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isGold"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"star"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"score"];
    [dict setValue:[NSNumber numberWithFloat:0.0] forKey:@"time"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"steps"];
    [dict setValue:@"0,1,0,2,0|2,0,0,1,3|0,0,0,0,0|0,3,2,0,2|4,0,0,1,2" forKey:@"tiles"];
    [dict setValue:@"2,1,2,2,3|2,3,4,1,3|4,3,4,4,3|4,3,2,4,2|4,4,2,1,2" forKey:@"solution"];
    [dataManage addLevel:dict];
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setValue:[NSNumber numberWithInt:i++] forKey:@"levelID"];
    [dict setValue:[NSString stringWithFormat:@"Level %i",j++] forKey:@"name"];
    [dict setValue:[NSNumber numberWithInt:categoryID] forKey:@"categoryID"];
    [dict setValue:@"5x5" forKey:@"size"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isDone"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isGold"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"star"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"score"];
    [dict setValue:[NSNumber numberWithFloat:0.0] forKey:@"time"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"steps"];
    [dict setValue:@"1,2,0,0,0|0,3,0,2,4|0,0,0,0,0|4,3,0,3,0|0,0,0,4,3" forKey:@"tiles"];
    [dict setValue:@"1,2,2,4,4|4,3,1,2,4|4,3,4,2,4|4,3,4,3,3|4,1,4,4,3" forKey:@"solution"];
    [dataManage addLevel:dict];
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setValue:[NSNumber numberWithInt:i++] forKey:@"levelID"];
    [dict setValue:[NSString stringWithFormat:@"Level %i",j++] forKey:@"name"];
    [dict setValue:[NSNumber numberWithInt:categoryID] forKey:@"categoryID"];
    [dict setValue:@"5x5" forKey:@"size"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isDone"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isGold"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"star"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"score"];
    [dict setValue:[NSNumber numberWithFloat:0.0] forKey:@"time"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"steps"];
    [dict setValue:@"0,1,0,2,1|0,0,0,0,0|3,1,0,2,1|0,0,0,0,0|4,1,0,3,0" forKey:@"tiles"];
    [dict setValue:@"3,1,2,2,1|3,4,4,4,4|3,1,2,2,1|4,4,4,3,2|4,1,3,3,2" forKey:@"solution"];
    [dataManage addLevel:dict];
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setValue:[NSNumber numberWithInt:i++] forKey:@"levelID"];
    [dict setValue:[NSString stringWithFormat:@"Level %i",j++] forKey:@"name"];
    [dict setValue:[NSNumber numberWithInt:categoryID] forKey:@"categoryID"];
    [dict setValue:@"5x5" forKey:@"size"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isDone"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isGold"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"star"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"score"];
    [dict setValue:[NSNumber numberWithFloat:0.0] forKey:@"time"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"steps"];
    [dict setValue:@"0,4,2,0,1|0,0,1,0,0|1,0,0,1,0|0,0,3,0,0|0,4,1,2,1" forKey:@"tiles"];
    [dict setValue:@"4,4,2,2,1|4,4,1,4,4|1,3,3,1,4|4,4,3,2,4|4,4,1,2,1" forKey:@"solution"];
    [dataManage addLevel:dict];
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setValue:[NSNumber numberWithInt:i++] forKey:@"levelID"];
    [dict setValue:[NSString stringWithFormat:@"Level %i",j++] forKey:@"name"];
    [dict setValue:[NSNumber numberWithInt:categoryID] forKey:@"categoryID"];
    [dict setValue:@"5x5" forKey:@"size"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isDone"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isGold"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"star"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"score"];
    [dict setValue:[NSNumber numberWithFloat:0.0] forKey:@"time"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"steps"];
    [dict setValue:@"2,2,3,3,0|0,3,0,0,2|0,0,0,0,0|2,0,0,3,0|0,1,2,3,2" forKey:@"tiles"];
    [dict setValue:@"2,2,3,3,3|3,3,4,2,2|3,4,4,3,1|2,4,2,3,2|2,1,2,3,2" forKey:@"solution"];
    [dataManage addLevel:dict];
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setValue:[NSNumber numberWithInt:i++] forKey:@"levelID"];
    [dict setValue:[NSString stringWithFormat:@"Level %i",j++] forKey:@"name"];
    [dict setValue:[NSNumber numberWithInt:categoryID] forKey:@"categoryID"];
    [dict setValue:@"5x5" forKey:@"size"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isDone"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isGold"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"star"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"score"];
    [dict setValue:[NSNumber numberWithFloat:0.0] forKey:@"time"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"steps"];
    [dict setValue:@"2,0,3,0,0|2,0,0,0,1|1,3,3,3,0|0,0,0,1,0|1,0,3,0,0" forKey:@"tiles"];
    [dict setValue:@"2,4,3,3,3|2,4,4,4,1|1,3,3,3,2|4,4,4,1,2|1,4,3,3,3" forKey:@"solution"];
    [dataManage addLevel:dict];
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setValue:[NSNumber numberWithInt:i++] forKey:@"levelID"];
    [dict setValue:[NSString stringWithFormat:@"Level %i",j++] forKey:@"name"];
    [dict setValue:[NSNumber numberWithInt:categoryID] forKey:@"categoryID"];
    [dict setValue:@"5x5" forKey:@"size"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isDone"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isGold"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"star"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"score"];
    [dict setValue:[NSNumber numberWithFloat:0.0] forKey:@"time"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"steps"];
    [dict setValue:@"0,0,0,0,3|1,3,0,0,0|0,3,3,0,0|0,0,1,2,4|0,2,0,1,0" forKey:@"tiles"];
    [dict setValue:@"4,4,4,3,3|1,3,4,3,4|4,3,3,2,4|4,4,1,2,4|4,2,2,1,4" forKey:@"solution"];
    [dataManage addLevel:dict];
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setValue:[NSNumber numberWithInt:i++] forKey:@"levelID"];
    [dict setValue:[NSString stringWithFormat:@"Level %i",j++] forKey:@"name"];
    [dict setValue:[NSNumber numberWithInt:categoryID] forKey:@"categoryID"];
    [dict setValue:@"5x5" forKey:@"size"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isDone"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isGold"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"star"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"score"];
    [dict setValue:[NSNumber numberWithFloat:0.0] forKey:@"time"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"steps"];
    [dict setValue:@"0,0,0,4,0|0,0,2,3,0|0,3,0,2,0|3,0,0,0,3|1,0,2,2,0" forKey:@"tiles"];
    [dict setValue:@"4,4,4,4,3|1,2,2,3,3|3,3,4,2,2|3,4,4,3,3|1,4,2,2,3" forKey:@"solution"];
    [dataManage addLevel:dict];
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setValue:[NSNumber numberWithInt:i++] forKey:@"levelID"];
    [dict setValue:[NSString stringWithFormat:@"Level %i",j++] forKey:@"name"];
    [dict setValue:[NSNumber numberWithInt:categoryID] forKey:@"categoryID"];
    [dict setValue:@"5x5" forKey:@"size"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isDone"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isGold"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"star"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"score"];
    [dict setValue:[NSNumber numberWithFloat:0.0] forKey:@"time"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"steps"];
    [dict setValue:@"3,0,0,0,3|0,0,0,0,1|3,1,3,3,0|0,0,0,0,0|1,3,0,0,2" forKey:@"tiles"];
    [dict setValue:@"3,4,3,3,3|3,4,4,4,1|3,1,3,3,3|4,4,4,4,2|1,3,3,3,2" forKey:@"solution"];
    [dataManage addLevel:dict];
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setValue:[NSNumber numberWithInt:i++] forKey:@"levelID"];
    [dict setValue:[NSString stringWithFormat:@"Level %i",j++] forKey:@"name"];
    [dict setValue:[NSNumber numberWithInt:categoryID] forKey:@"categoryID"];
    [dict setValue:@"5x5" forKey:@"size"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isDone"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isGold"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"star"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"score"];
    [dict setValue:[NSNumber numberWithFloat:0.0] forKey:@"time"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"steps"];
    [dict setValue:@"0,2,1,0,0|1,0,0,0,0|0,1,2,4,0|0,0,0,0,3|0,0,3,3,0" forKey:@"tiles"];
    [dict setValue:@"2,2,1,2,2|1,4,4,4,3|4,1,2,4,3|4,4,2,1,3|4,3,3,3,1" forKey:@"solution"];
    [dataManage addLevel:dict];
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setValue:[NSNumber numberWithInt:i++] forKey:@"levelID"];
    [dict setValue:[NSString stringWithFormat:@"Level %i",j++] forKey:@"name"];
    [dict setValue:[NSNumber numberWithInt:categoryID] forKey:@"categoryID"];
    [dict setValue:@"5x5" forKey:@"size"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isDone"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isGold"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"star"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"score"];
    [dict setValue:[NSNumber numberWithFloat:0.0] forKey:@"time"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"steps"];
    [dict setValue:@"1,0,2,1,2|0,0,0,0,0|1,2,0,1,0|4,0,3,3,0|0,0,0,0,0" forKey:@"tiles"];
    [dict setValue:@"1,2,2,1,2|4,4,4,4,2|1,2,2,1,4|4,4,3,3,4|4,4,3,4,4" forKey:@"solution"];
    [dataManage addLevel:dict];
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setValue:[NSNumber numberWithInt:i++] forKey:@"levelID"];
    [dict setValue:[NSString stringWithFormat:@"Level %i",j++] forKey:@"name"];
    [dict setValue:[NSNumber numberWithInt:categoryID] forKey:@"categoryID"];
    [dict setValue:@"5x5" forKey:@"size"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isDone"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isGold"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"star"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"score"];
    [dict setValue:[NSNumber numberWithFloat:0.0] forKey:@"time"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"steps"];
    [dict setValue:@"2,0,0,0,0|0,1,3,3,0|1,0,1,0,0|0,2,0,3,0|0,0,1,3,0" forKey:@"tiles"];
    [dict setValue:@"2,4,4,4,4|2,1,3,3,3|1,2,1,4,4|3,2,3,3,4|3,3,1,3,4" forKey:@"solution"];
    [dataManage addLevel:dict];
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setValue:[NSNumber numberWithInt:i++] forKey:@"levelID"];
    [dict setValue:[NSString stringWithFormat:@"Level %i",j++] forKey:@"name"];
    [dict setValue:[NSNumber numberWithInt:categoryID] forKey:@"categoryID"];
    [dict setValue:@"5x5" forKey:@"size"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isDone"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isGold"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"star"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"score"];
    [dict setValue:[NSNumber numberWithFloat:0.0] forKey:@"time"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"steps"];
    [dict setValue:@"2,1,0,0,0|0,0,2,0,2|3,0,3,0,0|0,0,3,0,0|0,0,0,1,3" forKey:@"tiles"];
    [dict setValue:@"2,1,2,4,2|2,4,2,4,2|3,4,3,4,3|3,4,3,4,3|3,4,3,1,3" forKey:@"solution"];
    [dataManage addLevel:dict];
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setValue:[NSNumber numberWithInt:i++] forKey:@"levelID"];
    [dict setValue:[NSString stringWithFormat:@"Level %i",j++] forKey:@"name"];
    [dict setValue:[NSNumber numberWithInt:categoryID] forKey:@"categoryID"];
    [dict setValue:@"5x5" forKey:@"size"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isDone"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isGold"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"star"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"score"];
    [dict setValue:[NSNumber numberWithFloat:0.0] forKey:@"time"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"steps"];
    [dict setValue:@"3,0,0,2,0|0,3,0,1,4|0,2,0,2,0|0,2,0,2,0|0,3,0,3,0" forKey:@"tiles"];
    [dict setValue:@"3,3,4,2,2|4,3,4,1,4|4,2,4,2,4|4,2,4,2,4|4,3,3,3,4" forKey:@"solution"];
    [dataManage addLevel:dict];
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setValue:[NSNumber numberWithInt:i++] forKey:@"levelID"];
    [dict setValue:[NSString stringWithFormat:@"Level %i",j++] forKey:@"name"];
    [dict setValue:[NSNumber numberWithInt:categoryID] forKey:@"categoryID"];
    [dict setValue:@"5x5" forKey:@"size"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isDone"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isGold"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"star"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"score"];
    [dict setValue:[NSNumber numberWithFloat:0.0] forKey:@"time"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"steps"];
    [dict setValue:@"0,1,2,1,0|0,0,2,3,0|0,3,0,1,0|0,1,2,0,0|0,3,3,4,0" forKey:@"tiles"];
    [dict setValue:@"4,1,2,1,3|4,3,2,3,3|4,3,3,1,4|4,1,2,2,4|3,3,3,4,4" forKey:@"solution"];
    [dataManage addLevel:dict];
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setValue:[NSNumber numberWithInt:i++] forKey:@"levelID"];
    [dict setValue:[NSString stringWithFormat:@"Level %i",j++] forKey:@"name"];
    [dict setValue:[NSNumber numberWithInt:categoryID] forKey:@"categoryID"];
    [dict setValue:@"5x5" forKey:@"size"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isDone"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isGold"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"star"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"score"];
    [dict setValue:[NSNumber numberWithFloat:0.0] forKey:@"time"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"steps"];
    [dict setValue:@"0,1,3,0,3|3,0,0,0,1|0,0,3,2,2|4,0,0,1,0|0,0,0,0,0" forKey:@"tiles"];
    [dict setValue:@"3,1,3,3,3|3,4,4,4,1|3,4,3,2,2|4,3,3,1,3|4,4,4,3,3" forKey:@"solution"];
    [dataManage addLevel:dict];
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setValue:[NSNumber numberWithInt:i++] forKey:@"levelID"];
    [dict setValue:[NSString stringWithFormat:@"Level %i",j++] forKey:@"name"];
    [dict setValue:[NSNumber numberWithInt:categoryID] forKey:@"categoryID"];
    [dict setValue:@"5x5" forKey:@"size"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isDone"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isGold"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"star"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"score"];
    [dict setValue:[NSNumber numberWithFloat:0.0] forKey:@"time"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"steps"];
    [dict setValue:@"0,0,0,0,0|3,1,2,0,1|3,0,2,3,0|0,0,0,0,2|2,0,2,2,0" forKey:@"tiles"];
    [dict setValue:@"3,4,4,4,4|3,1,2,3,1|3,4,2,3,2|2,4,4,3,2|2,4,2,2,1" forKey:@"solution"];
    [dataManage addLevel:dict];
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setValue:[NSNumber numberWithInt:i++] forKey:@"levelID"];
    [dict setValue:[NSString stringWithFormat:@"Level %i",j++] forKey:@"name"];
    [dict setValue:[NSNumber numberWithInt:categoryID] forKey:@"categoryID"];
    [dict setValue:@"5x5" forKey:@"size"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isDone"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isGold"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"star"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"score"];
    [dict setValue:[NSNumber numberWithFloat:0.0] forKey:@"time"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"steps"];
    [dict setValue:@"2,3,0,1,0|0,4,0,2,0|0,0,0,0,0|0,2,0,1,0|0,2,0,3,3" forKey:@"tiles"];
    [dict setValue:@"2,3,3,1,4|2,4,3,2,4|3,4,4,2,4|3,2,4,1,4|3,2,3,3,3" forKey:@"solution"];
    [dataManage addLevel:dict];
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setValue:[NSNumber numberWithInt:i++] forKey:@"levelID"];
    [dict setValue:[NSString stringWithFormat:@"Level %i",j++] forKey:@"name"];
    [dict setValue:[NSNumber numberWithInt:categoryID] forKey:@"categoryID"];
    [dict setValue:@"5x5" forKey:@"size"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isDone"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isGold"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"star"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"score"];
    [dict setValue:[NSNumber numberWithFloat:0.0] forKey:@"time"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"steps"];
    [dict setValue:@"1,3,2,0,0|0,0,3,1,0|0,0,2,0,0|0,3,1,0,0|0,0,3,1,3" forKey:@"tiles"];
    [dict setValue:@"1,3,2,2,4|4,3,3,1,4|4,2,2,4,4|4,3,1,3,3|4,3,3,1,3" forKey:@"solution"];
    [dataManage addLevel:dict];
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setValue:[NSNumber numberWithInt:i++] forKey:@"levelID"];
    [dict setValue:[NSString stringWithFormat:@"Level %i",j++] forKey:@"name"];
    [dict setValue:[NSNumber numberWithInt:categoryID] forKey:@"categoryID"];
    [dict setValue:@"5x5" forKey:@"size"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isDone"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isGold"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"star"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"score"];
    [dict setValue:[NSNumber numberWithFloat:0.0] forKey:@"time"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"steps"];
    [dict setValue:@"0,2,1,0,0|0,0,3,0,0|0,0,0,3,0|0,0,0,1,0|3,2,0,3,2" forKey:@"tiles"];
    [dict setValue:@"2,2,1,4,4|4,4,3,3,4|3,4,4,3,4|3,2,3,1,2|3,2,3,3,2" forKey:@"solution"];
    [dataManage addLevel:dict];
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setValue:[NSNumber numberWithInt:i++] forKey:@"levelID"];
    [dict setValue:[NSString stringWithFormat:@"Level %i",j++] forKey:@"name"];
    [dict setValue:[NSNumber numberWithInt:categoryID] forKey:@"categoryID"];
    [dict setValue:@"5x5" forKey:@"size"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isDone"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isGold"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"star"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"score"];
    [dict setValue:[NSNumber numberWithFloat:0.0] forKey:@"time"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"steps"];
    [dict setValue:@"0,0,4,0,2|1,2,0,0,2|0,1,0,3,0|2,0,0,3,4|1,0,1,0,0" forKey:@"tiles"];
    [dict setValue:@"4,4,4,4,2|1,2,2,3,2|2,1,4,3,4|2,4,4,3,4|1,4,1,4,4" forKey:@"solution"];
    [dataManage addLevel:dict];
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setValue:[NSNumber numberWithInt:i++] forKey:@"levelID"];
    [dict setValue:[NSString stringWithFormat:@"Level %i",j++] forKey:@"name"];
    [dict setValue:[NSNumber numberWithInt:categoryID] forKey:@"categoryID"];
    [dict setValue:@"5x5" forKey:@"size"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isDone"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isGold"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"star"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"score"];
    [dict setValue:[NSNumber numberWithFloat:0.0] forKey:@"time"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"steps"];
    [dict setValue:@"0,0,3,3,0|4,2,0,2,0|0,1,0,4,0|0,3,0,4,2|0,2,4,0,0" forKey:@"tiles"];
    [dict setValue:@"4,2,3,3,3|4,2,1,2,2|4,1,3,4,1|4,3,3,4,2|2,2,4,4,2" forKey:@"solution"];
    [dataManage addLevel:dict];
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setValue:[NSNumber numberWithInt:i++] forKey:@"levelID"];
    [dict setValue:[NSString stringWithFormat:@"Level %i",j++] forKey:@"name"];
    [dict setValue:[NSNumber numberWithInt:categoryID] forKey:@"categoryID"];
    [dict setValue:@"5x5" forKey:@"size"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isDone"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isGold"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"star"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"score"];
    [dict setValue:[NSNumber numberWithFloat:0.0] forKey:@"time"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"steps"];
    [dict setValue:@"2,0,0,0,3|2,0,0,2,1|0,0,1,0,0|1,3,0,0,3|0,0,0,1,0" forKey:@"tiles"];
    [dict setValue:@"2,4,3,3,3|2,4,2,2,1|4,4,1,4,3|1,3,4,4,3|3,3,4,1,3" forKey:@"solution"];
    [dataManage addLevel:dict];
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setValue:[NSNumber numberWithInt:i++] forKey:@"levelID"];
    [dict setValue:[NSString stringWithFormat:@"Level %i",j++] forKey:@"name"];
    [dict setValue:[NSNumber numberWithInt:categoryID] forKey:@"categoryID"];
    [dict setValue:@"5x5" forKey:@"size"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isDone"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isGold"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"star"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"score"];
    [dict setValue:[NSNumber numberWithFloat:0.0] forKey:@"time"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"steps"];
    [dict setValue:@"2,0,3,0,1|0,0,1,0,0|0,0,0,2,0|0,2,1,0,1|1,0,0,0,0" forKey:@"tiles"];
    [dict setValue:@"2,3,3,4,1|2,3,1,4,4|4,4,4,2,4|4,2,1,2,1|1,2,3,3,3" forKey:@"solution"];
    [dataManage addLevel:dict];
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setValue:[NSNumber numberWithInt:i++] forKey:@"levelID"];
    [dict setValue:[NSString stringWithFormat:@"Level %i",j++] forKey:@"name"];
    [dict setValue:[NSNumber numberWithInt:categoryID] forKey:@"categoryID"];
    [dict setValue:@"5x5" forKey:@"size"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isDone"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isGold"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"star"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"score"];
    [dict setValue:[NSNumber numberWithFloat:0.0] forKey:@"time"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"steps"];
    [dict setValue:@"2,0,0,2,0|0,3,0,0,1|3,0,1,2,0|0,0,0,0,0|0,4,2,1,0" forKey:@"tiles"];
    [dict setValue:@"2,4,4,2,2|2,3,4,4,1|3,3,1,2,2|4,4,2,3,3|4,4,2,1,3" forKey:@"solution"];
    [dataManage addLevel:dict];
    
    dict = [[NSMutableDictionary alloc] init];
    [dict setValue:[NSNumber numberWithInt:i++] forKey:@"levelID"];
    [dict setValue:[NSString stringWithFormat:@"Level %i",j++] forKey:@"name"];
    [dict setValue:[NSNumber numberWithInt:categoryID] forKey:@"categoryID"];
    [dict setValue:@"5x5" forKey:@"size"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isDone"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"isGold"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"star"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"score"];
    [dict setValue:[NSNumber numberWithFloat:0.0] forKey:@"time"];
    [dict setValue:[NSNumber numberWithInt:0] forKey:@"steps"];
    [dict setValue:@"1,0,2,1,0|0,0,0,3,0|2,0,1,0,0|0,2,0,3,0|0,0,1,2,0" forKey:@"tiles"];
    [dict setValue:@"1,3,2,1,4|2,3,2,3,4|2,3,1,3,4|3,2,2,3,4|3,3,1,2,2" forKey:@"solution"];
    [dataManage addLevel:dict];
    
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
