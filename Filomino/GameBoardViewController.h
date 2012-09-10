//
//  GameBoardViewController.h
//  Filomino
//
//  Created by Jeffrey Monte on 17/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "DataManagement.h"
#import "TileBoardView.h"

@interface GameBoardViewController : UIViewController {
    
    UIImageView *imageBG;
    BOOL isIphone;
    
    /*** header views ***/
    UIImageView *headerView;
    UIButton *backButton;
    UIImageView *timeLabelView;
    UILabel *timeSeconds;
    UILabel *timeMiliseconds;
    
    UILabel *timeBestView;
    UIImageView *timeBestImage;
    
    
    UIImageView *stepsLabelView;
    UILabel *stepsBestView;
    UILabel *stepsText;  
    UIImageView *stepsBestImage;
    
    UIButton *undoButton;
    UIButton *eraseButton;
    /*** header views ***/
    
    /*** game board views ***/
    UIView *gameBorder;
    TileBoardView *tileBoard;
    /*** game board views ***/
    
    /*** footer views ***/
    UIImageView *footerView;
    UILabel *scoreText;
    UIImageView *star1;
    UIImageView *star2;
    UIImageView *star3;
    UILabel *levelName;
    UIButton *hintButton;
    UIImageView *hintStar;
    UILabel *hintLabel;
    /*** footer views ***/
}

@property ( nonatomic , assign ) int levelID;

@end
