//
//  TileBoardView.m
//  Filomino
//
//  Created by Jeffrey Monte on 17/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TileBoardView.h"

@implementation TileBoardView

@synthesize currentView;
@synthesize isEraseMode;

- (id)initWithFrame:(CGRect)frame levelID:(int) level
{
    self = [super initWithFrame:frame];
    if (self) {
        
        float x = 0;
        float y = 0;
        
        NSMutableArray *tilesNumber = [[NSMutableArray alloc] init];
        
        if(dataManage == nil ) {
            dataManage = [(AppDelegate *)[[UIApplication sharedApplication] delegate] dataManagement]; 
        }
        
        
        NSString *tileString = [dataManage getTile:level];
        NSArray *tileSplit = [tileString componentsSeparatedByString:@"|"];
        for(int i = 0; i < [tileSplit count]; i++ ) {
            NSArray *nums = [[tileSplit objectAtIndex:i] componentsSeparatedByString:@","];
            [tilesNumber addObject:nums];
        }
        
        int  dimension_x = [tileSplit count];
        int dimension_y = [tileSplit count];
        float tile_width = self.frame.size.width / dimension_x;
        
        paths = [[NSMutableArray alloc] init];
        
        tileList = [[NSMutableArray alloc] init];
        for(int i = 0 ; i < dimension_y ; i++) {
            NSMutableArray *tileRow = [[NSMutableArray alloc] init];
            for(int j = 0 ; j < dimension_x ; j++ ) {
                
                int currentTileNumber = [[[tilesNumber objectAtIndex:i] objectAtIndex:j] intValue];
                
                TileView *tile = [[TileView alloc] initWithFrame:CGRectMake(x, y, tile_width, tile_width) number:currentTileNumber];
                
                if(currentTileNumber > 0 ) {
                    tile.isDeletable = NO;
                } else {
                    tile.isDeletable = YES;
                }
                
                [self addSubview:tile];
                [tileRow addObject:tile];
                x+= tile_width;
            }
            y +=tile_width;
            x = 0;
            [tileList addObject:tileRow];
        }
        
        // assign up,left, right ,down
        for(int i = 0 ; i < dimension_y ; i++) {
            for(int j = 0 ; j < dimension_x ; j++ ) {
                // assign left
                TileView *t = [[tileList objectAtIndex:i] objectAtIndex:j];
                if( j -1 >= 0 ) {
                    t.left = [[tileList objectAtIndex:i] objectAtIndex:(j-1)];
                } else {
                    t.left = nil;
                }
                // assign up
                if( i -1 >= 0 ) {
                    t.up = [[tileList objectAtIndex:(i-1)] objectAtIndex:j];
                } else {
                    t.up = nil;
                }
                // assign right
                if( j +1 < dimension_x ) {
                    t.right = [[tileList objectAtIndex:i] objectAtIndex:(j+1)];
                } else {
                    t.right = nil;
                }
                // assign down
                if( i +1 < dimension_y ) {
                    t.down = [[tileList objectAtIndex:(i+1)] objectAtIndex:j];
                } else {
                    t.down = nil;
                }
            }
        }
        
        
        // check for any solve group
        for(int i = 0 ; i < dimension_y ; i++) {
            for(int j = 0 ; j < dimension_x ; j++ ) {
                TileView *t = [[tileList objectAtIndex:i] objectAtIndex:j];
                
                tempPaths = [[NSMutableArray alloc] init];
                
                if( !t.isSolve ) {
                    
                    [t retain];
                    
                    [tempPaths addObject:t];
                  
                    if( t.tileNumber == [self checkGroup:t tileNumber:t.tileNumber numGroup:1] ) {
                        for (int i = 0 ; i < [tempPaths count]; i++) {
                            TileView *tile = [tempPaths objectAtIndex:i];
                            tile.isSolve = YES;
                            
                            // reset to default opening
                            tile.upOpen = NO;
                            tile.downOpen = NO;
                            tile.rightOpen = NO;
                            tile.leftOpen = NO;
                            if( [tempPaths containsObject:tile.up] ) {
                                tile.upOpen = YES;
                            }
                            if( [tempPaths containsObject:tile.down] ) {
                                tile.downOpen = YES;
                            }
                            if( [tempPaths containsObject:tile.right] ) {
                                tile.rightOpen = YES;
                            }
                            if( [tempPaths containsObject:tile.left] ) {
                                tile.leftOpen = YES;
                            }
                            [tile setNeedsDisplay];
                        }
                    }
                    
                    t.isCheck = YES;
                    
                }
                
            }
        }
        
        [tempPaths release];
        [self resetCheck];
    }
    return self;
}

-(void) resetCheck {
    for(int i = 0 ; i < [tileList count] ; i++) {
        for(int j = 0 ; j < [[tileList objectAtIndex:0] count] ; j++ ) {
            TileView *t = [[tileList objectAtIndex:i] objectAtIndex:j];
            t.isCheck = NO;
        }
    }
}


-(void) addToPath: (TileView *) tile tileNumber:(int) tileNumber {
    if( !tile.isCheck ) {
        tile.isCheck = YES;
        if( tile.up.tileNumber!= 0 && tile.up.tileNumber == tileNumber && ![currentPath containsObject:tile.up]  ) {
            [currentPath addObject:tile.up];
            [self addToPath:tile.up tileNumber:tileNumber];
        }
        if( tile.down.tileNumber!= 0 && tile.down.tileNumber == tileNumber && ![currentPath containsObject:tile.down]  ) {
            [currentPath addObject:tile.down];
            [self addToPath:tile.down tileNumber:tileNumber];
        }
        if( tile.left.tileNumber!= 0 && tile.left.tileNumber == tileNumber && ![currentPath containsObject:tile.left]  ) {
            [currentPath addObject:tile.left];
            [self addToPath:tile.left tileNumber:tileNumber];
        }
        if( tile.right.tileNumber!= 0 && tile.right.tileNumber == tileNumber && ![currentPath containsObject:tile.right]  ) {
            [currentPath addObject:tile.right];
            [self addToPath:tile.right tileNumber:tileNumber];
        }
        
    }
}

-(int) checkGroup:(TileView *)tile tileNumber:( int )tileNumber numGroup:( int )numGroup  {
   
    if( !tile.isCheck && tile!= nil ) {
        tile.isCheck = YES;
        if( tile.up.tileNumber!= 0 && tile.up.tileNumber == tileNumber && ![tempPaths containsObject:tile.up] ) {
            numGroup++;
            TileView *tem = tile.up;
            [tempPaths addObject:tile.up]; // add it on the tempPaths
            numGroup = [self checkGroup:tem tileNumber:tileNumber numGroup:numGroup];
        }
        
        if( tile.down.tileNumber!= 0 && tile.down.tileNumber == tileNumber && ![tempPaths containsObject:tile.down] ) {
            numGroup++;
            TileView *tem = tile.down;
            [tempPaths addObject:tile.down]; // add it on the tempPaths
            numGroup = [self checkGroup:tem tileNumber:tileNumber numGroup:numGroup];
        }
        
        
        if( tile.left.tileNumber!= 0 && tile.left.tileNumber == tileNumber && ![tempPaths containsObject:tile.left] ) {
            numGroup++;
            TileView *tem = tile.left; 
            [tempPaths addObject:tile.left]; // add it on the tempPaths
            numGroup = [self checkGroup:tem tileNumber:tileNumber numGroup:numGroup];
        }
        
        if( tile.right.tileNumber!= 0 && tile.right.tileNumber == tileNumber && ![tempPaths containsObject:tile.right] ) {
            numGroup++;
            TileView *tem = tile.right;
            [tempPaths addObject:tile.right]; // add it on the tempPaths
            numGroup = [self checkGroup:tem tileNumber:tileNumber numGroup:numGroup];
        }
        
    }
    return numGroup;
}


-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    // intercept touches
    if ([self pointInside:point withEvent:event]) {
        return self;        
    }
    return nil;
}


-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UIView* view = [super hitTest: [[touches anyObject] locationInView: self] withEvent: nil];

    // highlight subview under touch
    if (view != nil && view != self) {
        if( [view isKindOfClass:[TileView class]] ) {
            
            /*
             1. Check if tile isSolve
             2. if tile has not tile number
             3.         assign it to 1
             5. assign it as currentview
             
             */
            
            currentPath = [[NSMutableArray alloc] init];
            isStartedBlank = NO;
            hasPathCreated = NO;
            currentPathSize = 0;
            
            TileView *tile = (TileView *) view;
            
            
            if( self.isEraseMode ) {
                
                NSLog(@"Paths 0");
                if( [paths count] > 0 ) {
                    
                    NSLog(@"Paths");
                    
                    for(int i = 0 ; i < [paths count];i++ ) {
                        if( [[paths objectAtIndex:i] containsObject:tile] ) {
                            NSMutableArray *pathDelete = [paths objectAtIndex:i];
                            for(int i = 0 ; i < [pathDelete count]; i++ ) {
                                TileView *tile = [pathDelete objectAtIndex:i];
                                if( tile.isDeletable ) {
                                    tile.tileNumber = 0;
                                }
                                tile.isSolve = NO;
                                [tile setNeedsDisplay];
                            }
                            [paths removeObjectAtIndex:i];
                        }
                    }
                }
            } else {
                
                if( !tile.isSolve ) {
                    if( tile.tileNumber == 0 ) {
                        tile.tileNumber = 1;
                        [tile setNeedsDisplay];
                        isStartedBlank = YES;
                    } else {
                        if ( tile.tileNumber == 1 ) {
                            tile.isSolve = YES;
                        } else {
                            // check if the surrounding tiles has the same number as current tile
                            [self addToPath:tile tileNumber:tile.tileNumber];
                        }
                        currentPathSize = tile.tileNumber;
                    }
                    self.currentView = tile;
                    if( ![currentPath containsObject:tile] ) {
                        [currentPath addObject:tile];
                    }
                } // tile is Solve
                
            } // is no on erase mode    
        }
    } // if it is a valid view
    
    
    self.isEraseMode = NO; // always set this one
}

-(void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {

}

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UIView* view = [super hitTest: [[touches anyObject] locationInView: self] withEvent: nil];

    if (view != [self currentView]) {
        if( [view isKindOfClass:[TileView class]] && !hasPathCreated ) { // checks if it is a TileView and no path has created
            
            TileView *tile = (TileView *) view;
        /*
         1. Check if the Tile is Empty
         2. Check if the Tile is Up , left, right, down of currentView and the current path is solved
         3. Change tile to the current tile number
         4. Add the tile to the current path
         5. check if the path is now solved
         . set currentview to the moved tile
         */
            if( tile.tileNumber == 0 ) {
                
                if( ( tile == self.currentView.up ||
                   tile == self.currentView.down ||
                   tile == self.currentView.right ||
                   tile == self.currentView.left) && (  [currentPath count] < self.currentView.tileNumber || isStartedBlank ) ) {
                    
                    [currentPath addObject:tile];
                    if( isStartedBlank ) {
                        // if started blank , set all the numbers to the new size
                        int pathSize = [currentPath count];
                        for( int i = 0 ;i < pathSize ; i++ ) {
                            TileView *temp = [currentPath objectAtIndex:i];
                            temp.tileNumber = pathSize;
                            [temp setNeedsDisplay];
                        }
                        
                    } else {
                        tile.tileNumber = self.currentView.tileNumber;
                        [self addToPath:tile tileNumber:tile.tileNumber];
                        [self resetCheck];
                        // check if currentPath is now the correct size
                        if( [currentPath count] == tile.tileNumber ) {
                            for (int i = 0 ; i < [currentPath count]; i++) {
                                TileView *tile = [currentPath objectAtIndex:i];
                                tile.isSolve = YES;
                                
                                // reset to default opening
                                tile.upOpen = NO;
                                tile.downOpen = NO;
                                tile.rightOpen = NO;
                                tile.leftOpen = NO;
                                if( [currentPath containsObject:tile.up] ) {
                                    tile.upOpen = YES;
                                }
                                if( [currentPath containsObject:tile.down] ) {
                                    tile.downOpen = YES;
                                }
                                if( [currentPath containsObject:tile.right] ) {
                                    tile.rightOpen = YES;
                                }
                                if( [currentPath containsObject:tile.left] ) {
                                    tile.leftOpen = YES;
                                }
                                [tile setNeedsDisplay];
                            }
                            // current path created!
                            [paths addObject:currentPath];
                            currentPath = nil;
                            hasPathCreated = YES;
                        } else {
                            [tile setNeedsDisplay];
                        }
                        
                    } // path is not started on a blank tile
                    
                    
                    self.currentView = tile;
                }
                
            } // tile is not empty
        } // tile is not kind of class TileView
    } // tile is currentview
}
    
-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [super hitTest: [[touches anyObject] locationInView: self] withEvent: nil];
    for (UIView *subview in [self subviews]) {
       if ([subview isKindOfClass:[TileView class]] && subview == [self currentView]) {
           
           /*
            1. Check if the current path conflicts with the other grids
            
            2. check if the current path has 1
            
            
            */
           
           if( isStartedBlank ) {
               BOOL isConflict = NO;
               
               for(int i = 0 ; i < [currentPath count]; i++ ) {
                   TileView *tile = [currentPath objectAtIndex:i];
                   if( ![currentPath containsObject:tile.up] 
                        && tile.tileNumber == tile.up.tileNumber ) {
                       isConflict = YES;
                   }
                   if( ![currentPath containsObject:tile.down] 
                      && tile.tileNumber == tile.down.tileNumber ) {
                       isConflict = YES;
                   }
                   if( ![currentPath containsObject:tile.right] 
                      && tile.tileNumber == tile.right.tileNumber ) {
                       isConflict = YES;
                   }
                   if( ![currentPath containsObject:tile.left] 
                      && tile.tileNumber == tile.left.tileNumber ) {
                       isConflict = YES;
                   }
               }
               [paths addObject:currentPath];
               if( isConflict ) {
                   // remove path
                   for(int i = 0 ; i < [currentPath count]; i++ ) {
                       TileView *tile = [currentPath objectAtIndex:i];
                       tile.isSolve = NO;
                       tile.tileNumber = 0;
                       [tile setNeedsDisplay];
                   }
               } else {
                   // finalize path
                   
                   if( [currentPath count] == 1 ) {
                       TileView *tile = [currentPath objectAtIndex:0];
                       tile.isSolve = YES;
                       [tile setNeedsDisplay];
                   } else {
                       for (int i = 0 ; i < [currentPath count]; i++) {
                           TileView *tile = [currentPath objectAtIndex:i];
                           tile.isSolve = YES;
                           
                           // reset to default opening
                           tile.upOpen = NO;
                           tile.downOpen = NO;
                           tile.rightOpen = NO;
                           tile.leftOpen = NO;
                           if( [currentPath containsObject:tile.up] ) {
                               tile.upOpen = YES;
                           }
                           if( [currentPath containsObject:tile.down] ) {
                               tile.downOpen = YES;
                           }
                           if( [currentPath containsObject:tile.right] ) {
                               tile.rightOpen = YES;
                           }
                           if( [currentPath containsObject:tile.left] ) {
                               tile.leftOpen = YES;
                           }
                           [tile setNeedsDisplay];
                       }
                   }
                   [paths addObject:currentPath];
                   
                   
               }
               currentPath = nil;
           } else {
               // check if a path is created
               [self addToPath:self.currentView tileNumber:self.currentView.tileNumber];
               
               
               NSLog(@"%@" , currentPath);
               
               if([currentPath count] == self.currentView.tileNumber) {
                   
                   self.currentView.isCheck = YES;
                   
                   
                   if( [currentPath count] == 1 ) {
                       TileView *tile = [currentPath objectAtIndex:0];
                       tile.isSolve = YES;
                       [tile setNeedsDisplay];
                   } else {
                       for (int i = 0 ; i < [currentPath count]; i++) {
                           TileView *tile = [currentPath objectAtIndex:i];
                           tile.isSolve = YES;
                           // reset to default opening
                           tile.upOpen = NO;
                           tile.downOpen = NO;
                           tile.rightOpen = NO;
                           tile.leftOpen = NO;
                           if( [currentPath containsObject:tile.up] ) {
                               tile.upOpen = YES;
                           }
                           if( [currentPath containsObject:tile.down] ) {
                               tile.downOpen = YES;
                           }
                           if( [currentPath containsObject:tile.right] ) {
                               tile.rightOpen = YES;
                           }
                           if( [currentPath containsObject:tile.left] ) {
                               tile.leftOpen = YES;
                           }
                           [tile setNeedsDisplay];
                       }
                   }
                   
                   [paths addObject:currentPath];
                   currentPath = nil;
                   [self resetCheck];
               }
               
           } // it was not started as a blank tile
           
           
           
       }
    }
    [self resetCheck];
    self.currentView = nil;
}


-(void)undo {
    
    if( currentPath != nil ) {
        for(int i = 0 ; i < [currentPath count]; i++ ) {
            TileView *tile = [currentPath objectAtIndex:i];
            if( tile.isDeletable ) {
                tile.tileNumber = 0;
            }
            tile.isSolve = NO;
            [tile setNeedsDisplay];
        }
        currentPath = nil;
    } else {
        if( [paths count] > 0 ) {
            NSMutableArray *pathDelete = [paths lastObject];
            for(int i = 0 ; i < [pathDelete count]; i++ ) {
                TileView *tile = [pathDelete objectAtIndex:i];
                if( tile.isDeletable ) {
                    tile.tileNumber = 0;
                }
                tile.isSolve = NO;
                [tile setNeedsDisplay];
            }
            [paths removeLastObject];
        }
    }
}

-(void) erase {
    self.isEraseMode = YES;
}

@end
