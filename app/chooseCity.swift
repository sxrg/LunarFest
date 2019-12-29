//
//  chooseCity.swift
//  app
//
//  Created by Gina Kim on 2019-12-24.
//


import Foundation
import UIKit
class chooseCity: UIViewController {
    
    @IBOutlet var vancouver: UIButton!
    @IBOutlet var toronto: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        overrideUserInterfaceStyle = .light
        setUpElements()
        
    }

    func setUpElements(){
        
        // Style the elements
        Utilities.styleHollowButton(vancouver)
        Utilities.styleHollowButton(toronto)
    }
    
}

