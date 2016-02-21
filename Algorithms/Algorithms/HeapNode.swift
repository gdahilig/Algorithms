//
//  HeapNode.swift
//  Implements Binary Heap.  
//  For a great description of a binary heap, go here:
//      https://en.wikipedia.org/wiki/Binary_heap
//
//  Algorithms
//
//  Created by Gene Dahilig on 2/19/16.
//  Copyright © 2016 Gene Dahilig. All rights reserved.
//

import Foundation


class HeapNode
{
    var left : HeapNode?
    var right: HeapNode?
    var value: Int
    
    init (let initial: Int)
    {
        value = initial
    }
    
    func insert(node: HeapNode)
    {
        
    }
    
    func extract_min() -> HeapNode?
    {
        return nil
    }
    
    func findLastParentNode(node: HeapNode) -> HeapNode?
    {
        return nil
    }
    
    func getLastRow(node: HeapNode) -> HeapNode?
    {
        return nil
    }
    
    /*
        Finds the depth from the current node.
    
        Depth is based off the lowest left node.  
        Because Binary Heaps are by definition complete binary trees, nodes are always added from left to right.  therefore, the lowest left-most node, is the depth.
    
    
    */
    func getTreeDepth() -> Int
    {
        var node : HeapNode?
        node = self
        var depth = 0
        
        while node != nil
        {
            depth += 1
            node = node!.left
        }
        return depth
    }
    
    /*
        Validates Binary Tree Completeness.
        returns True if complete
                False if not
    */
    func isTreeComplete() -> Bool
    {
        return false
    }
}