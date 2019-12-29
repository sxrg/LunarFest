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
    
    // events page buttons
    @IBOutlet weak var btn_1: UIButton!
    @IBOutlet weak var btn_2: UIButton!
    @IBOutlet weak var btn_3: UIButton!
    @IBOutlet weak var btn_4: UIButton!
    @IBOutlet weak var btn_5: UIButton!
    
    var menuOut = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        // Modifying appearance of the menu bar.
        setUpElements()
        leading.constant = -460
        trailing.constant = -150

    }
    
    // tapping on 'Event' button on sidebar just shifts it back
    @IBAction func eventTapped2(_ sender: UIButton) {
        leading.constant = -460
        trailing.constant = -150
        menuOut = false
        
        UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    // tapping on hamburger icon on top-left expands menu
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
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.2431372549, green: 0.2431372549, blue: 0.3176470588, alpha: 1)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        
        // General styling
        Utilities.xAxisShadow(myView)
        Utilities.styleEventButtons(btn_1)
        Utilities.styleEventButtons(btn_2)
        Utilities.styleEventButtons(btn_3)
        Utilities.styleEventButtons(btn_4)

    
    }
}
