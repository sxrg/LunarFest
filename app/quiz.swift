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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Modifying appearance of the menu bar.
        setUpElements()
    
    }
    
    
    @IBAction func answerTapped(_ sender: UIButton) {
        if sender.tag == 1 {
            print("button A")
        } else if sender.tag == 2 {
            print("button B")
        } else if sender.tag == 3 {
            print("button C")
        } else {
            print("button D")
        }
        
    }
    
    // styling elements
    func setUpElements() {
        
    }
    
}
