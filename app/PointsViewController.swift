//
//  PointsViewController.swift
//  app
//
//  Created by Gina Kim on 2019-12-19.
//

import Foundation
import UIKit
import FirebaseDatabase
import FirebaseAuth

class PointsViewController: UIViewController {
    
    
    var dbRef = Database.database().reference()
    
    var points = "150"
    var pointsInt = 150
    var agreeToDraw = "No"
    var userID = ""
    var qrValue = "0"
    

    @IBOutlet var pointsInfo: UILabel!
    @IBOutlet var btnRedeem: UIButton!
    @IBOutlet var pointsText: UILabel!
    override func viewDidLoad() {
            super.viewDidLoad()
        self.pointsInfo.layer.cornerRadius = 15
            setUpElements()
         
        
            //super.viewDidLoad()
                   
                   if(qrValue != "0"){
                    checkQRCodeValue()
                   }
                   //Getting points to display on the points page
                   getDBValue()
               
            if(agreeToDraw != "Yes" && pointsInt >= 150){
                       checkForJoinDraw()
                   }
        
    }
    
    func setUpElements(){
        
        // Style the elements
        Utilities.styleHollowButton(btnRedeem)
    }
    
    
    
    
    // Add this to the AppDelegate.swift
    // Database.database().isPersistenceEnabled = true
    // Database.database().keepSynced(true)
    

    func checkForJoinDraw(){
//Alert User that they have 150 points
        let alert = UIAlertController(title: "Congrats!", message: "You have earned 150 points, would you like to enter a draw for a Visa Gift Card?", preferredStyle: UIAlertController.Style.alert)
        
        //if user clicks Sure! a second alert is shown just to confirm
    
        alert.addAction(UIAlertAction(title: "Sure!", style: UIAlertAction.Style.default, handler: {(action) in self.confirm()}))
        
    
        alert.addAction(UIAlertAction(title: "No Thanks!", style: UIAlertAction.Style.default, handler:nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func confirm()->Void{
        let alert = UIAlertController(title: "Warning!", message: "Once you click OK you will not be able to opt out of the draw. Do you still want to join the draw?", preferredStyle: UIAlertController.Style.alert)
    
        //if user confirms update the database to add user to draw pool
        alert.addAction(UIAlertAction(title: "Yes!", style: UIAlertAction.Style.default, handler: {(action) in self.addToDrawPool()}))
        alert.addAction(UIAlertAction(title: "Nevermind!", style: UIAlertAction.Style.default, handler:nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    //Updating database with points
    func UpdateDB(){
        dbRef.child("users").child(userID).child("Points").setValue(String(pointsInt));
    }
    
    
    
    //Clicking Redeem
    @IBAction func openQRCodeScanner(sender: Any){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "QRCodeScanner")
        //letting the controller know which view to go back to
        //uncomment when done with implementation of QR Code Scanner
       // controller.previousUIView = "MyPoints"
        self.present(controller, animated: true, completion: nil)
    }
    
    
    //Get Database Value
    func getDBValue()->Void{
        dbRef = Database.database().reference()
        //dbRef.keepSynced(true)
        userID = Auth.auth().currentUser!.uid
        dbRef.child("users").child(userID).observe(.value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
          //  self.points = (value?["point"] as? String?)!!
                
                
                
//            self.agreeToDraw = value?["agreeToDraw"] as! String
            self.pointsInt = Int(self.points)!
            self.pointsText.text = self.points
        }) { (error) in
                print(error.localizedDescription)
        }
    }
    //Modify points according to the QRCode Values
    func modifyPoints(value:Int, operation: String)-> Void{
        getDBValue()
        if(operation == "Minus"){
            pointsInt = pointsInt - value
            self.UpdateDB()
        }
        if(operation == "Add"){
            pointsInt = pointsInt + value
            self.UpdateDB()
        }
    }
        
    //Update database accroding to user respond
    func addToDrawPool() -> Void{
        dbRef.child("users").child(userID).child("agreeToDraw").setValue("Yes")
        self.modifyPoints(value: 150, operation: "Minus")
        self.UpdateDB()
    }
        
        
    //check qr code value that user scanned
    func checkQRCodeValue() -> Void{
        switch qrValue{
            case "A_5PT":
                modifyPoints(value: 5,operation: "Add")
            case "A_10PT":
                modifyPoints(value: 10,operation: "Add")
            case "A_40PT":
                modifyPoints(value: 40, operation: "Add")
            case "A_50PT":
                modifyPoints(value: 50, operation: "Add")
            case "R_10PT":
                modifyPoints(value: 10, operation: "Minus")
            case "R_20PT":
                modifyPoints(value: 20, operation: "Minus")
            case "R_50PT":
                modifyPoints(value: 50, operation: "Minus")
            case "R_100PT":
                modifyPoints(value: 100, operation: "Minus")
            case "R_150PT":
                modifyPoints(value: 150, operation: "Minus")
            case "R_200PT":
                modifyPoints(value: 200, operation: "Minus")
            default:
                let alert = UIAlertController(title: "Error!!", message: "Incorrect QRCode Value", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }

