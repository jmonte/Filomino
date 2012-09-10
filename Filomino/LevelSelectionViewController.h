//
//  LevelSelectionViewControllerViewController.h
//  Filomino
//
//  Created by Jeffrey Monte on 20/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "LevelTableView.h"
#import "GameBoardViewController.h"
#import "OpenLevelDelegate.h"
#import "DataManagement.h"


@interface LevelSelectionViewController : UIViewController<OpenLevelDelegate> {
    
    UIImageView *imageBG;
    BOOL isIphone;
    
    /*** header views ***/
    UIImageView *headerView;
    UIButton *backButton;
    UILabel *themeName;
    UILabel *percentComplete;

    DataManagement *dataManage;
    
    LevelTableView *table;
    int screen_width;
    int screen_height;
    int header_size;
    
    GameBoardViewController *viewController;
}

@property (nonatomic ,assign) int categoryID;

@end
