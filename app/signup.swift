//
//  signup.swift
//  app
//
//  Created by Sherry Guo on 2019-12-15.
//

import UIKit
import Foundation
import Firebase
import FirebaseDatabase
import FirebaseAuth
import GoogleSignIn

class signup: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var btnSubmit: UIButton!
    
    private var token: String!
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        emailField.attributedPlaceholder = NSAttributedString(string: "", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        passwordField.attributedPlaceholder = NSAttributedString(string: "", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        setUpElements()
    }
    
    @IBAction func btnSignup(_ sender: Any) {
        let myDatabse = Database.database().reference()

        Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!){
        (user, error) in
        if error != nil {
            let alert = UIAlertController(title: "ERROR", message: error?.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert,animated: true, completion: nil)
        } else if error == nil {
            Auth.auth().currentUser?.sendEmailVerification{
                (error) in
                    if error != nil{
                        let alert = UIAlertController(title: "ERROR", message: error?.localizedDescription, preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        self.present(alert,animated: true, completion: nil)
                    } else {
                        let user = Auth.auth().currentUser
                            
                        let alert = UIAlertController(title: "Verification Email Sent", message: "Please verfiy your email", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        self.present(alert,animated: true, completion: nil)
                        InstanceID.instanceID().instanceID{ (result, erorr) in if let error = error{
                            print("error fetching")
                    } else if let result = result {
                            print("Remote instance id token: \(result.token)")
                            self.token = result.token
                            myDatabse.child("users/\(user!.uid)").setValue(["email": self.emailField.text])
                            self.defaults.set(self.emailField.text, forKey: "email")
                            }
                        }
                    }
                }
            }
        }
    }

        
//    @IBAction func startLogin(_ sender: Any) {
//        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let Login = storyBoard.instantiateViewController(withIdentifier: "Login") as! Login;
//        self.present(Login, animated: true, completion: nil)
//    }
    
    func setUpElements(){
        
        // Style the elements
        Utilities.styleTextField(emailField)
        Utilities.styleTextField(passwordField)
        Utilities.styleHollowButton(btnSubmit)
    }

}
