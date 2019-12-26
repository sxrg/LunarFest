//
//  FunStopViewController.swift
//  app
//
//  Created by Yunseong hur on 2019-12-19.
//

import Foundation
import UIKit

class FunStopViewController: UIViewController {
    
    @IBOutlet var btnStart: UIButton!
    @IBOutlet var funStopDescView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.funStopDescView.layer.cornerRadius = 15
        setUpElements()
        
    }
    
    func setUpElements(){
        // Style the elements
        
        Utilities.styleHollowButton(btnStart)
    }


}
