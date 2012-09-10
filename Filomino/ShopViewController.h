//
//  ShopViewController.h
//  Linking Numbers
//
//  Created by Jeffrey Monte on 19/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#include <AudioToolbox/AudioToolbox.h>
#import "IAHelper.h"
#import "Reachability.h"
#import "InAppRageIAPHelper.h"
#import "MBProgressHUD.h"
#import "DataManagement.h"
#import "ShopView.h"
#import "AppDelegate.h"

@interface ShopViewController : UIViewController<UITableViewDelegate,UITableViewDataSource> {
    UIImageView *mainMenuBackground;
    UIButton *backButton;
    BOOL isIphone;
    MBProgressHUD *hud;
    UITableView *scrollView;
    DataManagement *dataManage;
    
    UILabel *levelName;
    
    UIView *gameFrame;
    UIImageView *levelsTitle;
}

@property (retain) MBProgressHUD *hud;


@end
