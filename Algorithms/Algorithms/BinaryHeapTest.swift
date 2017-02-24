//
//  BinaryHeapTest.swift
//  Algorithms
//
//  Created by Gene Dahilig on 2/21/16.
//  Copyright © 2016 Gene Dahilig. All rights reserved.
//

import XCTest

class BinaryHeapTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // Test basic creation and initialization.
    func testCreation() {
        var node : HeapNode
        
        node = HeapNode(initial:10)
        XCTAssert(node.left == nil)
        XCTAssert(node.right == nil)
        XCTAssert(node.value == 10)
    }

    // Test depth
    func testGetTreeDepth() {
        var root : HeapNode
        root = HeapNode(initial:10)
        var depth = root.getTreeDepth()
        XCTAssert(depth == 1)
        
        root = self.buildTree_1()
        depth = root.getTreeDepth()
        
        XCTAssert(root.value == 10)
        XCTAssert(root.left != nil)
        XCTAssert(root.right == nil)
        XCTAssert(root.left!.value == 52)
        XCTAssert(depth == 2)
    }
    
    func testGetTreeDepth_2()
    {
        var root  : HeapNode
        var depth : Int
        
        root = self.buildTree_1()
        XCTAssert(root.value == 10)
        XCTAssert(root.left != nil)
        XCTAssert(root.right == nil)
        XCTAssert(root.left!.value == 52)

        depth = root.getTreeDepth()
        XCTAssert(depth == 2)
    }
    
    func testGetNodesAtDepth_0()
    {
        let root = self.buildTree_0()       // build a tree with on 1 node
        var rowNodes : [HeapNode] = []      // empty list of HeapNodes

        root.getNodesAtDepth( 0, currDepth: 0, rowNodes: &rowNodes)
        XCTAssert(rowNodes.count == 1)
        
        let node = rowNodes[0]
        XCTAssert(node.value == 10)
        
    }
    

    func testGetNodesAtDepth_DepthGreaterThanTree()
    {
        let root = self.buildTree_0()       // build a tree with on 1 node
        var rowNodes : [HeapNode] = []      // empty list of HeapNodes
        
        root.getNodesAtDepth( 2, currDepth: 0, rowNodes: &rowNodes)
        XCTAssert(rowNodes.count == 0)
        
    }
    
    func testGetNodesAtDepth_1()
    {
        let root = self.buildTree_1()       // build a tree with on 1 node
        var rowNodes : [HeapNode] = []      // empty list of HeapNodes
        
        root.getNodesAtDepth( 1, currDepth: 0, rowNodes: &rowNodes)
        XCTAssert(rowNodes.count == 1)
        
        let node = rowNodes[0]
        XCTAssert(node.value == 52)
        
    }
    
    
    func testGetNodesAtDepth_2()
    {
        let root = self.buildTree_2()       // build a tree with on 1 node
        var rowNodes : [HeapNode] = []      // empty list of HeapNodes
        
        root.getNodesAtDepth( 1, currDepth: 0, rowNodes: &rowNodes)
        XCTAssert(rowNodes.count == 2)
        
        var node = rowNodes[0]
        XCTAssert(node.value == 52)
        node = rowNodes[1]
        XCTAssert(node.value == 40)
    }

    
    func testGetNodesAtDepth_3()
    {
        let root = self.buildTree_3()       // build a tree with on 1 node
        var rowNodes : [HeapNode] = []      // empty list of HeapNodes
        var node : HeapNode
        
        // depth 0
        root.getNodesAtDepth( 0, currDepth: 0, rowNodes: &rowNodes)
        XCTAssert(rowNodes.count == 1)
        
        node = rowNodes[0]
        XCTAssert(node.value == 10)
        
        // depth 1
        rowNodes.removeAll()
        root.getNodesAtDepth( 1, currDepth: 0, rowNodes: &rowNodes)
        XCTAssert(rowNodes.count == 2)
        node = rowNodes[0]
        XCTAssert(node.value == 52)
        node = rowNodes[1]
        XCTAssert(node.value == 40)

        // depth 2
        rowNodes.removeAll()
        root.getNodesAtDepth( 2, currDepth: 0, rowNodes: &rowNodes)
        XCTAssert(rowNodes.count == 4)
        XCTAssert(rowNodes[0].value == 16)
        XCTAssert(rowNodes[1].value == 100)
        XCTAssert(rowNodes[2].value == 11)
        XCTAssert(rowNodes[3].value == 30)

        // depth 3
        rowNodes.removeAll()
        root.getNodesAtDepth( 3, currDepth: 0, rowNodes: &rowNodes)
        XCTAssert(rowNodes.count == 2)
        XCTAssert(rowNodes[0].value == 26)
        XCTAssert(rowNodes[1].value == 18)
        
        // Test depth larger than tree.
        rowNodes.removeAll()
        root.getNodesAtDepth( 10, currDepth: 0, rowNodes: &rowNodes)
        XCTAssert(rowNodes.count == 0)
        
    }

    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
    /// Requirement: Binary heaps are *complete* binary trees.  The following build tree methods must build *complete* binary tree.
    // Build a simple tree with only 1 node.
    /* build a tree
            10
           /  \
        nil    nil
    */
    
    func buildTree_0() -> HeapNode
    {
        return HeapNode(initial:10)
    }
    
    /* build a tree
           10
          /
        52
    
    */
    func buildTree_1() -> HeapNode
    {
        let root  = HeapNode(initial:10)
        let child = HeapNode(initial:52)
        
        root.left = child
        
        return root
    }
    
    /* build a tree
            10
           /  \
         52   40
    
    */
    func buildTree_2() -> HeapNode
    {
        let root   = HeapNode(initial:10)
        let child  = HeapNode(initial:52)
        let child2 = HeapNode(initial:40)
        root.left  = child
        root.right = child2
        
        return root
    }

    /* build a tree
                      10
                    /   \
                   /     \
                 52       40
                /  \     /  \
              16  100   11   30
             /  \
            26  18
    */
    
    func buildTree_3() -> HeapNode
    {
        let root    = HeapNode(initial: 10)
        let child1  = HeapNode(initial: 52)
        let child2  = HeapNode(initial: 40)
        let child3  = HeapNode(initial: 16)
        let child4  = HeapNode(initial: 100)
        let child5  = HeapNode(initial: 11)
        let child6  = HeapNode(initial: 30)
        let child7  = HeapNode(initial: 26)
        let child8  = HeapNode(initial: 18)


        root.left = child1
        root.right = child2
        child1.left = child3
        child1.right = child4
        
        child2.left = child5
        child2.right = child6
        
        child3.left = child7
        child3.right = child8
        
        return root
    }
    
}
