//
//  CategoriesDB.m
//  Linking Numbers
//
//  Created by Jeffrey Monte on 10/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CategoriesDB.h"
#import <CoreData/CoreData.h>

@implementation CategoriesDB

@dynamic name;
@dynamic categoryID;
@dynamic categoryDescription;
@dynamic isEnabled;

@synthesize done;
@synthesize star;

@end

@implementation LevelsDB

@dynamic levelID;
@dynamic name;
@dynamic categoryID;
@dynamic size;
@dynamic tiles;
@dynamic isDone;
@dynamic isGold;
@dynamic star;
@dynamic score;
@dynamic time;
@dynamic steps;
@dynamic solution;

@end