//
//  LevelTableViewCell.m
//  Filomino
//
//  Created by Jeffrey Monte on 20/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LevelTableViewCell.h"

@implementation LevelTableViewCell

@synthesize levelDelegate;
@synthesize level1;
@synthesize level2;
@synthesize level3;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        int x = 20;
        int level_spacing = 20;
        int level_width = 220;
        int level_height = 190;
        int y = 30;
        
        self.level1 = [[LevelView alloc] initWithFrame:CGRectMake(x, y, level_width, level_height)];
        [self.level1 addTarget:self action:@selector(openLevel:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.level1];
        x+= level_width +level_spacing;
        
        level2 = [[LevelView alloc] initWithFrame:CGRectMake(x, y, level_width, level_height)];
        [self.level2 addTarget:self action:@selector(openLevel:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:level2];
        x+= level_width +level_spacing;    
        
        self.level3 = [[LevelView alloc] initWithFrame:CGRectMake(x, y, level_width, level_height)];
        [self.level3 addTarget:self action:@selector(openLevel:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.level3];
        

        
    }
    return self;
}

-(void)openLevel: (UIButton *)sender {
    NSLog(@"Open Level");
    [levelDelegate openLevel:sender.tag];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
