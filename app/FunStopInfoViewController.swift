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
    @IBOutlet var korean: UIImageView!
    @IBOutlet var taiwanese: UIImageView!
    @IBOutlet var chinese: UIImageView!
    @IBOutlet var vietnamese: UIImageView!
    @IBOutlet var salishSea1: UIImageView!
    @IBOutlet var salishSea2: UIImageView!
    @IBOutlet var loneWolf1: UIImageView!
    @IBOutlet var loneWolf2: UIImageView!
    @IBOutlet var redFawn1: UIImageView!
    @IBOutlet var redFawn2: UIImageView!
    @IBOutlet var protectoreOfTheMountain1: UIImageView!
    @IBOutlet var protectoreOfTheMountain2: UIImageView!
    @IBOutlet var ladyHaoHao: UIImageView!
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
    var salishSea1b: Bool!
    var salishSea2b: Bool!
    var loneWolf1b: Bool!
    var loneWolf2b: Bool!
    var redFawn1b: Bool!
    var redFawn2b: Bool!
    var protectoreOfTheMountain1b: Bool!
    var protectoreOfTheMountain2b: Bool!
    var ladyHaoHaob: Bool!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        userID = Auth.auth().currentUser?.uid
         self.pointsInt = userDefault.integer(forKey: "points")
        setup()
        if(qrValue != "0"){
            //getPoints()
            checkQRCodeValue()
        }
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
          salishSea1b =   userDefault.bool(forKey: "salishSea1b")
          salishSea2b =   userDefault.bool(forKey: "salishSea2b")
          loneWolf1b =   userDefault.bool(forKey: "loneWolf1b")
          loneWolf2b =   userDefault.bool(forKey: "loneWolf2b")
          redFawn1b =   userDefault.bool(forKey: "redFawn1b")
          redFawn2b =   userDefault.bool(forKey: "redFawn2b")
          protectoreOfTheMountain1b =   userDefault.bool(forKey: "protectoreOfTheMountain1b")
          protectoreOfTheMountain2b =   userDefault.bool(forKey: "protectoreOfTheMountain2b")
          ladyHaoHaob = userDefault.bool(forKey: "ladyHaoHaob")
        if(station1b){
            changedToCheckedBox(stopName: "station1")
        }
        if(station2b){
            changedToCheckedBox(stopName: "station2")
        }
        if(station3b){
            changedToCheckedBox(stopName: "station3")
        }
        if(station4b){
            changedToCheckedBox(stopName: "station4")
        }
        if(station5b){
            changedToCheckedBox(stopName: "station5")
        }
        if(station6b){
            changedToCheckedBox(stopName: "station6")
        }
        if(station7b){
            changedToCheckedBox(stopName: "station7")
        }
        if(station8b){
            changedToCheckedBox(stopName: "station8")
        }
        if(station9b){
            changedToCheckedBox(stopName: "station9")
        }
        if(station10b){
            changedToCheckedBox(stopName: "station10")
        }
        if(station11b){
            changedToCheckedBox(stopName: "station11")
        }
        if(station12b){
            changedToCheckedBox(stopName: "station12")
        }
        if(koreanb){
            changedToCheckedBox(stopName: "korean")
        }
        if(taiwaneseb){
            changedToCheckedBox(stopName: "taiwanese")
        }
        if(chineseb){
            changedToCheckedBox(stopName: "chinese")
        }
        if(vietnameseb){
            changedToCheckedBox(stopName: "vietnamese")
        }
        if(salishSea1b){
            changedToCheckedBox(stopName: "salishSea1")
        }
        if(salishSea2b){
            changedToCheckedBox(stopName: "salishSea2")
        }
        if(loneWolf1b){
            changedToCheckedBox(stopName: "loneWolf1")
        }
        if(loneWolf2b){
            changedToCheckedBox(stopName: "loneWolf2")
        }
        if(redFawn1b){
            changedToCheckedBox(stopName: "redFawn1")
        }
        if(redFawn2b){
            changedToCheckedBox(stopName: "redFawn2")
        }
        if(protectoreOfTheMountain1b){
            changedToCheckedBox(stopName: "protectoreOfTheMountain1")
        }
        if(protectoreOfTheMountain2b){
            changedToCheckedBox(stopName: "protectoreOfTheMoun")
        }
        
    }

    //Click QRCode Scanner icon
    @IBAction func openQRCodeScanner(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "VanQRCodeScanner") as! VanQRCodeScanner
        controller.previousUIView = "FunStopViewController"
        self.present(controller, animated: true, completion: nil)
    }

    func getPoints(){
        userID = Auth.auth().currentUser?.uid
        dbRef.child("users").child(userID!).observeSingleEvent(of: .value, with:{ (snapshot) in
        let value = snapshot.value as? NSDictionary
            //points = value?["points"] as? String?? ""
            self.points = value?["points"] as? String
            self.pointsInt = Int(self.points)
        }) {(error) in
            print(error.localizedDescription)
        }
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
                updatePoints(value: 10, operations: "Add")
                setProgressToComplete(stopName: qrValue)
                changedToCheckedBox(stopName: qrValue)
            }
        }
    }
    
    func checkQRCodeValue(){
        checkVAG()
        switch qrValue{
            case "ladyHao":
                //updatePoints(value: 40, operations: "Add")
                setProgressToComplete(stopName: "Lady Hao Hao")
                changedToCheckedBox(stopName: "ladyHaoHao")
            case "chinese":
                updatePoints(value: 10, operations: "Add")
                setProgressToComplete(stopName: "Chinese")
                changedToCheckedBox(stopName: "chinese")
            case "Korean":
                updatePoints(value: 10, operations: "Add")
                setProgressToComplete(stopName: "Korean")
                changedToCheckedBox(stopName: "korean")
            case "taiwanese":
                updatePoints(value: 10, operations: "Add")
                setProgressToComplete(stopName: "Taiwanese")
                changedToCheckedBox(stopName: "taiwanese")
            case "vietnamese":
                updatePoints(value: 10, operations: "Add")
                setProgressToComplete(stopName: "Vietnamese")
                changedToCheckedBox(stopName: "vietnamese")
            case "loneWolf1":
                updatePoints(value: 5, operations: "Add")
                setProgressToComplete(stopName: "Lone Wolf 1")
                changedToCheckedBox(stopName: "loneWolf1")
            case "loneWolf2":
                updatePoints(value: 5, operations: "Add")
                setProgressToComplete(stopName: "Lone Wolf 2")
                changedToCheckedBox(stopName: "loneWolf2")
            case "protector1":
                updatePoints(value: 5, operations: "Add")
                setProgressToComplete(stopName: "Protector of the Mountain 1")
                changedToCheckedBox(stopName: "protectorOfTheMountain1")
            case "protector2":
                updatePoints(value: 5, operations: "Add")
                setProgressToComplete(stopName: "Protector of the Mountain 2")
                changedToCheckedBox(stopName: "protectorOfTheMountain2")
            case "redFawn1":
                updatePoints(value: 5, operations: "Add")
                setProgressToComplete(stopName: "Fawn 1")
                changedToCheckedBox(stopName: "redFawn1")
            case "redFawn2":
                updatePoints(value: 5, operations: "Add")
                setProgressToComplete(stopName: "Fawn 2")
                changedToCheckedBox(stopName: "redFawn2")
            case "salishSea1":
                updatePoints(value: 5, operations: "Add")
                setProgressToComplete(stopName: "Salish Sea 1")
                changedToCheckedBox(stopName: "salishSea1")
            case "salishSea2":
                updatePoints(value: 5, operations: "Add")
                setProgressToComplete(stopName: "Salish Sea 2")
                changedToCheckedBox(stopName: "salishSea2")
            default:
                let alert = UIAlertController(title: "Error!!", message: "Incorrect QRCode Value", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
        }
    }
    
    func changedToCheckedBox(stopName: String){
        switch stopName {
            case "station1":
                station1.image = #imageLiteral(resourceName: "icons8-tick-box-50")
                station1b = true
                userDefault.set(station1b, forKey: "station1b")
            case "station2":
                station2.image = #imageLiteral(resourceName: "icons8-tick-box-50")
                station2b = true
            userDefault.set(station2b, forKey: "station2b")
            case "station3":
                station3.image = #imageLiteral(resourceName: "icons8-tick-box-50")
                station3b = true
            userDefault.set(station3b, forKey: "station3b")
            case "station4":
                station4.image = #imageLiteral(resourceName: "icons8-tick-box-50")
                station4b = true
            userDefault.set(station4b, forKey: "station4b")
            case "station5":
                station5.image = #imageLiteral(resourceName: "icons8-tick-box-50")
                station5b = true
            userDefault.set(station5b, forKey: "station5b")
            case "station6":
                station6.image = #imageLiteral(resourceName: "icons8-tick-box-50")
                station6b = true
            userDefault.set(station6b, forKey: "station6b")
            case "station7":
                station7.image = #imageLiteral(resourceName: "icons8-tick-box-50")
                station7b = true
            userDefault.set(station7b, forKey: "station7b")
            case "station8":
                
                station8.image = #imageLiteral(resourceName: "icons8-tick-box-50")
                station8b = true
            userDefault.set(station8b, forKey: "station8b")
            case "station9":
                station9.image = #imageLiteral(resourceName: "icons8-tick-box-50")
                station9b = true
            userDefault.set(station9b, forKey: "station9b")
            case "station10":
                station10.image = #imageLiteral(resourceName: "icons8-tick-box-50")
                station10b = true
            userDefault.set(station10b, forKey: "station10b")
            case "station11":
                station11.image = #imageLiteral(resourceName: "icons8-tick-box-50")
                station11b = true
            userDefault.set(station11b, forKey: "station11b")
            case "station12":
                station12.image = #imageLiteral(resourceName: "icons8-tick-box-50")
                station12b = true
            userDefault.set(station12b, forKey: "station12b")
            case "korean":
                korean.image = #imageLiteral(resourceName: "icons8-tick-box-50")
                koreanb = true
            userDefault.set(koreanb, forKey: "koreanb")
            case "taiwanese":
                taiwanese.image = #imageLiteral(resourceName: "icons8-tick-box-50")
                taiwaneseb = true
            userDefault.set(taiwaneseb, forKey: "taiwaneseb")
            case "chinese":
                chinese.image = #imageLiteral(resourceName: "icons8-tick-box-50")
                chineseb = true
            userDefault.set(chineseb, forKey: "chineseb")
            case "vietnamese":
                vietnamese.image = #imageLiteral(resourceName: "icons8-tick-box-50")
                vietnameseb = true
            userDefault.set(vietnameseb, forKey: "vietnameseb")
            case "salishSea1":
                salishSea1.image = #imageLiteral(resourceName: "icons8-tick-box-50")
                salishSea1b = true
            userDefault.set(salishSea1b, forKey: "salishSea1b")
            case "salishSea2":
                salishSea2.image = #imageLiteral(resourceName: "icons8-tick-box-50")
                salishSea2b = true
            userDefault.set(salishSea2b, forKey: "salishSea2b")
            case "loneWolf1":
                loneWolf1.image = #imageLiteral(resourceName: "icons8-tick-box-50")
                loneWolf1b = true
            userDefault.set(loneWolf1b, forKey: "loneWolf1b")
            case "loneWolf2":
                loneWolf2.image = #imageLiteral(resourceName: "icons8-tick-box-50")
                loneWolf2b = true
            userDefault.set(loneWolf2b, forKey: "loneWolf2b")
            case "redFawn1":
                redFawn1.image = #imageLiteral(resourceName: "icons8-tick-box-50")
                redFawn1b = true
            userDefault.set(redFawn1b, forKey: "redFawn1b")
            case "redFawn2":
                redFawn2.image = #imageLiteral(resourceName: "icons8-tick-box-50")
                redFawn2b = true
            userDefault.set(redFawn2b, forKey: "redFawn2b")
            case "protectoreOfTheMountain1":
                protectoreOfTheMountain1.image = #imageLiteral(resourceName: "icons8-tick-box-50")
                protectoreOfTheMountain1b = true
            userDefault.set(protectoreOfTheMountain1b, forKey: "protectoreOfTheMountain1b")
            case "protectoreOfTheMountain2":
                protectoreOfTheMountain2.image = #imageLiteral(resourceName: "icons8-tick-box-50")
                protectoreOfTheMountain2b = true
            userDefault.set(protectoreOfTheMountain2b, forKey: "protectoreOfTheMountain2b")
            case "ladyHaoHao":
                ladyHaoHao.image = #imageLiteral(resourceName: "icons8-tick-box-50")
                ladyHaoHaob = true
            userDefault.set(ladyHaoHaob, forKey: "ladyHaoHaob")
            default:
                ""
        }
    }
}
