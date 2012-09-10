//
//  TileBoardView.h
//  Filomino
//
//  Created by Jeffrey Monte on 17/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TileView.h"
#import "AppDelegate.h"
#import "DataManagement.h"

@interface TileBoardView : UIView {
    
    NSMutableArray *tileList;
    
    
    NSMutableArray *paths;
    
    NSMutableArray *tempPaths;
    
    NSMutableArray *currentPath;

    
    BOOL isStartedBlank; // checks if the current path is started in a blank tile
    BOOL hasPathCreated; // checks if a path is created upon move
    
    int currentPathSize;
    
    DataManagement *dataManage;
    
}

@property ( nonatomic , retain ) TileView *currentView;

@property ( nonatomic , assign ) BOOL isEraseMode;
- (id)initWithFrame:(CGRect)frame levelID:(int) level;
-(void) undo;
-(void) erase;
@end
