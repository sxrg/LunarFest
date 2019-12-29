//
//  TorFunStopViewController.swift
//  app
//
//  Created by Yunseong hur on 2019-12-26.
//

import Foundation
import UIKit

class TorFunStopViewController: UIViewController {
    

    @IBOutlet weak var btnStart: UIButton!
    @IBOutlet var funStopDescView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        overrideUserInterfaceStyle = .light
        
        self.funStopDescView.layer.cornerRadius = 15
        setUpElements()
    }
    
    func setUpElements(){
        
        // Style the elements
        Utilities.styleHollowButton(btnStart)
    }
}

