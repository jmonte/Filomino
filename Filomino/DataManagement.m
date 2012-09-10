//
//  DataManagement.m
//  Linking Numbers
//
//  Created by Jeffrey Monte on 19/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DataManagement.h"
#import "AppDelegate.h"

@implementation DataManagement

@synthesize managedObjectContext;

-(void)addCategory:(NSMutableDictionary *)dict {
    categoriesDB = [NSEntityDescription
                    insertNewObjectForEntityForName:CATEGORIES_TABLE 
                    inManagedObjectContext:[self managedObjectContext]];
    categoriesDB.categoryID = [dict valueForKey:@"categoryID"];
    categoriesDB.name = [dict valueForKey:@"name"];
    categoriesDB.categoryDescription = [dict valueForKey:@"categoryDescription"];
    categoriesDB.isEnabled = [dict valueForKey:@"isEnabled"];
    NSError *error;
    if (![managedObjectContext save:&error]) {
        // NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
}

-(NSArray *)getAllCategories {
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription 
                                   entityForName:CATEGORIES_TABLE inManagedObjectContext:[self managedObjectContext]];
    [fetchRequest setEntity:entity];
    
    NSError *error;
    NSArray *fetchedObjects = [[self managedObjectContext] executeFetchRequest:fetchRequest error:&error];
    
    
    for( int i = 0 ; i < [fetchedObjects count]; i++ ) {
    
       categoriesDB = (CategoriesDB *) [fetchedObjects objectAtIndex:i];
        
        fetchRequest = [[NSFetchRequest alloc] init];
        entity = [NSEntityDescription entityForName:LEVELS_TABLE inManagedObjectContext:[self managedObjectContext]];
        [fetchRequest setEntity:entity];
        
        [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"categoryID == %i ",categoriesDB.categoryID]];
        
        NSArray *fetchedObjects2 = [[self managedObjectContext] executeFetchRequest:fetchRequest error:&error];
        
        float max = [fetchedObjects2 count];
        float doneCount = 0;
        float starCount = 0;
        for(int i = 0; i < max; i++ ) {
            levelsDB = [fetchedObjects2 objectAtIndex:i];
            if([levelsDB.isDone intValue] > 0 ) {
                doneCount++;
            }
            starCount += [levelsDB.star intValue];

        }
        [categoriesDB setDone:[NSNumber numberWithInt:doneCount]];
        
       // categoriesDB.star = [NSNumber numberWithInt:starCount];
        
    }
    return fetchedObjects;
}



-(void)addLevel:(NSMutableDictionary *)dict {
    levelsDB = [NSEntityDescription
                insertNewObjectForEntityForName:LEVELS_TABLE
                inManagedObjectContext:[self managedObjectContext]];
    
    levelsDB.levelID = [dict valueForKey:@"levelID"];
    levelsDB.name = [dict valueForKey:@"name"];
    levelsDB.categoryID = [dict valueForKey:@"categoryID"];
    levelsDB.isDone = [dict valueForKey:@"isDone"];
    levelsDB.tiles = [dict valueForKey:@"tiles"];
    levelsDB.solution = [dict valueForKey:@"solution"];
    levelsDB.size = [dict valueForKey:@"size"];
    NSError *error;
    if (![managedObjectContext save:&error]) {
        // NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
    
}

-(int)donePercentage:(int)categoryID {
    NSFetchRequest *fetchRequest = [[[NSFetchRequest alloc] init] autorelease];
    NSEntityDescription *entity = [NSEntityDescription 
                                   entityForName:LEVELS_TABLE inManagedObjectContext:[self managedObjectContext]];
    [fetchRequest setEntity:entity];
    
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"categoryID == %i ", categoryID]];
	
    NSError *error;
    NSArray *fetchedObjects = [[self managedObjectContext] executeFetchRequest:fetchRequest error:&error];
    
    float max = [fetchedObjects count];
    if( max > 0 ) {
        float doneCount = 0;
        for(int i = 0; i < max; i++ ) {
            levelsDB = [fetchedObjects objectAtIndex:i];
            if([levelsDB.isDone intValue] > 0 ) {
                doneCount++;
            }
        }
        
        int percent = ((doneCount/max)*100);
        return percent;
    } else {
        return 0;
    }
}


-(void)setDonePuzzle:(int) levelID {
    NSError *error = nil;
    NSFetchRequest *fetch = [[[NSFetchRequest alloc] init] autorelease];
    [fetch setEntity:[NSEntityDescription entityForName:LEVELS_TABLE inManagedObjectContext:[self managedObjectContext]]];
	[fetch setPredicate:[NSPredicate predicateWithFormat:@"levelID == %i", levelID]];
    
    NSArray *levels = [managedObjectContext executeFetchRequest:fetch error:&error];
    
    
    if( [levels count] > 0 ) {
        levelsDB = [levels objectAtIndex:0];
        levelsDB.isDone = [NSNumber numberWithInt:1];
        if (![managedObjectContext save:&error]) {
            // NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
        } 
    }
}

-(void)setBestScore:(int) levelID time:(float) seconds steps:(int) steps {
    NSError *error = nil;
    NSFetchRequest *fetch = [[[NSFetchRequest alloc] init] autorelease];
    [fetch setEntity:[NSEntityDescription entityForName:LEVELS_TABLE inManagedObjectContext:[self managedObjectContext]]];
	[fetch setPredicate:[NSPredicate predicateWithFormat:@"levelID == %i", levelID]];
    
    NSArray *levels = [managedObjectContext executeFetchRequest:fetch error:&error];
    
    
    if( [levels count] > 0 ) {
        levelsDB = [levels objectAtIndex:0];
        if( [levelsDB.time intValue] > seconds || [levelsDB.time intValue] == 0 ) {
            levelsDB.time = [NSNumber numberWithFloat:seconds];
        }
        if( [levelsDB.steps intValue] > steps || [levelsDB.steps intValue] == 0 ) {
            levelsDB.steps = [NSNumber numberWithInt:steps];
        }
        if (![managedObjectContext save:&error]) {
            // NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
        } 
    }
}

-(void)enablePuzzle:(int) categoryId{
    NSError *error = nil;
    NSFetchRequest *fetch = [[[NSFetchRequest alloc] init] autorelease];
    [fetch setEntity:[NSEntityDescription entityForName:CATEGORIES_TABLE inManagedObjectContext:[self managedObjectContext]]];
	[fetch setPredicate:[NSPredicate predicateWithFormat:@"categoryID == %i", categoryId]];
    
    NSArray *levels = [managedObjectContext executeFetchRequest:fetch error:&error];
    
    
    if( [levels count] > 0 ) {
        categoriesDB = [levels objectAtIndex:0];
        categoriesDB.isEnabled = [NSNumber numberWithInt:1];
        if (![managedObjectContext save:&error]) {
            // NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
        } 
    }
}

- (NSManagedObjectContext *)managedObjectContext {
    
    if (managedObjectContext != nil) {
        return managedObjectContext;
    }
    
    managedObjectContext = [(AppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
    
    NSLog(@"%@" , managedObjectContext);
    
    return managedObjectContext;
}

-(NSArray *)getAllLevels: (int) categoryID {
    
    
    NSFetchRequest *fetchRequest = [[[NSFetchRequest alloc] init] autorelease];
    NSEntityDescription *entity = [NSEntityDescription 
                                   entityForName:LEVELS_TABLE inManagedObjectContext:[self managedObjectContext]];
    [fetchRequest setEntity:entity];
    
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"categoryID == %i ", categoryID]];
	
    NSError *error;
    NSArray *fetchedObjects = [[self managedObjectContext] executeFetchRequest:fetchRequest error:&error];
    
    
    return fetchedObjects;
}


-(int) puzzleSolved {
    
    NSFetchRequest *fetchRequest = [[[NSFetchRequest alloc] init] autorelease];
    NSEntityDescription *entity = [NSEntityDescription 
                                   entityForName:LEVELS_TABLE inManagedObjectContext:[self managedObjectContext]];
    [fetchRequest setEntity:entity];
    
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"isDone==1 "]];
    
	// Edit the sort key as appropriate.
	NSSortDescriptor *sortDescriptor = [[[NSSortDescriptor alloc] initWithKey:@"levelID" ascending:YES] autorelease];
	NSArray *sortDescriptors = [[[NSArray alloc] initWithObjects:sortDescriptor, nil] autorelease];
	
	[fetchRequest setSortDescriptors:sortDescriptors];
    NSError *error;
    NSArray *fetchedObjects = [[self managedObjectContext] executeFetchRequest:fetchRequest error:&error] ;
    
    
    return [fetchedObjects count];
}

-(NSDictionary *)getLevelInfo:(int)levelID {
    NSFetchRequest *fetchRequest = [[[NSFetchRequest alloc] init] autorelease];
    NSEntityDescription *entity = [NSEntityDescription 
                                   entityForName:LEVELS_TABLE inManagedObjectContext:[self managedObjectContext]];
    [fetchRequest setEntity:entity];
    
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"levelID == %i ", levelID]];
    
	// Edit the sort key as appropriate.
	NSSortDescriptor *sortDescriptor = [[[NSSortDescriptor alloc] initWithKey:@"levelID" ascending:YES] autorelease];
	NSArray *sortDescriptors = [[[NSArray alloc] initWithObjects:sortDescriptor, nil] autorelease];
	
	[fetchRequest setSortDescriptors:sortDescriptors];
    NSError *error;
    NSArray *fetchedObjects = [[self managedObjectContext] executeFetchRequest:fetchRequest error:&error];
    
    if( [fetchedObjects count] > 0 ) {
        return [fetchedObjects objectAtIndex:0];
        
    } else {
        return nil;
    }
    
}

-(NSString *)getTile:(int)levelID {
    NSFetchRequest *fetchRequest = [[[NSFetchRequest alloc] init] autorelease];
    NSEntityDescription *entity = [NSEntityDescription 
                                   entityForName:LEVELS_TABLE inManagedObjectContext:[self managedObjectContext]];
    [fetchRequest setEntity:entity];
    
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"levelID == %i ", levelID]];
    
	// Edit the sort key as appropriate.
	NSSortDescriptor *sortDescriptor = [[[NSSortDescriptor alloc] initWithKey:@"levelID" ascending:YES] autorelease];
	NSArray *sortDescriptors = [[[NSArray alloc] initWithObjects:sortDescriptor, nil] autorelease];
	
	[fetchRequest setSortDescriptors:sortDescriptors];
    NSError *error;
    NSArray *fetchedObjects = [[self managedObjectContext] executeFetchRequest:fetchRequest error:&error];
    
    if( [fetchedObjects count] > 0 ) {
        
        NSString *tileString = [[fetchedObjects objectAtIndex:0] valueForKey:@"tiles"];
        
       
        
        return tileString;
        
    } else {
        return nil;
    }
    
}

-(NSMutableArray *)getSolution:(int)levelID {
    NSFetchRequest *fetchRequest = [[[NSFetchRequest alloc] init] autorelease];
    NSEntityDescription *entity = [NSEntityDescription 
                                   entityForName:LEVELS_TABLE inManagedObjectContext:[self managedObjectContext]];
    [fetchRequest setEntity:entity];
    
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"levelID == %i ", levelID]];
    
	// Edit the sort key as appropriate.
	NSSortDescriptor *sortDescriptor = [[[NSSortDescriptor alloc] initWithKey:@"levelID" ascending:YES] autorelease];
	NSArray *sortDescriptors = [[[NSArray alloc] initWithObjects:sortDescriptor, nil] autorelease];
	
	[fetchRequest setSortDescriptors:sortDescriptors];
    NSError *error;
    NSArray *fetchedObjects = [[self managedObjectContext] executeFetchRequest:fetchRequest error:&error];
    
    if( [fetchedObjects count] > 0 ) {
        
        NSMutableArray *tiles = [[[NSMutableArray alloc] init] autorelease];
        
        NSString *tileString = [[fetchedObjects objectAtIndex:0] valueForKey:@"solution"];
        
        NSArray *tileSplit = [tileString componentsSeparatedByString:@"|"];
        
        for(int i = 0; i < [tileSplit count]; i++ ) {
            NSArray *nums = [[tileSplit objectAtIndex:i] componentsSeparatedByString:@","];
            
            [tiles addObject:nums];
            
        }
        
        return tiles;
        
    } else {
        return nil;
    }
    
}

+ (UIColor *) colorWithHexString: (NSString *) hex  
{  
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];  
    
    // String should be 6 or 8 characters  
    if ([cString length] < 6) return [UIColor grayColor];  
    
    // strip 0X if it appears  
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];  
    
    if ([cString length] != 6) return  [UIColor grayColor];  
    
    // Separate into r, g, b substrings  
    NSRange range;  
    range.location = 0;  
    range.length = 2;  
    NSString *rString = [cString substringWithRange:range];  
    
    range.location = 2;  
    NSString *gString = [cString substringWithRange:range];  
    
    range.location = 4;  
    NSString *bString = [cString substringWithRange:range];  
    
    // Scan values  
    unsigned int r, g, b;  
    [[NSScanner scannerWithString:rString] scanHexInt:&r];  
    [[NSScanner scannerWithString:gString] scanHexInt:&g];  
    [[NSScanner scannerWithString:bString] scanHexInt:&b];  
    
    return [UIColor colorWithRed:((float) r / 255.0f)  
                           green:((float) g / 255.0f)  
                            blue:((float) b / 255.0f)  
                           alpha:1.0f];  
} 

@end
