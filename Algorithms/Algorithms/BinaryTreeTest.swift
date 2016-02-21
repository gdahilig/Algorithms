//
//  BinaryTreeTest.swift
//  Algorithms
//
//  Created by Gene Dahilig on 2/18/16.
//  Copyright © 2016 Gene Dahilig. All rights reserved.
//

import XCTest
@testable import Algorithms

class BinaryTreeTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testNodeCreation() {
        let nodeRoot = Node(Val: 10)
        XCTAssert (nodeRoot.value == 10 )
        XCTAssert(nodeRoot.left == nil)
        XCTAssert(nodeRoot.right == nil)
    }

    func testNodeVisit()
    {
        let nodeRoot = Node(Val: 10)
        let str = nodeRoot.Visit()
        
        XCTAssert(str == ".10.")  // dots added for formatting
    }
    
    func testNode_AddSmallerValue()
    {
        let nodeRoot = Node(Val: 10)
        let node = Node(Val:2)
        nodeRoot.add(node)
        XCTAssert(nodeRoot.left != nil, "Point to new value: 2")
        XCTAssert(nodeRoot.right == nil, "Should stay nil")
        XCTAssert(nodeRoot.left?.value == 2, "Value of new node")
        
    }

    func testNode_AddSmallerValueB()
    {
        let nodeRoot = Node(Val: 10)
        nodeRoot.add(2)
        XCTAssert(nodeRoot.left != nil, "Point to new value: 2")
        XCTAssert(nodeRoot.right == nil, "Should stay nil")
        XCTAssert(nodeRoot.left?.value == 2, "Value of new node")
        
    }
    
    func testNode_AddSmallerSmallerValue()
    {
        let nodeRoot = Node(Val: 10)
        nodeRoot.add(2)
        XCTAssert(nodeRoot.left != nil, "Point to new value: 2")
        XCTAssert(nodeRoot.right == nil, "Should stay nil")
        XCTAssert(nodeRoot.left?.value == 2, "Value of new node")

        nodeRoot.add(0)
        XCTAssert(nodeRoot.left!.left != nil, "2.left points to new value: 0")
        XCTAssert(nodeRoot.left!.left!.left == nil, "Should stay nil")
        XCTAssert(nodeRoot.left!.left!.right == nil, "Should stay nil")
        XCTAssert(nodeRoot.left!.left!.value == 0, "Value of new node")
        
    }

    func testNode_AddLargerValue()
    {
        let nodeRoot = Node(Val: 10)
        let node = Node(Val:200)
        nodeRoot.add(node)
        XCTAssert(nodeRoot.left == nil, "Should stay nil")
        XCTAssert(nodeRoot.right != nil, "Point to new value: 200")
        XCTAssert(nodeRoot.right?.value == 200, "Value of new node")
    }
    
    func testNode_AddLargerValueB()
    {
        let nodeRoot = Node(Val: 10)
        nodeRoot.add(200)
        XCTAssert(nodeRoot.left == nil, "Should stay nil")
        XCTAssert(nodeRoot.right != nil, "Point to new value: 200")
        XCTAssert(nodeRoot.right?.value == 200, "Value of new node")
    }
    
    func testNode_AddSmallerAndLargerValue()
    {
        let nodeRoot = Node(Val: 10)
        nodeRoot.add(2)
        XCTAssert(nodeRoot.left != nil, "Point to new value: 2")
        XCTAssert(nodeRoot.right == nil, "Should stay nil")
        XCTAssert(nodeRoot.left?.value == 2, "Value of new node")
        
        nodeRoot.add(8)
        XCTAssert(nodeRoot.left!.right != nil, "2.left points to new value: 8")
        XCTAssert(nodeRoot.left!.right!.left == nil, "Should stay nil")
        XCTAssert(nodeRoot.left!.right!.right == nil, "Should stay nil")
        XCTAssert(nodeRoot.left!.right!.value == 8, "Value of new node")
        
    }
    
    func testNodeInOrderTraversal_1()
    {
        let nodeRoot = Node(Val: 10)
        let strVisit = nodeRoot.traversal_inorder()
        XCTAssert(strVisit == ".10.")
    }
    
    func testNodeInOrderTraversal_2()
    {
        let nodeRoot = Node(Val: 10)
        var strVisit = nodeRoot.traversal_inorder()
        XCTAssert(strVisit == ".10.")
        
        let nodeLess = Node(Val:2)
        let nodeMore = Node(Val:200)

        nodeRoot.add(nodeLess)
        strVisit = nodeRoot.traversal_inorder()
        XCTAssert(strVisit == ".2..10.")
        
    }
    func testNodeInOrderTraversion_3()
    {
        let nodeRoot = Node(Val: 10)
        nodeRoot.add(2)
        XCTAssert(nodeRoot.left != nil, "Point to new value: 2")
        XCTAssert(nodeRoot.right == nil, "Should stay nil")
        XCTAssert(nodeRoot.left?.value == 2, "Value of new node")
        
        nodeRoot.add(0)
        let strTraversal = nodeRoot.traversal_inorder()
        XCTAssert(strTraversal == ".0..2..10.")
    }
    
    func testNodeInOrderTraversal_4()
    {
        let nodeRoot = Node(Val: 10)
        nodeRoot.add(2)
        nodeRoot.add(200)
        nodeRoot.add(0)
        nodeRoot.add(8)
        nodeRoot.add(1)
        nodeRoot.add(3)
        let strTraversal = nodeRoot.traversal_inorder()
        XCTAssert(strTraversal == ".0..1..2..3..8..10..200.")
    }
    
    func testNodeInOrderTraversal_5()
    {
        let nodeRoot = Node(Val: 10)
        nodeRoot.add(2)
        nodeRoot.add(200)
        nodeRoot.add(0)
        nodeRoot.add(8)
        nodeRoot.add(1)
        nodeRoot.add(3)
        let strTraversal = nodeRoot.traversal_inorder()
        XCTAssert(strTraversal == ".0..1..2..3..8..10..200.")
    }
    
    func testNode_PreOrderTraversal_1()
    {
        let nodeRoot = Node(Val: 10)
        let strTraversal = nodeRoot.traversal_preOrder()
        XCTAssert(strTraversal == ".10.")
    }

    func testNode_PreOrderTraversal_2()
    {
        let nodeRoot = Node(Val: 10)
        nodeRoot.add(2)
        let strTraversal = nodeRoot.traversal_preOrder()
        XCTAssert(strTraversal == ".10..2.")
    }
    
    // test 3 nodes: root + 1 left & 1 right
    func testNode_PreOrderTraversal_3()
    {
        let nodeRoot = Node(Val: 10)
        nodeRoot.add(2)
        nodeRoot.add(200)
        
        let strTraversal = nodeRoot.traversal_preOrder()
        XCTAssert(strTraversal == ".10..2..200.")
    }
    
    func testNode_PreOrderTraversal_4()
    {
        let nodeRoot = Node(Val: 10)
        nodeRoot.add(2)
        nodeRoot.add(200)
        nodeRoot.add(0)
        nodeRoot.add(8)
        nodeRoot.add(1)
        nodeRoot.add(3)
        let strTraversal = nodeRoot.traversal_preOrder()
        XCTAssert(strTraversal == ".10..2..0..1..8..3..200.")
    }
    // test 3 nodes: root + 2 right nodes.
    func testNode_PreOrderTraversal_RightNodes()
    {
        let nodeRoot = Node(Val: 10)
        nodeRoot.add(200)
        nodeRoot.add(300)
        let strTraversal = nodeRoot.traversal_preOrder()
        XCTAssert(strTraversal == ".10..200..300.")
    }
    
    func testNode_PostOrderTraversal_1()
    {
        let nodeRoot = Node(Val: 10)
        let strTraversal = nodeRoot.traversal_postOrder()
        XCTAssert(strTraversal == ".10.")
    }

    // test with 3 nodes: root + left & right
    func testNode_PostOrderTraversal_2()
    {
        let nodeRoot = Node(Val: 10)
        nodeRoot.add(2)
        nodeRoot.add(200)
        
        let strTraversal = nodeRoot.traversal_postOrder()
        XCTAssert(strTraversal == ".2..200..10.")
    }
    
    func testNode_PostOrderTraversal_3()
    {
        let nodeRoot = Node(Val: 10)
        nodeRoot.add(2)
        nodeRoot.add(200)
        nodeRoot.add(0)
        nodeRoot.add(8)
        nodeRoot.add(1)
        nodeRoot.add(3)
        let strTraversal = nodeRoot.traversal_postOrder()
        XCTAssert(strTraversal == ".1..0..3..8..2..200..10.")
    }
}
