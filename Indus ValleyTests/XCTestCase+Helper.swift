//
//  XCTest+Helper.swift
//  Indus Valley
//
//  Created by Håkon Bogen on 22/04/15.
//  Copyright (c) 2015 haaakon. All rights reserved.
//

import UIKit
import Foundation
import XCTest

extension XCTestCase {


    func arrayWithRandomCombinations() -> [String] {
        let letters = "kggramggrams"
        var stringArray = [String]()
        for i in 0...1000 {
            let randomLength = Int((arc4random_uniform(4)) + 1)
            var randomString = ""
            for j in 0..<randomLength {
                let randomIndex = Int(arc4random_uniform(UInt32(letters.lengthOfBytesUsingEncoding(NSASCIIStringEncoding))))
                let charAtRandomIndex = letters[randomIndex]
                randomString.append(charAtRandomIndex)
            }
            stringArray.append(randomString)
        }
        return stringArray
    }
}
    extension String
    {
        subscript(i: Int) -> Character {
            return self[advance(startIndex, i)]
        }
    }
//    NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
//
//    -(NSString *) randomStringWithLength: (int) len {
//
//    NSMutableString *randomString = [NSMutableString stringWithCapacity: len];
//
//    for (int i=0; i<len; i++) {
//    [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random_uniform([letters length])]];
//    }
//
//    return randomString;
//    }
