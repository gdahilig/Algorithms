//
//  MergeSorting.h
//  TestProgramming0
//
//  Created by Gene Dahilig on 1/2/15.
//  Copyright (c) 2015 Gene Dahilig. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MergeSorting : NSObject

-(void)Sort:(NSMutableArray*)arry low:(int)low high:(int)high;
-(bool)isSorted:(NSArray*)arry;
@end
