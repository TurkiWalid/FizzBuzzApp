//
//  BasicInputViewModelTest.swift
//  FizzBuzzAppTests
//
//  Created by Walid on 26/9/2022.
//

import XCTest
@testable import FizzBuzzApp

class BasicInputViewModelTest: XCTestCase {
    var inputValidatorMockup: BasicInputFormValidatorProtocol!
    var sut: InputCheckProtocol!
    
    override func setUpWithError() throws {
        
    }
    
    override func tearDownWithError() throws {
        sut = nil
        inputValidatorMockup = nil
    }
    
    func testBasicInputViewModel_WhenInputFormProvided_ShouldNotThrow(){
        //Arrange
        inputValidatorMockup = BasicInputFormValidatorMockupAlwaysTrue()
        sut = BasicInputViewModel(formValidator: inputValidatorMockup)
        let basicInputFormModel = BasicInputFormModel(int1: "3", int2: "5", limit: "100", key1: "Fizz", key2: "Buzz")
        //Act
        //Assert
        XCTAssertNoThrow(try sut.process(input: basicInputFormModel), "BasicInputViewModel should process valid input form model data")
    }
    
    func testBasicInputViewModel_WhenInputFormProvided_ShouldReturnInputIterable(){
        //Arrange
        inputValidatorMockup = BasicInputFormValidatorMockupAlwaysTrue()
        sut = BasicInputViewModel(formValidator: inputValidatorMockup)
        let basicInputFormModel = BasicInputFormModel(int1: "3", int2: "5", limit: "100", key1: "Fizz", key2: "Buzz")
        //Act//Assert
        do {
            let inputIterable = try sut.process(input: basicInputFormModel)
            let _ = try XCTUnwrap(inputIterable, "BasicInputViewModel should process valid input form model data and return a non-nil InputIterableModel")
        }catch {
            XCTFail("BasicInputViewModel cannot process a valid BasicInputFormModel ")
        }
    }
    
    
    func testBasicInputViewModel_WhenInputFormProvidedFails_ShouldThrowInputFormModelNotMatchingRequiredType(){
        //Arrange
        inputValidatorMockup = BasicInputFormValidator()
        sut = BasicInputViewModel(formValidator: inputValidatorMockup)
        let otherInputFormModel = OtherInput()
        //Act//Assert
        XCTAssertThrowsError(try sut.process(input: otherInputFormModel), "BasicInputViewModel process throwing when receives Other object as input") { error in
            XCTAssertTrue(error is InputErrors, "BasicInputViewModel process throwing unknown Error")
            XCTAssertEqual(error as? InputErrors, InputErrors.InputFormModelNotMatchingRequiredType, "BasicInputViewModelNot process not throwing InputNotMatchingRequiredType when it should")
        }
    }
    
    func testBasicInputViewModel_WhenInputFormProvidedFails_ShouldThrowInputStringsNotAcceptable(){
        //Arrange
        inputValidatorMockup = BasicInputFormValidator()
        sut = BasicInputViewModel(formValidator: inputValidatorMockup)
        let basicInputFormModel = BasicInputFormModel(int1: "3", int2: "5", limit: "100", key1: "2", key2: "Buzz")
        //Act//Assert
        XCTAssertThrowsError(try sut.process(input: basicInputFormModel), "BasicInputViewModel process throwing when receives Mistaken object as input") { error in
            XCTAssertTrue(error is InputErrors, "BasicInputViewModel process throwing unknown Error")
            XCTAssertEqual(error as? InputErrors, InputErrors.InputStringsNotAcceptable, "BasicInputViewModelNot process not throwing InputStringsNotAcceptable when it should")
        }
    }
    
    func testBasicInputViewModel_WhenInputFormProvidedFails_ShouldThrowInputNumberNotAcceptable(){
        //Arrange
        inputValidatorMockup = BasicInputFormValidator()
        sut = BasicInputViewModel(formValidator: inputValidatorMockup)
        let basicInputFormModel = BasicInputFormModel(int1: "", int2: "5", limit: "100", key1: "Fizz", key2: "Buzz")
        //Act//Assert
        XCTAssertThrowsError(try sut.process(input: basicInputFormModel), "BasicInputViewModel process throwing when receives Mistaken object as input") { error in
            XCTAssertTrue(error is InputErrors, "BasicInputViewModel process throwing unknown Error")
            XCTAssertEqual(error as? InputErrors, InputErrors.InputNumberNotAcceptable, "BasicInputViewModelNot process not throwing InputNumberNotAcceptable when it should")
        }
    }
    
    func testBasicInputViewModel_WhenInputFormProvidedFails_ShouldThrowInputNumbersLogicNotRespected(){
        //Arrange
        inputValidatorMockup = BasicInputFormValidator()
        sut = BasicInputViewModel(formValidator: inputValidatorMockup)
        let basicInputFormModel = BasicInputFormModel(int1: "3", int2: "5", limit: "1", key1: "Fizz", key2: "Buzz")
        //Act//Assert
        XCTAssertThrowsError(try sut.process(input: basicInputFormModel), "BasicInputViewModel process throwing when receives Mistaken object as input") { error in
            XCTAssertTrue(error is InputErrors, "BasicInputViewModel process throwing unknown Error")
            XCTAssertEqual(error as? InputErrors, InputErrors.InputNumbersLogicNotRespected, "BasicInputViewModelNot process not throwing InputNumbersLogicNotRespected when it should")
        }
    }
    
    

}
