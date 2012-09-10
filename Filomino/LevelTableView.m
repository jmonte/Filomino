//
//  LevelTableView.m
//  Filomino
//
//  Created by Jeffrey Monte on 20/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LevelTableView.h"

@implementation LevelTableView

@synthesize levelDelegate;
@synthesize levels;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        self.dataSource = self;
        self.delegate = self;
        
        if(dataManage == nil ) {
            dataManage = [(AppDelegate *)[[UIApplication sharedApplication] delegate] dataManagement]; 
        }
        
        
        
        self.levels = [dataManage getAllLevels:1];
        
        NSLog(@"%i" , [self.levels count]);
        
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 250;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   
    
    return ([levels count]+([levels count]%3)) /3;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"LevelTableViewCell";
    
    
    LevelTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[LevelTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    cell.levelDelegate = self;
    
    
    int i1 = (indexPath.row)*3;
    int i2 = (indexPath.row)*3 +1;
    int i3 = (indexPath.row)*3 + 2;
    
    if( i1 < [self.levels count] ) {
        
        LevelsDB *level1 = [self.levels objectAtIndex:i1];
        
        cell.level1.isGold = [level1.isGold intValue]>0?YES:NO;
        cell.level1.levelName.text = level1.name;
        cell.level1.levelSize.text = level1.size;
        cell.level1.starNum = [level1.star intValue];
        cell.level1.tag = [level1.levelID intValue];
    } else {
        cell.level1.hidden =YES;
    }
    
    if( i2 < [self.levels count] ) {
        
        LevelsDB *level2 = [self.levels objectAtIndex:i2];
        
        cell.level2.isGold = [level2.isGold intValue]>0?YES:NO;
        cell.level2.levelName.text = level2.name;
        cell.level2.levelSize.text = level2.size;
        cell.level2.starNum = [level2.star intValue];
        cell.level2.tag = [level2.levelID intValue];    
    } else {
        cell.level2.hidden =YES;
    }
    
    if( i3 < [self.levels count] ) {
        
        LevelsDB *level3 = [self.levels objectAtIndex:i3];
        
        cell.level3.isGold = [level3.isGold intValue]>0?YES:NO;
        cell.level3.levelName.text = level3.name;
        cell.level3.levelSize.text = level3.size;
        cell.level3.starNum = [level3.star intValue];
        cell.level3.tag = [level3.levelID intValue];
    } else {
        cell.level3.hidden =YES;
    }
    
    
    
    return cell;
}

-(void)openLevel:(int)levelID {
    [levelDelegate openLevel:levelID];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
