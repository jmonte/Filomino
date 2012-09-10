//
//  GameBoardViewController.m
//  Filomino
//
//  Created by Jeffrey Monte on 17/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GameBoardViewController.h"


@implementation GameBoardViewController

@synthesize levelID;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    int screen_width = self.view.frame.size.width;
    int screen_height = self.view.frame.size.height;
    
    NSString *deviceType = [UIDevice currentDevice].model;
    
    isIphone = ([deviceType rangeOfString:@"iPhone"].location != NSNotFound
                || [deviceType rangeOfString:@"iPod"].location != NSNotFound);
    
    int header_size = 106;
    if(isIphone) header_size = 44;
    
    int footer_size =110;
    
    imageBG = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"bg" ofType:@"png"]]];
    imageBG.frame = CGRectMake(0, 0, screen_width, screen_height);
    [self.view addSubview:imageBG];
    
    headerView = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"header_bg" ofType:@"png"]]];
    headerView.frame = CGRectMake(0, 0, screen_width, header_size);
    [self.view addSubview:headerView];
    
    backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    if(isIphone ) {
        backButton.frame = CGRectMake(10,14,27,10);
    } else {
        backButton.frame = CGRectMake(24, 34, 65, 25);
    }
    [backButton setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"backButton-active" ofType:@"png"]] forState:UIControlStateHighlighted];
    [backButton setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"backButton" ofType:@"png"]] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
    timeLabelView = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"timeLabel" ofType:@"png"]]];
    if(isIphone) {
        timeLabelView.frame = CGRectMake(85, 3, 30, 14);
    } else {
        timeLabelView.frame = CGRectMake(203, 8, 68, 29);
    }
    [self.view addSubview:timeLabelView];
    
    if(isIphone) {
        timeSeconds = [[UILabel alloc] initWithFrame:CGRectMake(80, 19, 28, 14)];
    } else {
        timeSeconds = [[UILabel alloc] initWithFrame:CGRectMake(193, 46, 67, 34)];
    }
    timeSeconds.font = [UIFont fontWithName:@"TektonPro-Bold" size:30.0f];
    timeSeconds.textColor = [UIColor whiteColor];
    timeSeconds.text = @"000";
    timeSeconds.textAlignment = UITextAlignmentLeft;
    timeSeconds.backgroundColor = [UIColor clearColor];
    [self.view addSubview:timeSeconds];
    
    if(isIphone) {
        timeMiliseconds = [[UILabel alloc] initWithFrame:CGRectMake(193, 46, 67, 34)];
    } else {
        timeMiliseconds = [[UILabel alloc] initWithFrame:CGRectMake(254, 51, 30, 19)];
    }
    timeMiliseconds.font = [UIFont fontWithName:@"TektonPro-Bold" size:15.0f];
    timeMiliseconds.textColor = [UIColor whiteColor];
    timeMiliseconds.text = @":00";
    timeMiliseconds.textAlignment = UITextAlignmentLeft;
    timeMiliseconds.backgroundColor = [UIColor clearColor];
    [self.view addSubview:timeMiliseconds];
    
    timeBestView = [[UILabel alloc] initWithFrame:CGRectMake(228, 70, 41, 18)];
    timeBestView.font = [UIFont fontWithName:@"TektonPro-Bold" size:15.0f];
    timeBestView.textColor = [UIColor grayColor];
    timeBestView.text = @"4:00";
    timeBestView.textAlignment = UITextAlignmentRight;
    timeBestView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:timeBestView];

    timeBestImage = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"starbest" ofType:@"png"]]];
    timeBestImage.frame = CGRectMake(270, 68, 14, 13);
    timeBestImage.backgroundColor = [UIColor clearColor];
    [self.view addSubview:timeBestImage];
    
    
    stepsLabelView = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"stepsLabel" ofType:@"png"]]];
    if(isIphone) {
        stepsLabelView.frame = CGRectMake(85, 3, 30, 14);
    } else {
        stepsLabelView.frame = CGRectMake(356, 8, 84, 35);
    }
    [self.view addSubview:stepsLabelView];
    
    if(isIphone) {
        stepsText = [[UILabel alloc] initWithFrame:CGRectMake(80, 19, 28, 14)];
    } else {
        stepsText = [[UILabel alloc] initWithFrame:CGRectMake(363, 46, 67, 34)];
    }
    stepsText.font = [UIFont fontWithName:@"TektonPro-Bold" size:30.0f];
    stepsText.textColor = [UIColor whiteColor];
    stepsText.text = @"000";
    stepsText.textAlignment = UITextAlignmentLeft;
    stepsText.backgroundColor = [UIColor clearColor];
    [self.view addSubview:stepsText];
    
    
    stepsBestView = [[UILabel alloc] initWithFrame:CGRectMake(380, 72, 41, 18)];
    stepsBestView.font = [UIFont fontWithName:@"TektonPro-Bold" size:15.0f];
    stepsBestView.textColor = [UIColor grayColor];
    stepsBestView.text = @"25";
    stepsBestView.textAlignment = UITextAlignmentRight;
    stepsBestView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:stepsBestView];
    
    
    stepsBestImage = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"starbest" ofType:@"png"]]];
    stepsBestImage.frame = CGRectMake(426, 68, 14, 13);
    stepsBestImage.backgroundColor = [UIColor clearColor];
    [self.view addSubview:stepsBestImage];
    
    undoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [undoButton setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"undoButton" ofType:@"png"]] forState:UIControlStateNormal];
    [undoButton setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"undoButton-active" ofType:@"png"]] forState:UIControlStateHighlighted];
    undoButton.frame = CGRectMake(558, 13, 63, 71);
    [undoButton addTarget:self action:@selector(undoButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:undoButton];
    
    eraseButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [eraseButton setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"eraseButton" ofType:@"png"]] forState:UIControlStateNormal];
    [eraseButton setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"eraseButton-active" ofType:@"png"]] forState:UIControlStateHighlighted];
    eraseButton.frame = CGRectMake(667, 7, 76, 77);
    [eraseButton addTarget:self action:@selector(eraseButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:eraseButton];
    
    
    
    footerView = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"footer_bg" ofType:@"png"]]];
    footerView.frame = CGRectMake(0, screen_height-footer_size, screen_width, footer_size);
    [self.view addSubview:footerView];
    
    scoreText = [[UILabel alloc] initWithFrame:CGRectMake(8, 930, 270, 30)];
    scoreText.font = [UIFont fontWithName:@"TektonPro-Bold" size:25.0f];
    scoreText.textColor = [UIColor whiteColor];
    scoreText.text = @"000";
    scoreText.textAlignment = UITextAlignmentLeft;
    scoreText.backgroundColor = [UIColor clearColor];
    [self.view addSubview:scoreText];
    
    star1 = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"starthumb-active" ofType:@"png"]]];
    star1.frame = CGRectMake(7, 958, 32, 32);
    [self.view addSubview:star1];
    
    star2 = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"starthumb-active" ofType:@"png"]]];
    star2.frame = CGRectMake(39, 958, 32, 32);
    [self.view addSubview:star2];
    
    star3 = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"starthumb" ofType:@"png"]]];
    star3.frame = CGRectMake(70, 958, 32, 32);
    [self.view addSubview:star3];
    
    levelName = [[UILabel alloc] initWithFrame:CGRectMake(107, 966, 230, 29)];
    levelName.backgroundColor = [UIColor clearColor];
    levelName.font= [UIFont fontWithName:@"TektonPro-Bold" size:25.0f];
    levelName.textColor = [UIColor whiteColor];
    levelName.text = @"Level 1";
    [self.view addSubview:levelName];
    
    hintButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [hintButton setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"hintButton" ofType:@"png"]] forState:UIControlStateNormal];
    [hintButton setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"hintButton-active" ofType:@"png"]] forState:UIControlStateHighlighted];
    hintButton.frame = CGRectMake(689, 916, 54, 76);
    [self.view addSubview:hintButton];

    hintStar = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"hintstar" ofType:@"png"]]];
    hintStar.frame = CGRectMake(630, 927, 54, 52);
    [self.view addSubview:hintStar];
    
    hintLabel = [[UILabel alloc] initWithFrame:CGRectMake(630, 952, 52, 17)];
    hintLabel.textAlignment = UITextAlignmentCenter;
    hintLabel.text = @"999";
    hintLabel.font = [UIFont fontWithName:@"TektonPro-Bold" size:15.0f];
    hintLabel.backgroundColor = [UIColor clearColor];
    hintLabel.textColor = [UIColor blackColor];
    [self.view addSubview:hintLabel];
    
    gameBorder = [[UIView alloc] initWithFrame:CGRectMake(31, 145, 700, 700)];
    gameBorder.backgroundColor = [UIColor blackColor];
    gameBorder.alpha = 0.7;
    gameBorder.layer.cornerRadius = 10.0f;
    [self.view addSubview:gameBorder];
    
    tileBoard = [[TileBoardView alloc] initWithFrame:CGRectMake(52, 166, 660, 660) levelID:levelID];
    tileBoard.backgroundColor = [DataManagement colorWithHexString:@"F0E6C8"]; 
    [self.view addSubview:tileBoard];
}


-(void)undoButton {
    [tileBoard undo];
}

-(void)eraseButton {
    [tileBoard erase];
}


-(void) back {
    [self dismissModalViewControllerAnimated:NO];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return interfaceOrientation == UIInterfaceOrientationPortrait || 
            interfaceOrientation ==UIInterfaceOrientationPortraitUpsideDown;
    
}


@end
