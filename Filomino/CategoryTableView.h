//
//  CategoryTableView.h
//  Filomino
//
//  Created by Jeffrey Monte on 23/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataManagement.h"
#import "CategoryView.h"
#import "AppDelegate.h"
#import "OpenCategoryDelegate.h"

@interface CategoryTableView : UITableView <UITableViewDelegate,UITableViewDataSource , OpenCategoryDelegate> {
    DataManagement *dataManage;
    
}

@property (nonatomic , assign) id<OpenCategoryDelegate> categoryDelegate;

@end
