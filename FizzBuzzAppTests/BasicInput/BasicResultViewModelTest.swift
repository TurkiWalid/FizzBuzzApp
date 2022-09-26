//
//  BasicResultViewModelTest.swift
//  FizzBuzzAppTests
//
//  Created by Walid on 26/9/2022.
//

import Foundation
import XCTest
@testable import FizzBuzzApp

class BasicResultViewModelTest: XCTestCase{
    var inputIterableModel: InputIterableModel!
    var sut: OutputProtocol!
    
    override func tearDownWithError() throws {
        inputIterableModel = nil
        sut = nil
    }
    
    func testBasicResultViewModelTest_InitWithWrongObject_ShouldFail(){
        //Arrange
        let inputIterableModel = OtherOutputIterableModel()
        //Act //Assert
        XCTAssertThrowsError(try sut = BasicResultViewModel(inputIterableModel: inputIterableModel), "BasicResultViewModel init with wrong object should Throw") { error in
            XCTAssertTrue(error is InputErrors, "BasicResultViewModel init throwing unknown Error")
            XCTAssertEqual(error as? InputErrors, InputErrors.InputFormModelNotMatchingRequiredType, "BasicResultViewModel init not throwing InputNotMatchingRequiredType when it should")
        }
    }
    
    func testBasicResultViewModelTest_getValueForIndex_ShouldReturnANumber(){
        //Arrange
        let inputIterableModel = BasicInputIterableModel(int1: 3, int2: 5, limit: 100, key1: "Fizz", key2: "Buzz", bothKey: "FizzBuzz")
        //Act //Assert
        XCTAssertNoThrow( try sut = BasicResultViewModel(inputIterableModel: inputIterableModel), "BasicResultViewModel constructor should not throw is Throwing")
        XCTAssertEqual(sut.getCellValue(from: 0), "1", "Value for first index should be 1")
        
    }
    
    func testBasicResultViewModelTest_getValueForIndex_ShouldReturnFizz(){
        //Arrange
        let inputIterableModel = BasicInputIterableModel(int1: 3, int2: 5, limit: 100, key1: "Fizz", key2: "Buzz", bothKey: "FizzBuzz")
        //Act //Assert
        XCTAssertNoThrow( try sut = BasicResultViewModel(inputIterableModel: inputIterableModel), "BasicResultViewModel constructor should not throw is Throwing")
        XCTAssertEqual(sut.getCellValue(from: 2), "Fizz", "Value for index should be Fizz")
    }
    
    func testBasicResultViewModelTest_getValueForIndex_ShouldReturnBuzz(){
        //Arrange
        let inputIterableModel = BasicInputIterableModel(int1: 3, int2: 5, limit: 100, key1: "Fizz", key2: "Buzz", bothKey: "FizzBuzz")
        //Act //Assert
        XCTAssertNoThrow( try sut = BasicResultViewModel(inputIterableModel: inputIterableModel), "BasicResultViewModel constructor should not throw is Throwing")
        XCTAssertEqual(sut.getCellValue(from: 4), "Buzz", "Value for index should be Buzz")
    }
    
    func testBasicResultViewModelTest_getValueForIndex_ShouldReturnFizzBuzz(){
        //Arrange
        let inputIterableModel = BasicInputIterableModel(int1: 3, int2: 5, limit: 100, key1: "Fizz", key2: "Buzz", bothKey: "FizzBuzz")
        //Act //Assert
        XCTAssertNoThrow( try sut = BasicResultViewModel(inputIterableModel: inputIterableModel), "BasicResultViewModel constructor should not throw is Throwing")
        XCTAssertEqual(sut.getCellValue(from: 14), "FizzBuzz", "Value for index should be FizzBuzz")
    }
}
