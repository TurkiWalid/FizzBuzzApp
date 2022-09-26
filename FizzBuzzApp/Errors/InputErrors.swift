//
//  MainErrorsEnum.swift
//  FizzBuzzApp
//
//  Created by Walid on 26/9/2022.
//

import Foundation

enum InputErrors: Error {
    case InputFormModelNotMatchingRequiredType //= "Internal error"
    case InputStringsNotAcceptable //= "Strings are not acceptable"
    case InputNumberNotAcceptable //= "Please fill all numbers"
    case InputNumbersLogicNotRespected// = "Limit must be above Int1 and Int2"
}
