//
//  quiz.swift
//  app
//
//  Created by Sherry Guo on 2019-12-20.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth

class quiz: UIViewController {
    
    // Outlets for labels
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var image_q: UIImageView!
    
    // Outlets for question buttons
    @IBOutlet weak var optA: UIButton!
    @IBOutlet weak var optB: UIButton!
    @IBOutlet weak var optC: UIButton!
    @IBOutlet weak var optD: UIButton!
    
    // Setting up question bank
    let allQuestions = QuestionBank()
    var questionNumber: Int = 0
    var score: Int = 0
    var selectedAnswer: Int = 0
    
    // Lets quizend page know if user got correct
    static var isCorrect: Bool!
    
    // for keeping score
    var dbRef = Database.database().reference()
    var userID = Auth.auth().currentUser!.uid
    //getting points in viewWillLoad
    var points = UserDefaults.standard.integer(forKey: "points")
    var date: Date!
    var today = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Modifying appearance of the menu bar.
        setUpElements()
        
        // randomly select a question index from the questionbank
        questionNumber = Int.random(in: 0 ..< 20)
        
        // setup UIlabels accordingly
        question.text = allQuestions.list[questionNumber].question
        optA.setTitle(allQuestions.list[questionNumber].optionA, for: UIControl.State.normal)
        optB.setTitle(allQuestions.list[questionNumber].optionB, for: UIControl.State.normal)
        optC.setTitle(allQuestions.list[questionNumber].optionC, for: UIControl.State.normal)
        optD.setTitle(allQuestions.list[questionNumber].optionD, for: UIControl.State.normal)
        selectedAnswer = allQuestions.list[questionNumber].correctAnswer
    
    }
    
    
    @IBAction func answerTapped(_ sender: UIButton) {
        if sender.tag == selectedAnswer {
            score += 10
        dbRef.child("users").child(userID).child("point").setValue(score)
            UserDefaults.standard.set(self.score, forKey: "points")
            UserDefaults.standard.set(date, forKey:"lastQuizDate")
            
            quiz.isCorrect = true
            
            moveToQuizEnd()
            
        } else {
            score += 5
        dbRef.child("users").child(userID).child("point").setValue(score)
            UserDefaults.standard.set(self.score, forKey: "points")
            UserDefaults.standard.set(date,forKey:"lastQuizDate")
            
            quiz.isCorrect = false
            
            moveToQuizEnd()
        }
        
        //questionNumber += 1
        //updateQuestion()
        
    }
    
    func moveToQuizEnd() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let quizend = storyBoard.instantiateViewController(withIdentifier: "quizend")
        quizend.modalPresentationStyle = .fullScreen
        self.present(quizend, animated: true, completion: nil)
    }
    
    // quiz refresh related functions -- not used
//    func  updateQuestion() {
//        if questionNumber <= allQuestions.list.count - 1{
//            image_q.image = UIImage(named:(allQuestions.list[questionNumber].questionImage))
//            question.text = allQuestions.list[questionNumber].question
//            optA.setTitle(allQuestions.list[questionNumber].optionA, for: UIControl.State.normal)
//            optB.setTitle(allQuestions.list[questionNumber].optionB, for: UIControl.State.normal)
//            optC.setTitle(allQuestions.list[questionNumber].optionC, for: UIControl.State.normal)
//            optD.setTitle(allQuestions.list[questionNumber].optionD, for: UIControl.State.normal)
//            selectedAnswer = allQuestions.list[questionNumber].correctAnswer
//            // updateUI()
//
//        } else {
//            // should be replaced with action to go to page with quiz finished, how many points they got
//            let alert = UIAlertController(title: "Quiz Finished!", message: "End of Quiz. Do you want to start over?", preferredStyle: .alert)
//            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: {action in self.restartQuiz()})
//            alert.addAction(restartAction)
//            present(alert, animated: true, completion: nil)
//        }
//    }
    
//    func updateUI() {
//        quizscore.text = "Score: \(score)"
//        quizprogress.text = "\(questionNumber + 1)/\(allQuestions.list.count)"
//    }
    
//    func restartQuiz() {
//        score = 0
//        questionNumber = 0
//        updateQuestion()
//    }
    
    // styling elements
    func setUpElements() {
        Utilities.styleQuestionButton(optA)
        Utilities.styleQuestionButton(optB)
        Utilities.styleQuestionButton(optC)
        Utilities.styleQuestionButton(optD)
    }
    
}
