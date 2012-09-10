//
//  DataManagement.h
//  Filomino
//
//  Created by Jeffrey Monte on 17/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CategoriesDB.h"

#define CATEGORIES_TABLE @"CategoriesDB"
#define LEVELS_TABLE @"LevelDB"


@interface DataManagement : NSObject {
    NSManagedObjectContext *managedObjectContext;
    CategoriesDB *categoriesDB;
    LevelsDB *levelsDB;
}

@property(nonatomic, retain)NSManagedObjectContext *managedObjectContext;

-(void)addCategory:(NSMutableDictionary *)dict;
-(void)addLevel:(NSMutableDictionary *)dict;
-(NSArray *)getAllLevels:(int) categoryID;
-(NSString *)getTile:(int) levelID;
-(NSManagedObject *)getLevelInfo:(int) levelID;
-(NSArray *)getAllCategories;
+ (UIColor *) colorWithHexString: (NSString *) hex;
-(void)setDonePuzzle:(int) levelID;
-(int)donePercentage:(int)categoryID;
-(NSMutableArray *)getSolution:(int)levelID;
-(void)setBestScore:(int) levelID time:(float) seconds steps:(int) steps;
-(void)enablePuzzle:(int) categoryId;
-(int) puzzleSolved;
@end
