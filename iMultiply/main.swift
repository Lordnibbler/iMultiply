//
//  main.swift
//  iMultiply
//
//  Created by iMac on 6/3/20.
//  Copyright © 2020 Lord Nibbler. All rights reserved.
//

import Foundation

enum QuestionType : CaseIterable {
    case add
    case subtract
    case multiply
}

struct Question {
    var left: Int
    var right: Int
    var operation: QuestionType
    
    var string: String {
        switch operation {
        case .add:
            return "What is \(left) + \(right)?"
        case .subtract:
            return "What is \(left) - \(right)?"
        case .multiply:
            return "What is \(left) * \(right)?"
        }
    }
    
    var answer: Int {
        switch operation {
        case .add:
            return left + right
        case .subtract:
            return left - right
        case .multiply:
            return left * right
        }
        
    }
}

extension Question {
    // to keep memberwise initializer for struct!
    init() {
        left = Int.random(in: 1...12)
        right = Int.random(in: 1...12)
        operation = QuestionType.allCases.randomElement()!
    }
}

class iMultiply {
    var questionNumber = 1
    var score = 0
    var answerFunction = { readLine() } // closure
    
    func process(_ answer: String, for question: Question) -> String {
        guard let answerInt = Int(answer) else {
            return "Error"
        }
        
        questionNumber += 1
        if answerInt == question.answer {
            score += 1
            return "Correct"
        } else {
            return "Incorrect"
        }
    }
    
    func start() {
        print("Welcome to iMultiply")
        
        repeat {
            let question = Question()
            
            print("\n\(questionNumber). \(question.string)")
            print("Your answer: ", terminator: "")
            
            // available on command line, read one line of input from terminal
            // one line Optional
            if let answer = answerFunction() {
                let response = process(answer, for: question)
                print(response)
            }
        } while questionNumber <= 10

        print("\nYou scored \(score).")
    }
}

let game = iMultiply()
game.start()
