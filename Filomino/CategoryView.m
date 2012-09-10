//
//  CategoryView.m
//  Filomino
//
//  Created by Jeffrey Monte on 23/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CategoryView.h"

@implementation CategoryView

@synthesize categoryName;
@synthesize categoryDescription;
@synthesize categoryStar;
@synthesize categoryDone;
@synthesize categoryID;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        width = 680;
        height = 220;
        
        screen_width = 768;
        screen_height = 1024;
        
        bgView = [[UIImageView alloc] initWithImage:[[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"levelselect" ofType:@"png"]] stretchableImageWithLeftCapWidth:25 topCapHeight:25]];
        bgView.frame = CGRectMake(30, 20, width, height);
        [self addSubview:bgView];
        
        self.categoryName = [[UILabel alloc] initWithFrame:CGRectMake(70, 60, width, 100)];
        self.categoryName.font = [UIFont fontWithName:FONT_NAME size:80.0];
        self.categoryName.textColor = [UIColor whiteColor];
        self.categoryName.backgroundColor = [UIColor clearColor];
        self.categoryName.text = @"Category 1";
        [self addSubview:self.categoryName];
        
        self.categoryDescription = [[UILabel alloc] initWithFrame:CGRectMake(90, 100, width, 100)];
        self.categoryDescription.font = [UIFont fontWithName:FONT_NAME size:20.0];
        self.categoryDescription.textColor = [UIColor whiteColor];
        self.categoryDescription.backgroundColor = [UIColor clearColor];
        self.categoryDescription.text = @"Category 1 Description Category 1 Description";
        [self addSubview:self.categoryDescription];
        
        self.categoryStar = [[UILabel alloc] initWithFrame:CGRectMake(150, 135, 200, 100)];
        self.categoryStar.font = [UIFont fontWithName:FONT_NAME size:25.0];
        self.categoryStar.textAlignment = UITextAlignmentCenter;
        self.categoryStar.textColor = [UIColor whiteColor];
        self.categoryStar.backgroundColor = [UIColor clearColor];
        self.categoryStar.text = @"34/50";
        [self addSubview:self.categoryStar];
        
        starImage = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"starthumb-active" ofType:@"png"]]];
        starImage.frame = CGRectMake(240, 190, 32, 32);
        [self addSubview:starImage];
        
        self.categoryDone = [[UILabel alloc] initWithFrame:CGRectMake(350, 135, 200, 100)];
        self.categoryDone.font = [UIFont fontWithName:FONT_NAME size:25.0];
        self.categoryDone.textAlignment = UITextAlignmentCenter;
        self.categoryDone.textColor = [UIColor whiteColor];
        self.categoryDone.backgroundColor = [UIColor clearColor];
        self.categoryDone.text = @"34/50";
        [self addSubview:self.categoryDone];
        
        doneImage = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"check" ofType:@"png"]]];
        doneImage.frame = CGRectMake(440, 190, 32, 32);
        [self addSubview:doneImage];
        
               
    }
    return self;
}

-(void) animateView {
    
   

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
