//
//  BasicInputFormValidatorMockupAlwaysTrue.swift
//  FizzBuzzAppTests
//
//  Created by Walid on 26/9/2022.
//

import Foundation
@testable import FizzBuzzApp
class BasicInputFormValidatorMockupAlwaysTrue: BasicInputFormValidatorProtocol {
    func isInputLogicValid(int1: Int, int2: Int, limit: Int) -> Bool {
        return true
    }
    
    func isInputAcceptable(from value: String) -> Bool {
        return true
    }
    
    func areStringsAcceptable(key1: String, key2: String) -> Bool {
        return true
    }
    
    
}
