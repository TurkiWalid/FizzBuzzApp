//
//  InputFormValidator.swift
//  FizzBuzzApp
//
//  Created by Walid on 25/9/2022.
//

import Foundation

class BasicInputFormValidator: BasicInputFormValidatorProtocol {
    
    func isInputLogicValid(int1: Int, int2: Int, limit: Int) -> Bool {
        return int1 <= limit && int2 <= limit
    }
    
    func isInputAcceptable(from value: String) -> Bool {
        guard let _ = Int(value) else {
            return false
        }
        return true
    }
    
    func areStringsAcceptable(key1: String, key2: String) -> Bool{
        if key1.isEmpty || key2.isEmpty {return false}
        if let _ = Int(key1){
            return false
        }
        if let _ = Int(key2){
            return false
        }
        return true
    }
    
}
