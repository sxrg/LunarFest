import Foundation
import UIKit
import FirebaseDatabase
import FirebaseAuth


class PointsViewController: UIViewController{
    var dbRef = Database.database().reference()
    var points = UserDefaults.standard.integer(forKey: "points")
    var agreeToDraw = false
    var userID = ""
    var qrValue = ""
    let userDefault = UserDefaults.standard
    @IBOutlet var btnRedeem: UIButton!
    @IBOutlet var pointsText: UILabel!
    @IBOutlet var pointsTextView: UIView!
    @IBOutlet var history: UIButton!
    
    //add this in vancouver & vancouver's mypoints page
    var historyMessage = UserDefaults.standard.object(forKey:"historyMessage") as? String
    
    override func viewDidLoad(){
        super.viewDidLoad()
        agreeToDraw = userDefault.bool(forKey: "agreeToDraw")
        self.pointsTextView.layer.cornerRadius = 15
        setUpElements()
        userID = Auth.auth().currentUser!.uid
        if(qrValue != ""){
            checkQRCodeValue()
        }
        getUserPoints()
    if(!agreeToDraw && points >= 150){
        checkForJoinDraw()
        }

    }

    func setUpElements(){
        
        // Style the elements
        Utilities.styleHollowButton(btnRedeem)
        Utilities.styleHollowButton(history)
    }
    
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
    func addToDrawPool(){
        agreeToDraw = true
        userDefault.set(agreeToDraw, forKey: "agreeToDraw")
    dbRef.child("users").child(userID).child("agreeToDraw").setValue(agreeToDraw)
        self.modifyPoints(value: 150, operation: "Minus")
        self.UpdateDB()
    }
    //Updating database with points
    func UpdateDB(){
        dbRef.child("users").child(userID).child("point").setValue(points);
    dbRef.child("users").child(userID).child("JoinDraw").setValue(agreeToDraw);
//         UserDefaults.standard.set(historyMessage, forKey:"historyMessage")
    }

     //Uncomment when doen implementation of QR Code Scanner
    //Clicking Redeem
    
//    @IBAction func redeemQRCodeScanner(_ sender: UIButton) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//
//        let controller = storyboard.instantiateViewController(withIdentifier: "QRCodeRedeem") as!
//            QRCodeRedeem
//        controller.previousUIView = "page_location"
//        self.present(controller, animated: true, completion: nil)
//    }
    
    func getUserPoints(){
        self.points = userDefault.integer(forKey: "points")
    self.agreeToDraw = (userDefault.bool(forKey: "agreeToDraw"))
    UpdateUI()
    }
    
    //modify this in vancouver & toronto fun stop & mypoints page
    func modifyPoints(value:Int, operation: String)-> Void{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let now = Date()
        let dateString = formatter.string(from:now)
        if(operation == "Minus" && self.points >= value){
                self.points = self.points - value
                historyMessage = (historyMessage ?? "") + "-"
                historyMessage = (historyMessage ?? "") + String(value)
                historyMessage = (historyMessage ?? "") + " points ("
                historyMessage = (historyMessage ?? "") + dateString + ")"+"\n"
                userDefault.set(historyMessage, forKey:"historyMessage")
        } else if (self.points < value ){
            print("points redeem")
            let alert = UIAlertController(title: "Warning", message: "No enough points to redeem", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
            
        UpdateUI()
        UpdateDB()
        }

    
//    func modifyPoints(value:Int, operation: String)-> Void{
//        if(operation == "Minus" && self.points > value){
//            self.points = self.points - value
//
//        }
//        if(operation == "Add"){
//            self.points = self.points + value
//        }
//    UpdateDB()
//    UpdateUI();
//
//    }
    func UpdateUI(){
    self.pointsText.text = String(self.points)
        userDefault.set(self.points, forKey: "points")
        userDefault.set(self.agreeToDraw, forKey: "agreeToDraw")
    }
    func checkQRCodeValue() -> Void{
        switch qrValue{
//            case "A_5PT":
//                modifyPoints(value: 5,operation: "Add")
//            case "A_10PT":
//                modifyPoints(value: 10,operation: "Add")
//            case "A_40PT":
//                modifyPoints(value: 40, operation: "Add")
//            case "A_50PT":
//                modifyPoints(value: 50, operation: "Add")
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

    override func viewWillDisappear(_ animated: Bool){
    super.viewWillDisappear(animated)
        self.UpdateDB()
    
    }
    
    @IBAction func showRedeem(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let QRCodeRedeem = storyBoard.instantiateViewController(withIdentifier: "QRCodeRedeem") as! QRCodeRedeem
        self.present(QRCodeRedeem, animated: true, completion: nil)
    }
    

    @IBAction func showHistory(_ sender: Any) {
        let alert = UIAlertController(title: "History", message: historyMessage, preferredStyle: UIAlertController.Style.alert)
        alert.message = historyMessage
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
     
    }
    
    //Add this to updateDB or save function in vancouver/mypoints
   
    
}
