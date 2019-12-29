//
//  quizend.swift
//  app
//
//  Created by Sherry Guo on 2019-12-22.
//

import Foundation
import UIKit

class quizend: UIViewController {
    
    @IBOutlet weak var whiteBG: UIView!
    @IBOutlet weak var btnback: UIButton!
    @IBOutlet weak var pointsEarned: UILabel!
    var lastDate = UserDefaults.standard.string(forKey:"lastQuizDate")
    override func viewDidLoad() {
        super.viewDidLoad()
        // tweaking button appearance
        setUpElements()
        
        // text changes depends on correctness.
        if (quiz.isCorrect) {
            pointsEarned.text = "You got 10 points!"
        } else {
            pointsEarned.text = "You got 5 points!"
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
           lastDate = UserDefaults.standard.object(forKey:"lastQuizDate") as? String
        print("last date quiz end \(lastDate)")
       }
    
    @IBAction func backToEvents(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let quizpage = storyBoard.instantiateViewController(withIdentifier: "page_location")
        quizpage.modalPresentationStyle = .fullScreen
        self.present(quizpage, animated: true, completion: nil)
    }
    
    func setUpElements() {
        Utilities.styleQuestionButton(btnback)
        Utilities.roundViewCorners(whiteBG)
    }
}
