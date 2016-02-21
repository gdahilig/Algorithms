//
//  MergeSorting.m
//  TestProgramming0
//
//  Created by Gene Dahilig on 1/2/15.
//  Copyright (c) 2015 Gene Dahilig. All rights reserved.
//

#import "MergeSorting.h"

@implementation MergeSorting

-(void)Sort:(NSMutableArray*)arry low:(int)low high:(int)high
{
    if (high==low)
        return;
        
//    int mid = (high-low + ((high-low)%2))/2;
    int mid = low + (high-low)/2;

    
    if (high-low >= 2)
    {
        [self Sort:arry low:low high:mid];
        // sort the right side
        [self Sort:arry low:mid+1 high:high];
    }
    [self Merge:arry low:low mid:mid high:high];
}

-(void)Merge:(NSMutableArray*)arry low:(int)low mid:(int)mid high:(int)high
{
    // copy to tmp
    NSArray* tmp = [NSMutableArray arrayWithArray:arry];
    
    int x=low;
    int y=mid+1;
    int idx=low;
    while ((x<mid+1) && (y<=high))
        if ([tmp[x] intValue] > [tmp[y] intValue])
            arry[idx++]=tmp[y++];
        else
            arry[idx++]=tmp[x++];

    if (x>mid)
        // copy remaining RHS
        for (int z=y; z<=high; z++)
            arry[idx++]=tmp[z];
    else
        for (int z=x;z<=mid;z++)
            arry[idx++] = tmp[z];
}

//checks valid ascending order
-(bool)isSorted:(NSMutableArray*)arry
{
    if ([arry count] <=1)
        return YES;
    
    for (int idx = 1; idx < [arry count]; idx++)
    {
        if ([[arry objectAtIndex:idx-1] intValue] > [[arry objectAtIndex:idx] intValue])
            return NO;
    }
    return YES;
}
@end
