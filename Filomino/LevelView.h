//
//  LevelView.h
//  Filomino
//
//  Created by Jeffrey Monte on 20/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#define FONT_NAME @"TektonPro-Bold"

@interface LevelView : UIButton {
    
    UIImageView *bgView;
    
    UILabel *levelName;
    UILabel *levelSize;
    
    
    UILabel *scoreText;
    
    
    UILabel *timeText;
    UIImageView *timeImage;
    
    UILabel *stepsText;
    UIImageView *stepsImage;
    
    UIImageView *star1;
    UIImageView *star2;
    UIImageView *star3;
    
    UIImageView *check;
}

@property ( nonatomic , assign ) BOOL isGold;
@property ( nonatomic , assign ) BOOL isDone;
@property ( nonatomic , assign ) int starNum;
@property ( nonatomic , assign ) UILabel *levelName;
@property ( nonatomic , assign ) UILabel *levelSize;
@property ( nonatomic , assign ) UILabel *timeText;
@property ( nonatomic , assign ) UILabel *stepsText;
@property ( nonatomic , assign ) UILabel *scoreText;

@end
