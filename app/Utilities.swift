//
//  Utilities.swift
//  app
//
//  Created by Yunseong hur on 2019-12-16.
//

import Foundation
import UIKit


class Utilities {
    
    static func styleTextField(_ textfield:UITextField){
        
        // Create the bottom lines
        let bottomLine = CALayer()
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
//        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height-2, width: .view.window.frame.size.width - 60, height: 2)
        
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height-2, width: screenWidth - 60, height: 2)
        
        bottomLine.backgroundColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1).cgColor
        
        // Remove border on text field
        textfield.borderStyle = .none
        
        // Add the line to the text field
        textfield.layer.addSublayer(bottomLine)
    }
    
    static func styleHollowButton(_ button:UIButton){
        
        // Hollow rounded corner style
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor(red: 230/255.0, green: 183/255.0, blue: 115/255.0, alpha: 1.0).cgColor
        button.layer.cornerRadius = 10.0
        button.tintColor = UIColor(red: 230/255.0, green: 183/255.0, blue: 115/255.0, alpha: 1.0)
    }
    
    static func styleRoundedCorners(_ button:UIButton){

        // Hollow rounded corner style
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor(red: 230/255.0, green: 183/255.0, blue: 115/255.0, alpha: 1.0).cgColor
        button.layer.cornerRadius = 10.0
        button.tintColor = UIColor(red: 230/255.0, green: 183/255.0, blue: 115/255.0, alpha: 1.0)
    }
    
    static func xAxisShadow(_ myView:UIView) {
        
//        myView.layer.shadowPath =
//              UIBezierPath(roundedRect: myView.bounds,
//              cornerRadius: myView.layer.cornerRadius).cgPath
        myView.layer.shadowColor = #colorLiteral(red: 0.1843137255, green: 0.1725490196, blue: 0.2862745098, alpha: 1)
        myView.layer.shadowOpacity = 0.2
        myView.layer.shadowOffset = CGSize(width: 7, height: 7)
        myView.layer.shadowRadius = 7
        myView.layer.masksToBounds = false
    }
    
    static func styleEventButtons(_ button: UIButton) {
        button.layer.cornerRadius = 30
        button.clipsToBounds = true
        
    }
    
    static func styleQuestionButton(_ button: UIButton) {
        button.layer.cornerRadius = 25
        button.clipsToBounds = true
        
        button.layer.shadowColor = #colorLiteral(red: 0.1843137255, green: 0.1725490196, blue: 0.2862745098, alpha: 1)
        button.layer.shadowOpacity = 0.45
        button.layer.shadowOffset = CGSize(width: 3, height: 3)
        button.layer.shadowRadius = 7
        button.layer.masksToBounds = false
    }
    
    static func roundViewCorners(_ myView: UIView) {
        myView.layer.cornerRadius = 25
        myView.clipsToBounds = true
    }
}
