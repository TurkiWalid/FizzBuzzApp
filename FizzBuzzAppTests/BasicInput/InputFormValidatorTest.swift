//
//  InputFormValidatorTest.swift
//  FizzBuzzAppTests
//
//  Created by Walid on 25/9/2022.
//

import XCTest
@testable import FizzBuzzApp

class InputFormValidatorTest: XCTestCase {
    
    var sut: BasicInputFormValidatorProtocol!
    
    override func setUpWithError() throws {
        sut = BasicInputFormValidator()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testInputValidator_WhenInt1AndInt2AreGreaterThanLimit_ShouldReturnFalse(){
        //Arrange
        let int1 = 5
        let int2 = 6
        let limit = 3
        //Act
        let validity = sut.isInputLogicValid(int1: int1,int2: int2,limit: limit)
        //Assert
        XCTAssertFalse(validity, "Input validator must not accept a limit less than int1 and int2")
    }
    
    func testInputValidator_WhenInt1AndInt2AreLessThanLimit_ShouldReturnTrue(){
        //Arrange
        let int1 = 5
        let int2 = 3
        let limit = 100
        //Act
        let validity = sut.isInputLogicValid(int1: int1,int2: int2,limit: limit)
        //Assert
        XCTAssertTrue(validity, "Input validator must accept limit great than int1 and int2")
    }
    
    func testInputValidator_WhenInputIsIntAndSupportedPlatformSupportedInt_ShouldReturnTrue(){
        //Arrange
        let strInput1 = "50039"
        //Act
        let validity = sut.isInputAcceptable(from: strInput1)
        //Assert
        XCTAssertTrue(validity, "Provided input is a valid Int and must return true")
    }
    
    func testInputValidator_WhenInputIsIntAndNotSupportedPlatformSupportedInt_ShouldReturnFalse(){
        //Arrange
        let strInput1 = "50039500395003950039500395003950039500395003950039"
        //Act
        let validity = sut.isInputAcceptable(from: strInput1)
        //Assert
        XCTAssertFalse(validity, "Provided input is not a in-platform Int and must return false")
    }
    
    func testInputValidator_WhenInputIsNotInt_ShouldReturnFalse(){
        //Arrange
        let strInput1 = "123bla"
        //Act
        let validity = sut.isInputAcceptable(from: strInput1)
        //Assert
        XCTAssertFalse(validity, "Provided input is not a Int and must return false")
    }
    
    func testInputValidator_WhenOneInputIsEmpty_ShouldReturnFalse(){
        //Arrange
        let strInput1 = ""
        //Act
        let validity = sut.isInputAcceptable(from: strInput1)
        //Assert
        XCTAssertFalse(validity, "Provided input is empty it must return false")
    }
    
    func testInputValidator_WhenKeyStringsAreEmpty_ShouldReturnFalse(){
        //Arrange
        let strInput1 = ""
        let strInput2 = ""
        //Act
        let validity = sut.areStringsAcceptable(key1: strInput1, key2: strInput2)
        //Assert
        XCTAssertFalse(validity, "Provided strings are empty it must return false")
    }
    
    func testInputValidator_WhenOneKeyStringIsNumber_ShouldReturnFalse(){
        //Arrange
        let strInput1 = ""
        let strInput2 = "20"
        //Act
        let validity = sut.areStringsAcceptable(key1: strInput1, key2: strInput2)
        //Assert
        XCTAssertFalse(validity, "Provided strings are empty it must return false")
    }
    
    func testInputValidator_WhenKeyStringsAreValid_ShouldReturnTrue(){
        //Arrange
        let strInput1 = "Buzz"
        let strInput2 = "Fizz"
        //Act
        let validity = sut.areStringsAcceptable(key1: strInput1, key2: strInput2)
        //Assert
        XCTAssertTrue(validity, "Provided strings are valid it must return true")
    }

}
