//
//  MainMenuViewController.h
//  Filomino
//
//  Created by Jeffrey Monte on 23/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataManagement.h"
#import "AppDelegate.h"
#import "CategoryViewController.h"
#import "ShopViewController.h"

@interface MainMenuViewController : UIViewController {
    
    UIImageView *imageBG;
    BOOL isIphone;
    BOOL isStart;
    DataManagement *dataManage;
    
    UIButton *playButton;
    UIButton *shopButton;
    
    UIImageView *newHighlight;
    
    
    UIButton *soundButton;
    UIButton *achivements;
    UIButton *scoreBoard;
    UIViewController *viewController;
}

@end
