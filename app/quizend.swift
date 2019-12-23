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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // tweaking button appearance
        setUpElements()
    }
    
    @IBAction func backToEvents(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let quizpage = storyBoard.instantiateViewController(withIdentifier: "page_login")
        quizpage.modalPresentationStyle = .fullScreen
        self.present(quizpage, animated: true, completion: nil)
    }
    
    func setUpElements() {
        Utilities.styleQuestionButton(btnback)
        Utilities.roundViewCorners(whiteBG)
    }
}
