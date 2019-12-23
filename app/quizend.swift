//
//  quizend.swift
//  app
//
//  Created by Sherry Guo on 2019-12-22.
//

import Foundation
import UIKit

class quizend: UIViewController {
    
    @IBOutlet weak var btnback: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // tweaking button appearance
        setUpElements()
    }
    
    @IBAction func backToEvents(_ sender: UIButton) {
        
    }
    
    func setUpElements() {
        Utilities.styleQuestionButton(btnback)
    }
}
