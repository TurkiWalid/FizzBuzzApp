//
//  MainErrorsEnum.swift
//  FizzBuzzApp
//
//  Created by Walid on 26/9/2022.
//

import Foundation

enum InputErrors: Error {
    case InputFormModelNotMatchingRequiredType
    case InputStringsNotAcceptable
    case InputNumberNotAcceptable
    case InputNumbersLogicNotRespected
}
