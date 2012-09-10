//
//  LevelView.m
//  Filomino
//
//  Created by Jeffrey Monte on 20/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LevelView.h"

@implementation LevelView

@synthesize isGold;
@synthesize isDone;
@synthesize levelName;
@synthesize levelSize;
@synthesize timeText;
@synthesize stepsText;
@synthesize starNum;
@synthesize scoreText;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        bgView = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"levelselect" ofType:@"png"]]];
        bgView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        [self addSubview:bgView];
        
        
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        
        self.levelName = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, self.frame.size.width, 35)];
        self.levelName.backgroundColor = [UIColor clearColor];
        self.levelName.textColor = [UIColor whiteColor];
        self.levelName.font = [UIFont fontWithName:FONT_NAME size:30.0f];
        self.levelName.textAlignment = UITextAlignmentCenter;
        [self addSubview:self.levelName];
        
        self.levelSize = [[UILabel alloc] initWithFrame:CGRectMake(0, 55, self.frame.size.width, 35)];
        self.levelSize.backgroundColor = [UIColor clearColor];
        self.levelSize.textColor = [UIColor whiteColor];
        self.levelSize.font = [UIFont fontWithName:FONT_NAME size:20.0f];
        self.levelSize.textAlignment = UITextAlignmentCenter;
        [self addSubview:self.levelSize];
        
        self.scoreText = [[UILabel alloc] initWithFrame:CGRectMake(15, 110, 80, 25)];
        self.scoreText.backgroundColor = [UIColor clearColor];
        self.scoreText.textColor = [UIColor whiteColor];
        self.scoreText.font = [UIFont fontWithName:FONT_NAME size:20.0f];
        self.scoreText.textAlignment = UITextAlignmentCenter;
        [self addSubview:self.scoreText];
        
        self.timeText = [[UILabel alloc] initWithFrame:CGRectMake(80, 90, 80, 20)];
        self.timeText.backgroundColor = [UIColor clearColor];
        self.timeText.textColor = [UIColor whiteColor];
        self.timeText.font = [UIFont fontWithName:FONT_NAME size:15.0f];
        self.timeText.textAlignment = UITextAlignmentCenter;
        [self addSubview:self.timeText];
        
        timeImage = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"time" ofType:@"png"]]];
        timeImage.frame = CGRectMake(110, 110, 22, 22);
        [self addSubview:timeImage];
        
        self.stepsText = [[UILabel alloc] initWithFrame:CGRectMake(140, 90, 80, 20)];
        self.stepsText.backgroundColor = [UIColor clearColor];
        self.stepsText.textColor = [UIColor whiteColor];
        self.stepsText.font = [UIFont fontWithName:FONT_NAME size:15.0f];
        self.stepsText.textAlignment = UITextAlignmentCenter;
        [self addSubview:self.stepsText];
        
        stepsImage = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"steps" ofType:@"png"]]];
        stepsImage.frame = CGRectMake(170, 110, 19, 23);
        [self addSubview:stepsImage];
        
        int star_width = 32;
        int x_star = self.frame.size.width/2 - (( star_width+2 )*3/2);
        int y_star = 145;
        star1 = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"starthumb" ofType:@"png"]]];
        star1.frame = CGRectMake(x_star, y_star, star_width, star_width);
        [self addSubview:star1];
        x_star += star_width +2;
        
        star2 = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"starthumb" ofType:@"png"]]];
        star2.frame = CGRectMake(x_star, y_star, star_width, star_width);
        [self addSubview:star2];
        x_star += star_width +2;
        
        
        star3 = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"starthumb" ofType:@"png"]]];
        star3.frame = CGRectMake(x_star, y_star, star_width, star_width);
        [self addSubview:star3];
        x_star += star_width +2;
        
        
        
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    if( self.isGold ) {
        [bgView setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"levelselect-gold" ofType:@"png"]]];
        timeImage.alpha = 1.0;
        stepsImage.alpha = 1.0;
    } else {
        [bgView setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"levelselect" ofType:@"png"]]];
        timeImage.alpha = 0.8;
        stepsImage.alpha = 0.8;
        [star1 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"starthumb" ofType:@"png"]]];
        [star2 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"starthumb" ofType:@"png"]]];
        [star3 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"starthumb" ofType:@"png"]]];
    }
    

    if( self.starNum > 2 ) {
        [star3 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"starthumb-active" ofType:@"png"]]];
    }
    if( self.starNum > 1 ) {
        [star2 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"starthumb-active" ofType:@"png"]]];
    }
    if( self.starNum > 0 ) {
        [star1 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"starthumb-active" ofType:@"png"]]];
    }
    
    if( check == nil ) {
        if(self.isDone) {
            check = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"check" ofType:@"png"]]];
            check.frame = CGRectMake(0, 0,46, 45);
            [self addSubview:check];
        }
    }
    
    
}


@end
