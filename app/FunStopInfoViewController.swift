//
//  FunStopInfoViewController.swift
//  app
//
//  Created by Yunseong hur on 2019-12-19.
//

import Foundation
import UIKit
import FirebaseAuth
import Firebase
import FirebaseDatabase
class FunStopInfoViewController: UIViewController {
    
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
    @IBOutlet var station7: UIImageView!
    @IBOutlet var station8: UIImageView!
    @IBOutlet var station9: UIImageView!
    @IBOutlet var station10: UIImageView!
    @IBOutlet var station11: UIImageView!
    @IBOutlet var station12: UIImageView!
    @IBOutlet var chinese: UIImageView!
    @IBOutlet var korean: UIImageView!
    @IBOutlet var taiwanese: UIImageView!
    @IBOutlet var vietnamese: UIImageView!
    @IBOutlet var jackPoole: UIImageView!
    var station1b: Bool!
    var station2b: Bool!
    var station3b: Bool!
    var station4b: Bool!
    var station5b: Bool!
    var station6b: Bool!
    var station7b: Bool!
    var station8b: Bool!
    var station9b: Bool!
    var station10b: Bool!
    var station11b: Bool!
    var station12b: Bool!
    var koreanb: Bool!
    var taiwaneseb: Bool!
    var chineseb: Bool!
    var vietnameseb: Bool!
    var jackPooleb: Bool!
    @IBOutlet var backToMainVan: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpElements()
        userID = Auth.auth().currentUser?.uid
         self.pointsInt = userDefault.integer(forKey: "points")
        setup()
        if(qrValue != "0"){
            checkQRCodeValue()
        }
    }
    
    func setUpElements() {
        Utilities.styleQuestionButton(backToMainVan)
    }
    
    //NEW! save points to local
    override func viewWillAppear(_ animated: Bool) {
       userDefault.set(pointsInt, forKey: "points")
    }
    
    
    @IBAction func backtoEvents(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "page_location")
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true, completion: nil)
    }
    
    
    func setup(){
        station1b = userDefault.bool(forKey: "station1b")
        station2b = userDefault.bool(forKey: "station2b")
        station3b = userDefault.bool(forKey: "station3b")
        station4b = userDefault.bool(forKey: "station4b")
        station5b = userDefault.bool(forKey: "station5b")
        station6b = userDefault.bool(forKey: "station6b")
        station7b = userDefault.bool(forKey: "station7b")
        station8b =  userDefault.bool(forKey: "station8b")
         station9b =  userDefault.bool(forKey: "station9b")
         station10b =  userDefault.bool(forKey: "station10b")
         station11b =  userDefault.bool(forKey: "station11b")
         station12b =   userDefault.bool(forKey: "station12b")
         koreanb =   userDefault.bool(forKey: "koreanb")
          taiwaneseb = userDefault.bool(forKey: "taiwaneseb")
          chineseb =   userDefault.bool(forKey: "chineseb")
          vietnameseb =   userDefault.bool(forKey: "vietnameseb")
          jackPooleb =   userDefault.bool(forKey: "jackPooleb")
          
        if(station1b){
            station1.image = #imageLiteral(resourceName: "icons8-tick-box-50")
        }
        if(station2b){
            station2.image = #imageLiteral(resourceName: "icons8-tick-box-50")
        }
        if(station3b){
            station3.image = #imageLiteral(resourceName: "icons8-tick-box-50")
        }
        if(station4b){
            station4.image = #imageLiteral(resourceName: "icons8-tick-box-50")
        }
        if(station5b){
            station5.image = #imageLiteral(resourceName: "icons8-tick-box-50")
        }
        if(station6b){
           station6.image = #imageLiteral(resourceName: "icons8-tick-box-50")
        }
        if(station7b){
            station7.image = #imageLiteral(resourceName: "icons8-tick-box-50")
        }
        if(station8b){
            station8.image = #imageLiteral(resourceName: "icons8-tick-box-50")
        }
        if(station9b){
            station9.image = #imageLiteral(resourceName: "icons8-tick-box-50")
        }
        if(station10b){
            station10.image = #imageLiteral(resourceName: "icons8-tick-box-50")
        }
        if(station11b){
            station11.image = #imageLiteral(resourceName: "icons8-tick-box-50")
        }
        if(station12b){
            station12.image = #imageLiteral(resourceName: "icons8-tick-box-50")
        }
        if(koreanb){
          korean.image = #imageLiteral(resourceName: "icons8-tick-box-50")
        }
        if(taiwaneseb){
            taiwanese.image = #imageLiteral(resourceName: "icons8-tick-box-50")
        }
        if(chineseb){
            chinese.image = #imageLiteral(resourceName: "icons8-tick-box-50")
        }
        if(vietnameseb){
           vietnamese.image = #imageLiteral(resourceName: "icons8-tick-box-50")
        }
        if(jackPooleb){
            jackPoole.image = #imageLiteral(resourceName: "icons8-tick-box-50")
        }
       
        
    }

    //Click QRCode Scanner icon
    @IBAction func openQRCodeScanner(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "VanQRCodeScanner") as! VanQRCodeScanner
        controller.previousUIView = "FunStopViewController"
        self.present(controller, animated: true, completion: nil)
    }

   

    func setProgressToComplete(stopName: String){
        dbRef.child("users").child(userID!).child(stopName).setValue("true")
        changedToCheckedBox(stopName: stopName)
        //Will need to change the check box
    }

    func updatePoints(value: Int, operations: String){
        if(operations == "Add"){
            pointsInt = pointsInt + value
            dbRef.child("users").child(userID!).child("point").setValue(pointsInt)
        
        }else{
            pointsInt = pointsInt + value
            dbRef.child("users").child(userID!).child("point").setValue(pointsInt )
        }
    }


    func checkVAG(){
        for i in 1..<13 {
            if(qrValue == "station" + String(i)) {
//                updatePoints(value: 15, operations: "Add")
                setProgressToComplete(stopName: qrValue)
//                changedToCheckedBox(stopName: qrValue)
            }
        }
    }

    func checkQRCodeValue(){
        checkVAG()
        switch qrValue{
//            case "ladyHaoHao":
//                updatePoints(value: 40, operations: "Add")
//                setProgressToComplete(stopName: "Lady Hao Hao")
//                changedToCheckedBox(stopName: "ladyHaoHao")
            case "chinese":
                setProgressToComplete(stopName: "Chinese")
                changedToCheckedBox(stopName: "chinese")
            case "Korean":
                setProgressToComplete(stopName: "Korean")
                changedToCheckedBox(stopName: "korean")
            case "taiwanese":
                setProgressToComplete(stopName: "Taiwanese")
                changedToCheckedBox(stopName: "taiwanese")
            case "vietnamese":
                setProgressToComplete(stopName: "Vietnamese")
                changedToCheckedBox(stopName: "vietnamese")
            case "JackPoole":
                setProgressToComplete(stopName: "jackPoole")
                changedToCheckedBox(stopName: "jackPoole")
//            case "loneWolf1":
//                updatePoints(value: 5, operations: "Add")
//                setProgressToComplete(stopName: "Lone Wolf 1")
//                changedToCheckedBox(stopName: "loneWolf1")
//            case "loneWolf2":
//                updatePoints(value: 5, operations: "Add")
//                setProgressToComplete(stopName: "Lone Wolf 2")
//                changedToCheckedBox(stopName: "loneWolf2")
//            case "protector1":
//                updatePoints(value: 5, operations: "Add")
//                setProgressToComplete(stopName: "Protector of the Mountain 1")
//                changedToCheckedBox(stopName: "protectorOfTheMountain1")
//            case "protector2":
//                updatePoints(value: 5, operations: "Add")
//                setProgressToComplete(stopName: "Protector of the Mountain 2")
//                changedToCheckedBox(stopName: "protectorOfTheMountain2")
//            case "redFawn1":
//                updatePoints(value: 5, operations: "Add")
//                setProgressToComplete(stopName: "Fawn 1")
//                changedToCheckedBox(stopName: "redFawn1")
//            case "redFawn2":
//                updatePoints(value: 5, operations: "Add")
//                setProgressToComplete(stopName: "Fawn 2")
//                changedToCheckedBox(stopName: "redFawn2")
            
//            case "salishSea2":
//                updatePoints(value: 5, operations: "Add")
//                setProgressToComplete(stopName: "Salish Sea 2")
//                changedToCheckedBox(stopName: "salishSea2")
            default:
                let alert = UIAlertController(title: "Error!!", message: "Incorrect QRCode Value", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
        }
    }
    
    func changedToCheckedBox(stopName: String){
        switch stopName {
            case "station1":
                if(!station1b){
                    updatePoints(value: 15, operations: "Add")
                }
                station1.image = #imageLiteral(resourceName: "icons8-tick-box-50")
                station1b = true
                userDefault.set(station1b, forKey: "station1b")
            case "station2":
                if(!station2b){
                    updatePoints(value: 15, operations: "Add")
                }
                station2.image = #imageLiteral(resourceName: "icons8-tick-box-50")
                station2b = true
                userDefault.set(station2b, forKey: "station2b")
            case "station3":
                if(!station3b){
                    updatePoints(value: 15, operations: "Add")
                }
                station3.image = #imageLiteral(resourceName: "icons8-tick-box-50")
                station3b = true
            userDefault.set(station3b, forKey: "station3b")
            case "station4":
                if(!station4b){
                    updatePoints(value: 15, operations: "Add")
                }
                station4.image = #imageLiteral(resourceName: "icons8-tick-box-50")
                station4b = true
                userDefault.set(station4b, forKey: "station4b")
            case "station5":
                if(!station5b){
                    updatePoints(value: 15, operations: "Add")
                }
                station5.image = #imageLiteral(resourceName: "icons8-tick-box-50")
                station5b = true
                userDefault.set(station5b, forKey: "station5b")
            case "station6":
                if(!station6b){
                    updatePoints(value: 15, operations: "Add")
                }
                station6.image = #imageLiteral(resourceName: "icons8-tick-box-50")
                station6b = true
                userDefault.set(station6b, forKey: "station6b")
            case "station7":
                if(!station7b){
                    updatePoints(value: 15, operations: "Add")
                }
                station7.image = #imageLiteral(resourceName: "icons8-tick-box-50")
                station7b = true
                userDefault.set(station7b, forKey: "station7b")
            case "station8":
                if(!station8b){
                    updatePoints(value: 15, operations: "Add")
                }
                station8.image = #imageLiteral(resourceName: "icons8-tick-box-50")
                station8b = true
                userDefault.set(station8b, forKey: "station8b")
            case "station9":
                if(!station9b){
                    updatePoints(value: 15, operations: "Add")
                }
                station9.image = #imageLiteral(resourceName: "icons8-tick-box-50")
                station9b = true
                userDefault.set(station9b, forKey: "station9b")
            case "station10":
                if(!station10b){
                    updatePoints(value: 15, operations: "Add")
                }
                station10.image = #imageLiteral(resourceName: "icons8-tick-box-50")
                station10b = true
                userDefault.set(station10b, forKey: "station10b")
            case "station11":
                if(!station11b){
                    updatePoints(value: 15, operations: "Add")
                }
                station11.image = #imageLiteral(resourceName: "icons8-tick-box-50")
                station11b = true
                userDefault.set(station11b, forKey: "station11b")
            case "station12":
                if(!station12b){
                    updatePoints(value: 15, operations: "Add")
                }
                station12.image = #imageLiteral(resourceName: "icons8-tick-box-50")
                station12b = true
                userDefault.set(station12b, forKey: "station12b")
            case "korean":
                if(!koreanb){
                    updatePoints(value: 15, operations: "Add")
                }
                korean.image = #imageLiteral(resourceName: "icons8-tick-box-50")
                koreanb = true
                userDefault.set(koreanb, forKey: "koreanb")
            case "taiwanese":
                if(!taiwaneseb){
                    updatePoints(value: 15, operations: "Add")
                }
                taiwanese.image = #imageLiteral(resourceName: "icons8-tick-box-50")
                taiwaneseb = true
                userDefault.set(taiwaneseb, forKey: "taiwaneseb")
            case "chinese":
                if(!chineseb){
                    updatePoints(value: 15, operations: "Add")
                }
                chinese.image = #imageLiteral(resourceName: "icons8-tick-box-50")
                chineseb = true
                userDefault.set(chineseb, forKey: "chineseb")
            case "vietnamese":
                if(!vietnameseb){
                    updatePoints(value: 15, operations: "Add")
                }
                vietnamese.image = #imageLiteral(resourceName: "icons8-tick-box-50")
                vietnameseb = true
                userDefault.set(vietnameseb, forKey: "vietnameseb")
            case "jackPoole":
                if(!jackPooleb){
                    updatePoints(value: 40, operations: "Add")
                }
                jackPoole.image = #imageLiteral(resourceName: "icons8-tick-box-50")
                jackPooleb = true
                userDefault.set(jackPooleb, forKey: "jackPooleb")
//            case "salishSea2":
//                salishSea2.image = #imageLiteral(resourceName: "icons8-tick-box-50")
//                salishSea2b = true
//            userDefault.set(salishSea2b, forKey: "salishSea2b")
//            case "loneWolf1":
//                loneWolf1.image = #imageLiteral(resourceName: "icons8-tick-box-50")
//                loneWolf1b = true
//            userDefault.set(loneWolf1b, forKey: "loneWolf1b")
//            case "loneWolf2":
//                loneWolf2.image = #imageLiteral(resourceName: "icons8-tick-box-50")
//                loneWolf2b = true
//            userDefault.set(loneWolf2b, forKey: "loneWolf2b")
//            case "redFawn1":
//                redFawn1.image = #imageLiteral(resourceName: "icons8-tick-box-50")
//                redFawn1b = true
//            userDefault.set(redFawn1b, forKey: "redFawn1b")
//            case "redFawn2":
//                redFawn2.image = #imageLiteral(resourceName: "icons8-tick-box-50")
//                redFawn2b = true
//            userDefault.set(redFawn2b, forKey: "redFawn2b")
//            case "protectoreOfTheMountain1":
//                protectoreOfTheMountain1.image = #imageLiteral(resourceName: "icons8-tick-box-50")
//                protectoreOfTheMountain1b = true
//            userDefault.set(protectoreOfTheMountain1b, forKey: "protectoreOfTheMountain1b")
//            case "protectoreOfTheMountain2":
//                protectoreOfTheMountain2.image = #imageLiteral(resourceName: "icons8-tick-box-50")
//                protectoreOfTheMountain2b = true
//            userDefault.set(protectoreOfTheMountain2b, forKey: "protectoreOfTheMountain2b")
//            case "ladyHaoHao":
//                ladyHaoHao.image = #imageLiteral(resourceName: "icons8-tick-box-50")
//                ladyHaoHaob = true
//            userDefault.set(ladyHaoHaob, forKey: "ladyHaoHaob")
            default:
                ""
        }
    }
}
