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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        userID = Auth.auth().currentUser?.uid
        if(qrValue != "0"){
            //getPoints()
            checkQRCodeValue()
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
            if(qrValue == "VAG_" + String(i)) {
                updatePoints(value: 10, operations: "Add")
                setProgressToComplete(stopName: qrValue)
            }
        }
    }
    
    func checkQRCodeValue(){
        checkVAG()
        switch qrValue{
            case "Lady Hao Hao":
                //updatePoints(value: 40, operations: "Add")
                setProgressToComplete(stopName: "Lady Hao Hao")
                changedToCheckedBox(stopName: "ladyHaoHao")
            case "Chinese":
                updatePoints(value: 10, operations: "Add")
                setProgressToComplete(stopName: "Chinese")
                changedToCheckedBox(stopName: "chinese")
            case "Korean":
                updatePoints(value: 10, operations: "Add")
                setProgressToComplete(stopName: "Korean")
                changedToCheckedBox(stopName: "korean")
            case "Taiwanese":
                updatePoints(value: 10, operations: "Add")
                setProgressToComplete(stopName: "Taiwanese")
                changedToCheckedBox(stopName: "taiwanese")
            case "Vietnamese":
                updatePoints(value: 10, operations: "Add")
                setProgressToComplete(stopName: "Vietnamese")
                changedToCheckedBox(stopName: "vietnamese")
            case "Lone Wolf 1":
                updatePoints(value: 5, operations: "Add")
                setProgressToComplete(stopName: "Lone Wolf 1")
                changedToCheckedBox(stopName: "loneWolf1")
            case "Lone Wolf 2":
                updatePoints(value: 5, operations: "Add")
                setProgressToComplete(stopName: "Lone Wolf 2")
                changedToCheckedBox(stopName: "loneWolf2")
            case "Protector of the Mountain 1":
                updatePoints(value: 5, operations: "Add")
                setProgressToComplete(stopName: "Protector of the Mountain 1")
                changedToCheckedBox(stopName: "protectorOfTheMountain1")
            case "Protector of the Mountain 2":
                updatePoints(value: 5, operations: "Add")
                setProgressToComplete(stopName: "Protector of the Mountain 2")
                changedToCheckedBox(stopName: "protectorOfTheMountain2")
            case "Red Fawn 1":
                updatePoints(value: 5, operations: "Add")
                setProgressToComplete(stopName: "Fawn 1")
                changedToCheckedBox(stopName: "redFawn1")
            case "Red Fawn 2":
                updatePoints(value: 5, operations: "Add")
                setProgressToComplete(stopName: "Fawn 2")
                changedToCheckedBox(stopName: "redFawn2")
            case "Salish Sea 1":
                updatePoints(value: 5, operations: "Add")
                setProgressToComplete(stopName: "Salish Sea 1")
                changedToCheckedBox(stopName: "salishSea1")
            case "Salish Sea 2":
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
            case "station2":
                station2.image = #imageLiteral(resourceName: "icons8-tick-box-50")
            case "station3":
                station3.image = #imageLiteral(resourceName: "icons8-tick-box-50")
            case "station4":
                station4.image = #imageLiteral(resourceName: "icons8-tick-box-50")
            case "station5":
                station5.image = #imageLiteral(resourceName: "icons8-tick-box-50")
            case "station6":
                station6.image = #imageLiteral(resourceName: "icons8-tick-box-50")
            case "station7":
                station7.image = #imageLiteral(resourceName: "icons8-tick-box-50")
            case "station8":
                station8.image = #imageLiteral(resourceName: "icons8-tick-box-50")
            case "station9":
                station9.image = #imageLiteral(resourceName: "icons8-tick-box-50")
            case "station10":
                station10.image = #imageLiteral(resourceName: "icons8-tick-box-50")
            case "station11":
                station11.image = #imageLiteral(resourceName: "icons8-tick-box-50")
            case "station12":
                station12.image = #imageLiteral(resourceName: "icons8-tick-box-50")
            case "korean":
                korean.image = #imageLiteral(resourceName: "icons8-tick-box-50")
            case "taiwanese":
                taiwanese.image = #imageLiteral(resourceName: "icons8-tick-box-50")
            case "chinese":
                chinese.image = #imageLiteral(resourceName: "icons8-tick-box-50")
            case "vietnamese":
                vietnamese.image = #imageLiteral(resourceName: "icons8-tick-box-50")
            case "salishSea1":
                salishSea1.image = #imageLiteral(resourceName: "icons8-tick-box-50")
            case "salishSea2":
                salishSea2.image = #imageLiteral(resourceName: "icons8-tick-box-50")
            case "loneWolf1":
                loneWolf1.image = #imageLiteral(resourceName: "icons8-tick-box-50")
            case "loneWolf2":
                loneWolf2.image = #imageLiteral(resourceName: "icons8-tick-box-50")
            case "redFawn1":
                redFawn1.image = #imageLiteral(resourceName: "icons8-tick-box-50")
            case "redFawn2":
                redFawn2.image = #imageLiteral(resourceName: "icons8-tick-box-50")
            case "protectoreOfTheMountain1":
                protectoreOfTheMountain1.image = #imageLiteral(resourceName: "icons8-tick-box-50")
            case "protectoreOfTheMountain2":
                protectoreOfTheMountain2.image = #imageLiteral(resourceName: "icons8-tick-box-50")
            case "ladyHaoHao":
                ladyHaoHao.image = #imageLiteral(resourceName: "icons8-tick-box-50")
            default:
                ""
        }
    }
}
