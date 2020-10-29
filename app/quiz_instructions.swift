//
//  Created by Sherry Guo on 2019-12-22.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

extension Date
{
    func toString( dateFormat format  : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}

class quiz_instructions: UIViewController {
    
    var dbRef = Database.database().reference()
    var userID = Auth.auth().currentUser!.uid
    
    //getting points in viewWillLoad
    var points = UserDefaults.standard.integer(forKey: "points")
    var lastDate = UserDefaults.standard.string(forKey:"lastQuizDate")
    var dblastDate: String!
    var today: Date!
    var todayString: String!
    
    @IBOutlet var quizInstructionView: UIView!
    @IBOutlet var btnStart: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        today = Date()
        todayString = today.toString(dateFormat: "dd-MM-YY")
        lastDate = UserDefaults.standard.object(forKey:"lastQuizDate") as? String
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.quizInstructionView.layer.cornerRadius = 15
    
        setUpElements()
    }
    
    //in viewWillDisappear
    override func viewWillDisappear(_ animated: Bool){
        super.viewWillDisappear(animated)
        dbRef.child("users").child(userID).child("point").setValue(points)
        
        UserDefaults.standard.set(self.points, forKey: "points")
        UserDefaults.standard.set(self.lastDate, forKey:"lastQuizDate")
    }
    
    @IBAction func startquiz(_ sender: UIButton) {
        
        // lets user proceed to quiz if its their first time
        if (lastDate == nil) {
            dbRef.child("users").child(userID).child("lastQuizDate").setValue(lastDate)
            
            lastDate = todayString
            
            UserDefaults.standard.setValue(self.todayString, forKey: "lastQuizDate")
            UserDefaults.standard.synchronize()
            
            proceedToQuiz()
            
        } else if (lastDate == todayString) {
            let alert = UIAlertController(title: "Sorry!", 
                                          message: "You have tried the quiz today! Please come back tomorrow.", 
                                          preferredStyle: UIAlertController.Style.alert)
            
            alert.addAction(UIAlertAction(title: "OK", 
                                          style: UIAlertAction.Style.default, 
                                          handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            
            backToPreviousPage()
        }
        else {
            lastDate = todayString
            
            UserDefaults.standard.setValue(self.todayString, forKey: "lastQuizDate")
            UserDefaults.standard.synchronize()
            
            proceedToQuiz()
        }
    }
    
    // move user to quiz if they have not taken quiz today
    func proceedToQuiz() {
       let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
       UserDefaults.standard.setValue(self.todayString, forKey: "lastQuizDate")
        
       let quizpage = storyBoard.instantiateViewController(withIdentifier: "quiz") as! quiz
     
       quizpage.modalPresentationStyle = .fullScreen
       self.present(quizpage, animated: true, completion: nil)
    }
    
    func backToPreviousPage() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let quizpage = storyBoard.instantiateViewController(withIdentifier: "page_location")
        
        quizpage.modalPresentationStyle = .fullScreen
        self.present(quizpage, animated: true, completion: nil)
    }
    
    // add style elements
    func setUpElements() {
        Utilities.styleHollowButton(btnStart)
    }
    
}
