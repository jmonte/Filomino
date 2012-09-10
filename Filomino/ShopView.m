//
//  ShopView.m
//  Linking Numbers
//
//  Created by Jeffrey Monte on 24/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ShopView.h"

@implementation ShopView
@synthesize levelName , level , complete , description , arrow , cart;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        NSString *deviceType = [UIDevice currentDevice].model;
        
        isIphone = ([deviceType rangeOfString:@"iPhone"].location != NSNotFound
                    || [deviceType rangeOfString:@"iPod"].location != NSNotFound);
        
        
        
        
        
        self.backgroundColor = [UIColor whiteColor];
        self.userInteractionEnabled = YES;
        levelName = [[UILabel alloc] init];
        levelName.text = @"Testing";
        levelName.textColor = [UIColor blackColor];
        levelName.backgroundColor = [UIColor clearColor];
        if(isIphone ){
            levelName.frame = CGRectMake(5, -10, self.frame.size.width - 40, 60);
            levelName.font = [UIFont fontWithName:@"Arial" size:20.0f];
        } else {
            levelName.frame = CGRectMake(20, 20, 600, 60);
            levelName.font = [UIFont fontWithName:@"Arial" size:45.0f];
        }
        [self addSubview:levelName];
        
        
        level = [[UILabel alloc] init];
        if(isIphone ){
            level.frame = CGRectMake(110, 25, self.frame.size.width - 150, 60);
            level.font = [UIFont fontWithName:@"Arial" size:15.0f];
        } else {
            level.frame = CGRectMake(200, 90, 600, 60);
            level.font = [UIFont fontWithName:@"Arial" size:30.0f];
        }
        level.text = @"20 Levels";
        level.alpha = 0.6;
        level.textColor = [UIColor blackColor];
        level.backgroundColor = [UIColor clearColor];
        [self addSubview:level];
        
        complete = [[UILabel alloc] init];
        if(isIphone ){
            complete.frame = CGRectMake(10, 25, self.frame.size.width - 150, 60);
            complete.font = [UIFont fontWithName:@"Arial" size:15.0f];
        } else {
            complete.frame = CGRectMake(15,90, 300, 60);
            complete.font = [UIFont fontWithName:@"Arial-BoldMT" size:30.0f];
        }
        complete.text = @"(100% cleared)";
        complete.alpha = 0.6;
        complete.textColor = [UIColor blackColor];
        complete.backgroundColor = [UIColor clearColor];
        [self addSubview:complete];
        
        description = [[UILabel alloc] init];
        if(isIphone ){
            description.frame = CGRectMake(5, 10, self.frame.size.width - 40, 60);
            description.font = [UIFont fontWithName:@"Arial" size:10.0f];
        } else {
            description.frame = CGRectMake(20, 60, 500, 60);
            description.font = [UIFont fontWithName:@"Arial" size:20.0f];
        }
        description.text = @"(100% cleared)";
        description.alpha = 0.6;
        description.textColor = [UIColor grayColor];
        description.backgroundColor = [UIColor clearColor];
        [self addSubview:description];
              
        
        
    }
    return self;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
