//
//  login.swift
//  app
//
//  Created by Sherry Guo on 2019-12-15.
//

import UIKit

class Login: UIViewController {
    @IBAction func login(_ sender: UIButton) {
        // connect with firebase
    }
    @IBOutlet weak var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setUpElements()
        
    }
    
    func setUpElements(){
        
        // Style the elements
        Utilities.styleHollowButton(btnLogin)
    }


}
