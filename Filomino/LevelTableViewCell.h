//
//  LevelTableViewCell.h
//  Filomino
//
//  Created by Jeffrey Monte on 20/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LevelView.h"
#import "OpenLevelDelegate.h"

@interface LevelTableViewCell : UITableViewCell {
    
    LevelView *level1;
    LevelView *level2;
    LevelView *level3;
    
}

@property (nonatomic , assign) id<OpenLevelDelegate> levelDelegate;
@property (nonatomic , assign) LevelView *level1;
@property (nonatomic , assign) LevelView *level2;
@property (nonatomic , assign) LevelView *level3;

@end
