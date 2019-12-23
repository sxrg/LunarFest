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

class signup: UIViewController, GIDSignInUIDelegate{
    
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var btnSubmit: UIButton!
    
    @IBOutlet var googleButton: UIButton!
    

    @IBAction func googleLoginButton(_ sender: UIButton) {
        googleButton.addTarget(self, action:
            #selector(handleGoogleSignIn), for:.touchUpInside)
    }
    
    
    var email: String!
    let userDefault = UserDefaults()
    
    
    @objc func handleGoogleSignIn() {
        GIDSignIn.sharedInstance()?.signIn()
    }
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.googleButton.layer.cornerRadius = 5
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        GIDSignIn.sharedInstance()?.uiDelegate = self
        GIDSignIn.sharedInstance()?.delegate = self
    }
    @objc func dismissKeyboard(_ sender: UITapGestureRecognizer){
            emailField.resignFirstResponder()
            passwordField.resignFirstResponder()
        }
    
    override func viewDidAppear(_ animated: Bool) {
        if userDefault.bool(forKey: "usersignedin") {
            performSegue(withIdentifier: "Segue_To_Signin", sender: self)
        }
    }
    
    @IBAction func btnSignup(_ sender: Any) {
        createUser()
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
            let locationMenu = storyBoard.instantiateViewController(withIdentifier: "page_location")
            locationMenu.modalPresentationStyle = .fullScreen
            self.present(locationMenu, animated: true, completion: nil)
    }
    
    func setUpElements(){
        
        // Style the elements
        Utilities.styleTextField(emailField)
        Utilities.styleTextField(passwordField)
        Utilities.styleHollowButton(btnSubmit)
    }


}


extension signup: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        print("Did sign in with google")
        moveToLocationMenu()
    }
    
    
}
