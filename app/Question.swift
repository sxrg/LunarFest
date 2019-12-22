//
//  questions.swift
//  app
//
//  Created by Sherry Guo on 2019-12-20.
//

import Foundation
import UIKit

class Question {
    
    let questionImage : String
    let question : String
    let optionA: String
    let optionB: String
    let optionC: String
    let optionD: String
    let correctAnswer: Int
    
    init (image:String, questionText:String, choiceA:String, choiceB:String, choiceC:String, choiceD:String, answer:Int) {
        questionImage = image
        question = questionText
        optionA = choiceA
        optionB = choiceB
        optionC = choiceC
        optionD = choiceD
        correctAnswer = answer
    }
}
