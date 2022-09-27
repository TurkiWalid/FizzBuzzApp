//
//  InputCheckProtocol.swift
//  FizzBuzzApp
//
//  Created by Walid on 26/9/2022.
//

import Foundation

protocol InputCheckProtocol {
    /// An instance of ``InputFormValidator`` contains data validation methods
    var inputFormValidator: InputFormValidator {get set}
    
    /// Check and process an ``InputFormModel`` then return an ``InputIterableModel`` if the provided data is valid.
    ///
    /// ```
    /// process(input: InputFormModel) throws -> InputIterableModel
    /// ```
    ///
    /// - Parameters:
    ///     - input: ``InputFormModel`` is the input data collected as Strings.
    ///
    /// - Returns: A ready for iteration model for the given ``InputFormModel``.
    /// - Throws: ``InputErrors`` if data is not valid
    func process(input: InputFormModel) throws -> InputIterableModel
    
    /// Called from Views sending inputs as ``InputFormModel`` this method will trigger a **didSuccess** or a **didFail** callback
    ///
    /// ```
    /// doFizz(with input: InputFormModel, didSuccess: @escaping(_ data: InputIterableModel)->Void, didFail: @escaping(_ error: String)->Void )
    /// ```
    ///
    /// - Parameters:
    ///     - input: ``InputFormModel`` is the input data collected as Strings.
    ///     - didSuccess: An **escaping** callback called if data if **valid** and processed returns a `InputIterableModel``
    ///     - didFail: An **escaping** callback called if data is **not valid** or **error** case returns an error of type ``String``
    ///
    /// - Returns: A ready for iteration model for the given ``InputFormModel``.
    /// - Throws: ``InputErrors`` if data is not valid
    func doFizz(with input: InputFormModel, didSuccess: @escaping(_ data: InputIterableModel)->Void, didFail: @escaping(_ error: String)->Void )
}
