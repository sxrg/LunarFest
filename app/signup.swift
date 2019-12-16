//
//  signup.swift
//  app
//
//  Created by Sherry Guo on 2019-12-15.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class signup: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func btnSignup(_ sender: Any) {
        let myDatabse = Database.database().reference()
        
        Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!){
        (user, error) in
        if error != nil {
            let alert = UIAlertController(title: "ERROR", message: error?.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert,animated: true, completion: nil)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        emailField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        passwordField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    }
        
    @IBAction func startLogin(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let Login = storyBoard.instantiateViewController(withIdentifier: "Login") as! Login;
        self.present(Login, animated: true, completion: nil)
    }

}
