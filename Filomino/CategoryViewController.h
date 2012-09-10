//
//  CategoryViewController.h
//  Filomino
//
//  Created by Jeffrey Monte on 23/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataManagement.h"
#import "AppDelegate.h"
#import "CategoryView.h"
#import "CategoryTableView.h"
#import "OpenCategoryDelegate.h"
#import "LevelSelectionViewController.h"
#define FONT_NAME @"TektonPro-Bold"

@interface CategoryViewController : UIViewController<OpenCategoryDelegate> {
    
    UIImageView *imageBG;
    BOOL isIphone;
    
    /*** header views ***/
    UIImageView *headerView;
    UIButton *backButton;
    UILabel *themeName;
    UILabel *percentComplete;
    
    DataManagement *dataManage;
    CategoryTableView *table;
    
    
    LevelSelectionViewController *viewController;
    int header_size;
    int screen_width;
    int screen_height;
}

@end
