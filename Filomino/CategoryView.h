//
//  CategoryView.h
//  Filomino
//
//  Created by Jeffrey Monte on 23/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OpenCategoryDelegate.h"

#define FONT_NAME @"TektonPro-Bold"

@interface CategoryView :  UITableViewCell {
    UIImageView *bgView;
    
    UIImageView *starImage;
    UIImageView *doneImage;        
    int width;
    int height;
    
    int screen_width;
    int screen_height;
}

-(void) animateView;
@property (nonatomic ,assign)UILabel *categoryName;
@property (nonatomic ,assign)UILabel *categoryDescription;
@property (nonatomic ,assign)UILabel *categoryStar;
@property (nonatomic ,assign)UILabel *categoryDone;
@property (nonatomic ,assign)int categoryID;

@end
