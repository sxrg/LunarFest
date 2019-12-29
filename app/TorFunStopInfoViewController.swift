//
//  TorFunStopInfoViewController.swift
//  app
//
//  Created by Yunseong hur on 2019-12-26.
//

import Foundation
import UIKit
import FirebaseAuth
import Firebase
import FirebaseDatabase
class TorFunStopInfoViewController: UIViewController {
    

    @IBOutlet var backToMain: UIButton!
    
    func setUpElements() {
        Utilities.styleQuestionButton(backToMain)
    }
    
    @IBAction func backToEvents(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "TorPageLocationViewController") //*******
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true, completion: nil)
    }
    
    var qrValue = "0"
    var points: String!
    var pointsInt: Int!
    var userID: String!
    let dbRef = Database.database().reference()
    let userDefault = UserDefaults.standard
    
    @IBOutlet var station1: UIImageView!
    @IBOutlet var station2: UIImageView!
    @IBOutlet var station3: UIImageView!
    @IBOutlet var station4: UIImageView!
    @IBOutlet var station5: UIImageView!
    @IBOutlet var station6: UIImageView!
    
    var Tstation1b: Bool!
    var Tstation2b: Bool!
    var Tstation3b: Bool!
    var Tstation4b: Bool!
    var Tstation5b: Bool!
    var Tstation6b: Bool!

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpElements() 
        overrideUserInterfaceStyle = .light
        userID = Auth.auth().currentUser?.uid
    
        self.pointsInt = userDefault.integer(forKey: "points")
        setup()
        if(qrValue != "0"){
            checkQRCodeValue()
        }
        
        
    }
    
    //NEW! save points to local
    override func viewWillAppear(_ animated: Bool) {
        userDefault.set(pointsInt, forKey: "points")
       
    }
    
    func setup(){
        Tstation1b = userDefault.bool(forKey: "Tstation1b")
        Tstation2b = userDefault.bool(forKey: "Tstation2b")
        Tstation3b = userDefault.bool(forKey: "Tstation3b")
        Tstation4b = userDefault.bool(forKey: "Tstation4b")
        Tstation5b = userDefault.bool(forKey: "Tstation5b")
        Tstation6b = userDefault.bool(forKey: "Tstation6b")


        if(Tstation1b){
            station1.image = #imageLiteral(resourceName: "icons8-tick-box-50")
        }
        if(Tstation2b){
  
            station2.image = #imageLiteral(resourceName: "icons8-tick-box-50")

        }
        if(Tstation3b){
            
            
            station3.image = #imageLiteral(resourceName: "icons8-tick-box-50")

        }
        if(Tstation4b){
           
              station4.image = #imageLiteral(resourceName: "icons8-tick-box-50")

        }
        if(Tstation5b){
           
           station5.image = #imageLiteral(resourceName: "icons8-tick-box-50")

        }
        if(Tstation6b){

          station6.image = #imageLiteral(resourceName: "icons8-tick-box-50")

        }
        
    }

    @IBAction func backtoEvents(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "TorPageLocationViewController")
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true, completion: nil)
    }
    
    //Click QRCode Scanner icon
    @IBAction func openQRCodeScanner(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "TorQRCodeScanner") as! TorQRCodeScanner
        controller.previousUIView = "TorFunStopViewController"
        self.present(controller, animated: true, completion: nil)
    }


    func setProgressToComplete(stopName: String){
        dbRef.child("users").child(userID!).child(stopName).setValue("true")
        changedToCheckedBox(stopName: stopName)
        //Will need to change the check box
    }

    func updatePoints(value: Int, operations: String){
        if(operations == "Add"){
            print("tstation updateP by:", value)
            pointsInt = pointsInt + value
            dbRef.child("users").child(userID!).child("point").setValue(pointsInt)
        
        }else{
            pointsInt = pointsInt + value
            dbRef.child("users").child(userID!).child("point").setValue(pointsInt)
        }
    }
    
    func checkQRCodeValue(){
        for i in 1..<7 {
            if(qrValue == "tstation" + String(i)) {
                setProgressToComplete(stopName: qrValue)
        
            }
        }
    }
    
    func changedToCheckedBox(stopName: String){
        switch stopName {
            case "tstation1":
                if(!Tstation1b){
                        updatePoints(value: 30, operations: "Add")
                    }
                    station1.image = #imageLiteral(resourceName: "icons8-tick-box-50")
                    Tstation1b = true
                    userDefault.set(Tstation1b, forKey: "Tstation1b")
//                    userDefault.set(true, forKey: "Tstation1b")
            case "tstation2":
                    if(!Tstation2b){
                        updatePoints(value: 30, operations: "Add")
                    }
                    station2.image = #imageLiteral(resourceName: "icons8-tick-box-50")
                    Tstation2b = true
                    userDefault.set(Tstation2b, forKey: "Tstation2b")
            case "tstation3":
                if(!Tstation3b){
                    updatePoints(value: 30, operations: "Add")
                }
                station3.image = #imageLiteral(resourceName: "icons8-tick-box-50")
                Tstation3b = true
                userDefault.set(Tstation3b, forKey: "Tstation3b")
            case "tstation4":
                if(!Tstation4b){
                    updatePoints(value: 30, operations: "Add")
                }
                station4.image = #imageLiteral(resourceName: "icons8-tick-box-50")
                Tstation4b = true
                userDefault.set(Tstation4b, forKey: "Tstation4b")
            case "tstation5":
                if(!Tstation5b){
                    updatePoints(value: 30, operations: "Add")
                }
                station5.image = #imageLiteral(resourceName: "icons8-tick-box-50")
                Tstation5b = true
                userDefault.set(Tstation5b, forKey: "Tstation5b")
            case "tstation6":
                if(!Tstation6b){
                    updatePoints(value: 30, operations: "Add")
                }
                station6.image = #imageLiteral(resourceName: "icons8-tick-box-50")
                Tstation6b = true
                userDefault.set(Tstation6b, forKey: "Tstation6b")
            default: ""
        }
    }
}
      
    

