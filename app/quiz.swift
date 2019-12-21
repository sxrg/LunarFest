//
//  quiz.swift
//  app
//
//  Created by Sherry Guo on 2019-12-20.
//

import Foundation
import UIKit

class quiz: UIViewController {
    
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var image_q: UIImageView!
    @IBOutlet weak var quizscore: UILabel!
    @IBOutlet weak var quizprogress: UILabel!
    
    // Outlets for question buttons
    @IBOutlet weak var optA: UIButton!
    @IBOutlet weak var optB: UIButton!
    @IBOutlet weak var optC: UIButton!
    @IBOutlet weak var optD: UIButton!
    
    let allQuestions = QuestionBank()
    var questionNumber: Int = 0
    var score: Int = 0
    var selectedAnswer: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Modifying appearance of the menu bar.
        setUpElements()
    
    }
    
    
    @IBAction func answerTapped(_ sender: UIButton) {
        if sender.tag == selectedAnswer {
            //ProgressHUD.showSuccess("Correct")
            score += 1
            
        } else {
            //ProgressHUD.showError("Incorrect")
            
            
        }
        
        questionNumber += 1
        updateQuestion()
        
    }
    
    // quiz refresh related functions
    func  updateQuestion() {
        if questionNumber <= allQuestions.list.count - 1{
            image_q.image = UIImage(named:(allQuestions.list[questionNumber].questionImage))
            question.text = allQuestions.list[questionNumber].question
            optA.setTitle(allQuestions.list[questionNumber].optionA, for: UIControl.State.normal)
            optB.setTitle(allQuestions.list[questionNumber].optionB, for: UIControl.State.normal)
            optC.setTitle(allQuestions.list[questionNumber].optionC, for: UIControl.State.normal)
            optD.setTitle(allQuestions.list[questionNumber].optionD, for: UIControl.State.normal)
            selectedAnswer = allQuestions.list[questionNumber].correctAnswer
            updateUI()
            
        } else {
            let alert = UIAlertController(title: "Quiz Finished!", message: "End of Quiz. Do you want to start over?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: {action in self.restartQuiz()})
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    func updateUI() {
        quizscore.text = "Score: \(score)"
        quizprogress.text = "\(questionNumber + 1)/\(allQuestions.list.count)"
    }
    
    func restartQuiz() {
        score = 0
        questionNumber = 0
        updateQuestion()
    }
    
    // styling elements
    func setUpElements() {
        Utilities.styleQuestionButton(optA)
        Utilities.styleQuestionButton(optB)
        Utilities.styleQuestionButton(optC)
        Utilities.styleQuestionButton(optD)
    }
    
}
