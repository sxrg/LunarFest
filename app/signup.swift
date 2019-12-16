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
    
    var email: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if Auth.auth().currentUser != nil{
            //move to next view contorller
        }else{
        }
        setUpElements()
    }
    
    @IBAction func btnSignup(_ sender: Any) {

    }
    

    //FIRAuthErrorCodeEmailAlreadyInUse
    func createUser(){
        Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!){
            (authResult, error) in
            if error != nil{
                let errorCode = AuthErrorCode(rawValue: error!._code)
                
                if errorCode == .emailAlreadyInUse {
                        //if email is already use then try signing in
                        self.signIn()
                    }else{
                        //some kind of error that's not email has been used occured
                        let alert = UIAlertController(title: "ERROR", message: error?.localizedDescription, preferredStyle: .alert)
                                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                                    self.present(alert,animated: true, completion: nil)
                    }
            }else{
                self.signIn()//directly signs in the user in after account is created
            }
        }
    }

    func signIn(){//might not need to pass the two parameter in?

         Auth.auth().signIn(withEmail: emailField.text!, password: passwordField.text!){
                    (user, error) in
                    if error != nil{
                //cant sign in
                        let alert = UIAlertController(title: "ERROR", message: error?.localizedDescription, preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        self.present(alert,animated: true, completion: nil)
                        
                    }else{
                //signed in update user's email in database
                        let user = Auth.auth().currentUser
                        let uid = user!.uid
                        let myDatabse = Database.database().reference()
                        myDatabse.child("users").child(uid).child("email").setValue(user?.email)
                        self.moveToLocationMenu()
                        }
                  }
            }

    func moveToLocationMenu(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let locationMenu = storyBoard.instantiateViewController(withIdentifier: "LocationMenu")
            self.present(locationMenu, animated: true, completion: nil)
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
