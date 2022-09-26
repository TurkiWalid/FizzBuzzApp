//
//  InputCheckProtocol.swift
//  FizzBuzzApp
//
//  Created by Walid on 26/9/2022.
//

import Foundation

protocol InputCheckProtocol {
    var inputFormValidator: BasicInputFormValidatorProtocol {get set}
    func process(input: InputFormModel) throws -> InputIterableModel
    func doFizz(with input: InputFormModel, didSuccess: @escaping(_ data: InputIterableModel)->Void, didFail: @escaping(_ error: String)->Void )
}
