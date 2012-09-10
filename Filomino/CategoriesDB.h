//
//  CategoriesDB.h
//  Linking Numbers
//
//  Created by Jeffrey Monte on 10/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>


@interface CategoriesDB : NSManagedObject

@property (nonatomic,retain )NSNumber *categoryID;
@property (nonatomic,retain )NSString *name;
@property (nonatomic,retain )NSString *categoryDescription;
@property (nonatomic,retain )NSNumber *isEnabled;
@property (nonatomic,assign )NSNumber *done;
@property (nonatomic,assign )NSNumber *star;

@end


@interface LevelsDB: NSManagedObject 

@property (nonatomic,retain )NSNumber *levelID;
@property (nonatomic,retain )NSString *name;
@property (nonatomic,retain )NSNumber *categoryID;
@property (nonatomic,retain )NSString *size;
@property (nonatomic,retain )NSString *tiles;
@property (nonatomic,retain )NSString *solution;
@property (nonatomic,retain )NSNumber *isDone;
@property (nonatomic,retain )NSNumber *isGold;
@property (nonatomic,retain )NSNumber *star;
@property (nonatomic,retain )NSNumber *score;
@property (nonatomic,retain )NSNumber *time;
@property (nonatomic,retain )NSNumber *steps;

@end
