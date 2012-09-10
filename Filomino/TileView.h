//
//  TileView.h
//  Filomino
//
//  Created by Jeffrey Monte on 17/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataManagement.h"

@interface TileView : UIView {
    // default values;
    NSString *borderColor;
    NSString *tileColor;
    NSString *borderColorSelected;
    NSString *tileColorSelected;
    
    UIView *borderTop;
    UIView *borderTopLeft;
    UIView *borderTopRight;
    UIView *borderRight;
    UIView *borderLeft;
    UIView *borderBottom;
    UIView *borderBottomLeft;
    UIView *borderBottomRight;
    
    UIImageView *numberLabel;
    int tileNumber; // the tile number
    
    
    BOOL deletable; // determine if it is a part of a puzzle or not
    BOOL isSolve; // if it is grouped correctly
    
    
    TileView *up;
    TileView *down;
    TileView *left;
    TileView *right;
    
    
    
    
}

- (id)initWithFrame:(CGRect)frame number:(int)number;

@property ( nonatomic, assign ) int tileNumber;
@property ( nonatomic, retain ) TileView *up;
@property ( nonatomic, retain ) TileView *down;
@property ( nonatomic, retain ) TileView *left;
@property ( nonatomic, retain ) TileView *right;
@property ( nonatomic, assign ) BOOL isSolve;
@property ( nonatomic, assign ) BOOL isCheck;
@property ( nonatomic, assign ) BOOL isDeletable;

// determine if the border will be the same as the background
@property ( nonatomic , assign) BOOL upOpen;
@property ( nonatomic , assign) BOOL downOpen;
@property ( nonatomic , assign) BOOL rightOpen;
@property ( nonatomic , assign) BOOL leftOpen;

@end
