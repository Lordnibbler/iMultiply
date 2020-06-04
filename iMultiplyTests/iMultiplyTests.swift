//
//  iMultiplyTests.swift
//  iMultiplyTests
//
//  Created by iMac on 6/3/20.
//  Copyright © 2020 Lord Nibbler. All rights reserved.
//

@testable import iMultiply
import XCTest

class iMultiplyTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testQuestionOperandsWithinBounds() {
        let question = Question()
        XCTAssertGreaterThanOrEqual(question.left, 1)
        XCTAssertGreaterThanOrEqual(question.right, 1)
        XCTAssertLessThanOrEqual(question.left, 12)
        XCTAssertLessThanOrEqual(question.right, 12)
    }
    
    func testQuestionStringIsFormattedCorrectly() {
        let question = Question(left: 5, right: 5, operation: .add)
        XCTAssertEqual(question.string, "What is 5 + 5?")
    }
    
    func testFivePlusFiveIsTen() {
        let question = Question(left: 5, right: 5, operation: .add)
        XCTAssertEqual(question.answer, 10)
    }
    
    func testProcess() {
        let question = Question(left: 5, right: 5, operation: .add)
        let game = iMultiply()
        let result = game.process("0", for: question)
        XCTAssertEqual(result, "Incorrect")
    }
    
    func testAnsweringQuestionIncrementsCounter() {
        let question = Question(left: 5, right: 5, operation: .add)
        let game = iMultiply()
        XCTAssertEqual(game.questionNumber, 1)
        XCTAssertEqual(game.score, 0)
        
        _ = game.process("10", for: question)
        
        XCTAssertEqual(game.questionNumber, 2)
        XCTAssertEqual(game.score, 1)
    }
    
    func testGameCompletesAt11thQuestion() {
        let game = iMultiply()
        game.answerFunction = { return "556" }
        game.start()
        
        XCTAssertEqual(game.questionNumber, 11)
        XCTAssertEqual(game.score, 0)
    }
}
