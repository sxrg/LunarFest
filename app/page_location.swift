//
//  page_location.swift
//  app
//
//  Created by Sherry Guo on 2019-12-16.
//
import Foundation
import UIKit

class page_location: UIViewController {
    
    @IBOutlet weak var leading: NSLayoutConstraint!
    @IBOutlet weak var trailing: NSLayoutConstraint!
    @IBOutlet weak var navbar: UINavigationItem!
    @IBOutlet var myView: UIView!
    
    var menuOut = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Modifying appearance of the menu bar.
        setUpElements()
        leading.constant = -460
        trailing.constant = -150

    }
    
    // tapping on 'Event' button on sidebar just shifts it back
//    @IBAction func eventTapped(_ sender: Any) {
//        leading.constant = -460
//        trailing.constant = -150
//        menuOut = false
//
//        UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveEaseIn, animations: {
//            self.view.layoutIfNeeded()
//        })
//    }
    
    
    @IBAction func eventTapped2(_ sender: UIButton) {
        leading.constant = -460
        trailing.constant = -150
        menuOut = false
        
        UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    @IBAction func menuTapped(_ sender: Any) {
        if (menuOut == false) {
            leading.constant = -200
            trailing.constant = 40
            menuOut = true
        } else {
            leading.constant = -460
            trailing.constant = -150
            menuOut = false
        }
        
        UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        })
        
    }
    
    func setUpElements(){
        // Styling the elements specific to
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        
        // General styling
        Utilities.xAxisShadow(myView)
    
    }
}
