//
//  InsertionSortTest.swift
//  Algorithms
//
//  Created by Gene Dahilig on 2/16/16.
//  Copyright © 2016 Gene Dahilig. All rights reserved.
//

import XCTest
@testable import Algorithms

class InsertionSortTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func validAscending(arry : Array<Int>) -> Bool
    {
        for i in 1...arry.count-1
        {
            if arry[i] < arry[i-1]
            {
                return false;
            }
        }
        return true;
    }
    
    func test() {
        let  numberList: Array<Int> = [5,3,2320,10,2,100]
        print("Initial: \(numberList)")

        let list = InsertionSort.sort(numberList)
        
        print("Final: \(list)")
        XCTAssert(validAscending(list!),"Valid ascending list")
    }


}
