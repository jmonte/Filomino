//
//  TileView.m
//  Filomino
//
//  Created by Jeffrey Monte on 17/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TileView.h"


@implementation TileView

@synthesize tileNumber;
@synthesize up;
@synthesize down;
@synthesize left;
@synthesize right;
@synthesize isSolve;
@synthesize isCheck;
@synthesize isDeletable;

@synthesize upOpen;
@synthesize downOpen;
@synthesize leftOpen;
@synthesize rightOpen;

- (id)initWithFrame:(CGRect)frame number:(int)number
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.tileNumber = number;
        
        self.backgroundColor = [UIColor clearColor];
        
        int border_size = 5;
        borderColor = @"D7C8A5";
        
        borderTop = [[UIView alloc] initWithFrame:CGRectMake(border_size, 0, self.frame.size.width - ( border_size*2), border_size)];
        borderTop.backgroundColor = [DataManagement colorWithHexString:borderColor];
        [self addSubview:borderTop];
        
        borderTopLeft = [[UIView alloc] initWithFrame:CGRectMake(0, 0, border_size, border_size)];
        borderTopLeft.backgroundColor = [DataManagement colorWithHexString:borderColor];
        [self addSubview:borderTopLeft];
        
        borderTopRight = [[UIView alloc] initWithFrame:CGRectMake(self.frame.size.width-border_size, 0, border_size, border_size)];
        borderTopRight.backgroundColor = [DataManagement colorWithHexString:borderColor];
        [self addSubview:borderTopRight];
        
        borderBottomLeft = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - border_size, border_size, border_size)];
        borderBottomLeft.backgroundColor = [DataManagement colorWithHexString:borderColor];
        [self addSubview:borderBottomLeft];
        
        borderBottomRight = [[UIView alloc] initWithFrame:CGRectMake(self.frame.size.width-border_size, self.frame.size.height - border_size, border_size, border_size)];
        borderBottomRight.backgroundColor = [DataManagement colorWithHexString:borderColor];
        [self addSubview:borderBottomRight];
        
        borderBottom = [[UIView alloc] initWithFrame:CGRectMake(border_size, self.frame.size.height - border_size, self.frame.size.width- ( border_size*2), border_size)];
        borderBottom.backgroundColor = [DataManagement colorWithHexString:borderColor];
        [self addSubview:borderBottom];
        
        borderLeft = [[UIView alloc] initWithFrame:CGRectMake(0, border_size, border_size, self.frame.size.height-  (border_size*2) )];
        borderLeft.backgroundColor = [DataManagement colorWithHexString:borderColor];
        [self addSubview:borderLeft];
        
        borderRight = [[UIView alloc] initWithFrame:CGRectMake(self.frame.size.width -border_size, border_size, border_size, self.frame.size.height-  (border_size*2))];
        borderRight.backgroundColor = [DataManagement colorWithHexString:borderColor];
        [self addSubview:borderRight];
        
        
        numberLabel = [[UIImageView alloc] initWithFrame:CGRectMake(border_size, border_size, self.frame.size.width - ( border_size*2), self.frame.size.height- ( border_size*2))];
        numberLabel.backgroundColor = [UIColor clearColor];
        
        [self addSubview:numberLabel];
        
        
        
        [self refreshBorder];
        
    }
    return self;
}

-(void) refreshBorder {
    switch( tileNumber ) {
        case 1:
            [numberLabel setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"1tile" ofType:@"png"]]];
            tileColor = @"F0A5A5";
            borderColorSelected = @"F56069";
            tileColorSelected = @"F0A5A5";
            break;
        case 2:
            [numberLabel setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"2tile" ofType:@"png"]]];
            tileColor = @"91D0DC";
            borderColorSelected = @"23A0B9";
            tileColorSelected = @"91D0DC";
            break;
        case 3:
            [numberLabel setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"3tile" ofType:@"png"]]];
            tileColor = @"CBD295";
            borderColorSelected = @"96A52A";
            tileColorSelected = @"CBD295";
            break;
        case 4:
            [numberLabel setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"4tile" ofType:@"png"]]];
            tileColor = @"FFCB80";
            borderColorSelected = @"FF9600";
            tileColorSelected = @"FFCB80";
            break;
        case 5:
            [numberLabel setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"5tile" ofType:@"png"]]];
            tileColor = @"C7A9D0";
            borderColorSelected = @"8F53A1";
            tileColorSelected = @"C7A9D0";
            break;
            
        case 6:
            [numberLabel setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"6tile" ofType:@"png"]]];
            tileColor = @"F68E92";
            borderColorSelected = @"ED1C24";
            tileColorSelected = @"F68E92";
            break;
        case 7:
            [numberLabel setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"7tile" ofType:@"png"]]];
            tileColor = @"9798C9";
            borderColorSelected = @"2E3192";
            tileColorSelected = @"9798C9";
            break;
        case 8:
            [numberLabel setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"8tile" ofType:@"png"]]];
            tileColor = @"80C08A";
            borderColorSelected = @"008015";
            tileColorSelected = @"80C08A";
            break;
        case 9:
            [numberLabel setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"9tile" ofType:@"png"]]];
            tileColor = @"FFAD80";
            borderColorSelected = @"FB884D";
            tileColorSelected = @"FFAD80";
            break;
        case 10:
            [numberLabel setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"10tile" ofType:@"png"]]];
            tileColor = @"AB6692";
            borderColorSelected = @"AB1550";
            tileColorSelected = @"AB6692";
            break;
            
            
        default:
            [numberLabel setImage:nil];
            numberLabel.backgroundColor = [DataManagement colorWithHexString:@"F0E6C8"];
            break;
    }
    
    if( tileNumber > 0 ) {
        borderBottomLeft.backgroundColor = [DataManagement colorWithHexString:tileColor];
        borderBottomRight.backgroundColor = [DataManagement colorWithHexString:tileColor];
        borderTopLeft.backgroundColor = [DataManagement colorWithHexString:tileColor];
        borderTopRight.backgroundColor = [DataManagement colorWithHexString:tileColor];
        borderTop.backgroundColor = [DataManagement colorWithHexString:tileColor];
        borderBottom.backgroundColor = [DataManagement colorWithHexString:tileColor];
        borderLeft.backgroundColor = [DataManagement colorWithHexString:tileColor];
        borderRight.backgroundColor = [DataManagement colorWithHexString:tileColor];
        numberLabel.backgroundColor = [DataManagement colorWithHexString:tileColor];
    } else{
        borderBottomLeft.backgroundColor = [DataManagement colorWithHexString:borderColor];
        borderBottomRight.backgroundColor = [DataManagement colorWithHexString:borderColor];
        borderTopLeft.backgroundColor = [DataManagement colorWithHexString:borderColor];
        borderTopRight.backgroundColor = [DataManagement colorWithHexString:borderColor];
        borderTop.backgroundColor = [DataManagement colorWithHexString:borderColor];
        borderBottom.backgroundColor = [DataManagement colorWithHexString:borderColor];
        borderLeft.backgroundColor = [DataManagement colorWithHexString:borderColor];
        borderRight.backgroundColor = [DataManagement colorWithHexString:borderColor];
    }
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    [self refreshBorder];
    
    if( isSolve ) {
        
        if(upOpen) {
            borderTop.backgroundColor = [DataManagement colorWithHexString:tileColorSelected];
        } else {
            borderTop.backgroundColor = [DataManagement colorWithHexString:borderColorSelected];
            
        }
        
        if( downOpen ) {
            borderBottom.backgroundColor = [DataManagement colorWithHexString:tileColorSelected];
        } else {
            borderBottom.backgroundColor = [DataManagement colorWithHexString:borderColorSelected];
        }
        
        if( leftOpen ) {
            borderLeft.backgroundColor = [DataManagement colorWithHexString:tileColorSelected];
        } else {
            borderLeft.backgroundColor = [DataManagement colorWithHexString:borderColorSelected];
        }
        
        if( rightOpen ) {
            borderRight.backgroundColor = [DataManagement colorWithHexString:tileColorSelected];
        } else {
            borderRight.backgroundColor = [DataManagement colorWithHexString:borderColorSelected];
        }
        
        borderBottomLeft.backgroundColor = [DataManagement colorWithHexString:borderColorSelected];
        borderBottomRight.backgroundColor = [DataManagement colorWithHexString:borderColorSelected];
        borderTopLeft.backgroundColor = [DataManagement colorWithHexString:borderColorSelected];
        borderTopRight.backgroundColor = [DataManagement colorWithHexString:borderColorSelected];
    } else {
        self.backgroundColor = [DataManagement colorWithHexString:tileColor];
    }
    
    
}


@end
