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
    
    /// Requirement: Binary heaps are *complete* binary trees.  The following build tree methods must build *complete* binary tree.
    // Build a simple tree with only 1 node.
    func buildTree_0() -> HeapNode
    {
        return HeapNode(initial:10)
    }
    func buildTree_1() -> HeapNode
    {
        let root  = HeapNode(initial:10)
        let child = HeapNode(initial:52)
        
        root.left = child
        
        return root
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
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
