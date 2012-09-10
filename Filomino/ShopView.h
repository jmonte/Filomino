//
//  ShopView.h
//  Linking Numbers
//
//  Created by Jeffrey Monte on 24/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShopView : UITableViewCell {
    
    UILabel *levelName;
    
    UILabel *level;
    
    UILabel *complete;
    
    UIImageView *arrow;
    UIImageView *cart;
    
    BOOL isIphone;
    
    UILabel *description;
    
    
}

@property (nonatomic , assign ) UILabel *levelName;
@property (nonatomic , assign ) UILabel *level;
@property (nonatomic , assign ) UILabel *complete;
@property (nonatomic , assign ) UILabel *description;
@property (nonatomic , assign ) UIImageView *arrow;
@property (nonatomic , assign ) UIImageView *cart;

@end

