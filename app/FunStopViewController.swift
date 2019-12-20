//
//  FunStopViewController.swift
//  app
//
//  Created by Yunseong hur on 2019-12-19.
//

import Foundation
import UIKit

class FunStopViewController: UIViewController {
    
    //@IBOutlet var howtoPlayDetailText: UILabel!
    @IBOutlet var btnStart: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setUpElements()
        
    }
    
    func setUpElements(){
        
        // Style the elements
        //Utilities.styleRoundLabel(howtoPlayDetailText)
        Utilities.styleHollowButton(btnStart)
    }


}
