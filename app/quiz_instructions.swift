//
//  quiz_instructions.swift
//  app
//
//  Created by Sherry Guo on 2019-12-22.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase


class quiz_instructions: UIViewController {
    
    var dbRef = Database.database().reference()
    var userID = Auth.auth().currentUser!.uid
    //getting points in viewWillLoad
    var points = UserDefaults.standard.integer(forKey: "points")
    var date: Date!
    var today = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // if this is first time user takes quiz
        date = UserDefaults.standard.object(forKey:"lastQuizDate") as? Date
    }
    
    //in viewWillDisappear
    override func viewWillDisappear(_ animated: Bool){
        super.viewWillDisappear(animated)
        dbRef.child("users").child(userID).child("point").setValue(points)
        UserDefaults.standard.set(self.points, forKey: "points")
    }
    
    @IBAction func startquiz(_ sender: UIButton) {
        
        // lets user proceed to quiz if its their first time
        // also for testing purposes
        if (date == nil) {
            proceedToQuiz()
        }
        
        if (date == today){
            let alert = UIAlertController(title: "Sorry!", message: "You have tried the quiz already!",
                                          preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        
        } else {
            proceedToQuiz()
        }
    }
    
    func proceedToQuiz() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let quizpage = storyBoard.instantiateViewController(withIdentifier: "quiz")
        quizpage.modalPresentationStyle = .fullScreen
        self.present(quizpage, animated: true, completion: nil)
    }
    
    func setUpElements() {
        // setting up appearance
    }
    
}
