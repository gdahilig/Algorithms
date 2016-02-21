//
//  Node.swift
//  Algorithms
//
//  Created by Gene Dahilig on 2/18/16.
//  Copyright © 2016 Gene Dahilig. All rights reserved.
//

import Foundation
import Cocoa

class Node
{
    var value: Int = 0
    var left: Node?
    var right: Node?
    
    init(Val:Int)
    {
        value = Val
    }
    
    func Visit() -> String
    {
        let str = ".\(value)."
        return str
    }
    
    func traversal_inorder() ->String
    {
        var leftString : String
        var rightString : String
        
        if self.left != nil
        {
            leftString = self.left!.traversal_inorder()
        }
        else
        {
            leftString = ""
        }
        if self.right != nil
        {
            rightString = self.right!.traversal_inorder()
        }
        else
        {
            rightString = ""
        }
        
        return  leftString + self.Visit() + rightString
    }
    
    func traversal_reverseOrder() ->String?{
        var leftString : String
        var rightString : String
        
        if self.left != nil
        {
            leftString = self.left!.traversal_inorder()
        }
        else
        {
            leftString = ""
        }
        if self.right != nil
        {
            rightString = self.right!.traversal_inorder()
        }
        else
        {
            rightString = ""
        }
        
        return  rightString + self.Visit() + leftString
    }

    
    func traversal_preOrder() ->String?
    {
        var leftTraversal = ""
        var rightTraversal = ""
        if self.left != nil
        {
            leftTraversal = self.left!.traversal_preOrder()!
        }

        if self.right != nil
        {
            rightTraversal = self.right!.traversal_preOrder()!
        }
        return Visit() + leftTraversal + rightTraversal
        
    }
    
    func traversal_postOrder() ->String?
    {
        var leftTraversal = ""
        var rightTraversal = ""
        if self.left != nil
        {
            leftTraversal = self.left!.traversal_postOrder()!
        }
        
        if self.right != nil
        {
            rightTraversal = self.right!.traversal_postOrder()!
        }
        return leftTraversal + rightTraversal + Visit()
    }
    
    func add(node: Node)
    {
        if node.value == value
        {
            return
        }
        else if node.value < value
        {
            if self.left == nil
            {
                self.left = node
            }
            else
            {
                self.left?.add(node)
            }
        }
        else
        {
            if self.right == nil
            {
                self.right = node
            }
            else
            {
                self.right?.add(node)
            }
        }
    }
    
    func add(value: Int) -> Node
    {
        let newNode = Node(Val:value)
        self.add(newNode)
        return newNode
        
    }
}