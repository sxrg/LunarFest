//
//  EventDetailViewController.swift
//  app
//
//  Created by Yunseong hur on 2019-12-18.
//

import Foundation
import UIKit

class EventDetailViewController: UIViewController {
    
    // First Event Place: Vancouver Art Gallery
    @IBAction func FirstEventPlace(_ sender: Any) {
        //The two URL will be different
        let appleMapURL = NSURL(string: "https://maps.apple.com/?address=750%20Hornby%20St,%20Vancouver%20BC%20V6Z%202H7,%20Canada&auid=916330480122243040&ll=49.282919,-123.120429&lsp=9902&q=Vancouver%20Art%20Gallery&_ext=ChgKBAgEEGIKBAgFEAMKBAgGEBAKBAgKEAESJilnqJvGoqNIQDH6PH02JchewDnlfcEiyaRIQEGUtsuWQ8dewFAE&t=m")!
        let googleMapURL = NSURL(string: "https://www.google.ca/maps/place/Vancouver+Art+Gallery/@49.2829607,-123.1226602,17z/data=!3m1!4b1!4m5!3m4!1s0x5486717f7ffd7cc1:0xb595c3035cb17a4f!8m2!3d49.2829607!4d-123.1204715")!
        
        //Try Apple maps first
        if (UIApplication.shared.canOpenURL(appleMapURL as URL)) {
            UIApplication.shared.openURL(appleMapURL as URL)
            
        //if Apple maps fail it'll try opening Using google map
        } else if (UIApplication.shared.canOpenURL(googleMapURL as URL)) {
            UIApplication.shared.openURL(googleMapURL as URL)
        }
    }
}
