//
//  InputFormValidatorProtocol.swift
//  FizzBuzzApp
//
//  Created by Walid on 26/9/2022.
//

import Foundation

protocol BasicInputFormValidatorProtocol {
    func isInputLogicValid(int1: Int, int2: Int, limit: Int) -> Bool
    func isInputAcceptable(from value: String) -> Bool
    func areStringsAcceptable(key1: String, key2: String) -> Bool
}
