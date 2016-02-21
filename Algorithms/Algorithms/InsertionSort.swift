//
//  InsertionSort.swift
//  Algorithms
//
//  Created by Gene Dahilig on 2/16/16.
//  Copyright © 2016 Gene Dahilig. All rights reserved.
//

import Foundation
class InsertionSort
{
    class func sort(var numberList: Array<Int>) ->Array<Int>?
    {
        for key in 0..<numberList.count
        {
            for y in key+1..<numberList.count
            {
                if numberList[key] > numberList[y]
                {    // swap
                    let a = numberList.removeAtIndex(y)
                    numberList.insert(numberList[key], atIndex: y)
                    numberList[key] = a
                }
            }
        }
        return numberList
    }
}