//
//  LevelTableView.h
//  Filomino
//
//  Created by Jeffrey Monte on 20/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "DataManagement.h"
#import "CategoriesDB.h"
#import "LevelTableViewCell.h"
#import "OpenLevelDelegate.h"

@interface LevelTableView : UITableView < UITableViewDataSource , UITableViewDelegate,OpenLevelDelegate> {
    
    DataManagement *dataManage;
    
    NSArray *levels;
    
}

@property (nonatomic , assign) id<OpenLevelDelegate> levelDelegate;
@property (nonatomic , retain) NSArray *levels;
@end
