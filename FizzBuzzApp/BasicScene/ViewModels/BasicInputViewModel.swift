//
//  BasicInputViewModel.swift
//  FizzBuzzApp
//
//  Created by Walid on 25/9/2022.
//

import Foundation

class BasicInputViewModel: InputCheckProtocol{
    
    var inputFormValidator: InputFormValidator
    
    init(formValidator: BasicInputFormValidatorProtocol){
        self.inputFormValidator = formValidator
    }

    func process(input: InputFormModel) throws -> InputIterableModel {
        
        guard let basicInputFormValidator = self.inputFormValidator as? BasicInputFormValidatorProtocol else {
            throw InputErrors.InputFormModelNotMatchingRequiredType
        }
        
        guard let inputTyped = input as? BasicInputFormModel else {
            throw InputErrors.InputFormModelNotMatchingRequiredType
        }
        
        if !basicInputFormValidator.areStringsAcceptable(key1: inputTyped.key1, key2: inputTyped.key2) {
            throw InputErrors.InputStringsNotAcceptable
        }
        var areValuesGood = true
        if !basicInputFormValidator.isInputAcceptable(from: inputTyped.int1){
            areValuesGood = false
        }
        if !basicInputFormValidator.isInputAcceptable(from: inputTyped.int2){
            areValuesGood = false
        }
        if !basicInputFormValidator.isInputAcceptable(from: inputTyped.limit){
            areValuesGood = false
        }
        if !areValuesGood  {
            throw InputErrors.InputNumberNotAcceptable
        }
        
        let int1 = Int(inputTyped.int1)!
        let int2 = Int(inputTyped.int2)!
        let limit = Int(inputTyped.limit)!
        if !basicInputFormValidator.isInputLogicValid(int1: int1, int2: int2, limit: limit){
            throw InputErrors.InputNumbersLogicNotRespected
        }
        
        return BasicInputIterableModel(int1: int1, int2: int2, limit: limit, key1: inputTyped.key1, key2: inputTyped.key2, bothKey: inputTyped.key1+inputTyped.key2)
    }
    
    func doFizz(with input: InputFormModel, didSuccess: @escaping(_ data: InputIterableModel)->Void, didFail: @escaping(_ error: String)->Void ){
        do {
            let inputIterableModel = try process(input: input)
            didSuccess(inputIterableModel)
        }catch {
            switch error {
            case InputErrors.InputFormModelNotMatchingRequiredType:
                didFail("Internal error")
                break
            case InputErrors.InputStringsNotAcceptable:
                didFail("Strings are not acceptable")
            case InputErrors.InputNumberNotAcceptable:
                didFail("Please fill all numbers")
                break
            case InputErrors.InputNumbersLogicNotRespected:
                didFail("Limit must be above Int1 and Int2")
                break
            default:
                didFail("Other Error")
            }
        }
    }
    
}
