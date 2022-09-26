//
//  BasicInputViewModel.swift
//  FizzBuzzApp
//
//  Created by Walid on 25/9/2022.
//

import Foundation

class BasicInputViewModel: InputCheckProtocol{
    
    var inputFormValidator: BasicInputFormValidatorProtocol
    
    init(formValidator: BasicInputFormValidatorProtocol){
        self.inputFormValidator = formValidator
    }

    func process(input: InputFormModel) throws -> InputIterableModel {
        guard let inputTyped = input as? BasicInputFormModel else {
            throw InputErrors.InputFormModelNotMatchingRequiredType
        }
        if !inputFormValidator.areStringsAcceptable(key1: inputTyped.key1, key2: inputTyped.key2) {
            throw InputErrors.InputStringsNotAcceptable
        }
        var areValuesGood = true
        if !inputFormValidator.isInputAcceptable(from: inputTyped.int1){
            areValuesGood = false
        }
        if !inputFormValidator.isInputAcceptable(from: inputTyped.int2){
            areValuesGood = false
        }
        if !inputFormValidator.isInputAcceptable(from: inputTyped.limit){
            areValuesGood = false
        }
        if !areValuesGood  {
            throw InputErrors.InputNumberNotAcceptable
        }
        
        let int1 = Int(inputTyped.int1)!
        let int2 = Int(inputTyped.int2)!
        let limit = Int(inputTyped.limit)!
        if !inputFormValidator.isInputLogicValid(int1: int1, int2: int2, limit: limit){
            throw InputErrors.InputNumbersLogicNotRespected
        }
        
        return BasicInputIterableModel(int1: int1, int2: int2, limit: limit, key1: inputTyped.key1, key2: inputTyped.key2, bothKey: inputTyped.key1+inputTyped.key2)
    }
    
    
    
}
