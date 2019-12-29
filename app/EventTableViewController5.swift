//
//  EventTableViewController5.swift
//  app
//
//  Created by Yunseong hur on 2019-12-23.
//

import Foundation
import UIKit

class EventTableViewController5: UITableViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // For removing separator
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
    // For expandable table view
    private var dateCellExpanded: Bool = false

    @IBOutlet weak var aboutLabel: UILabel!
    @IBOutlet weak var btnReadMoreOrLess: UIButton!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 && indexPath.section == 3{
            if dateCellExpanded {
                dateCellExpanded = false
            } else {
                dateCellExpanded = true
            }
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 88
        }
        else if indexPath.section == 1{
            return 192
        }
        else if indexPath.section == 2{
            return 154
        }
        else if indexPath.section == 3 && indexPath.row == 0{
            if dateCellExpanded {
                btnReadMoreOrLess.setTitle("Read less", for: .normal)
                heightConstraint.constant = 285
                aboutLabel.numberOfLines = 0
                return 321
            } else {
                btnReadMoreOrLess.setTitle("Read more", for: .normal)
                heightConstraint.constant = 100
                aboutLabel.numberOfLines = 4
                return 116
            }
        }
        else if indexPath.section == 4{
            return 279
        }
        else if indexPath.section == 5{
            return 80
        }
        return 44
    }
    
    @IBAction func location(_ sender: Any) {
        let appleMapURL = NSURL(string: "https://maps.apple.com/?address=3211%20Grant%20McConachie%20Way,%20Richmond%20BC%20V7B%200A4,%20Canada&auid=17247132191167620374&ll=49.196148,-123.177338&lsp=9902&q=Vancouver%20International%20Airport&_ext=CiQKBAgEEGIKBAgFEAMKBAgGEAYKBAgKEAIKBAhAEAAKBAhDEAESJilQvG8SiphIQDGt8Ap8zstewDnOkZVusJlIQEFr36VB7cpewFAE&t=m")!
        let googleMapURL = NSURL(string: "https://www.google.ca/maps/place/Vancouver+International+Airport/@49.1966913,-123.1815123,17z/data=!3m1!4b1!4m5!3m4!1s0x54860b348627a39b:0xba68ccac86348084!8m2!3d49.1966913!4d-123.1815123")!
                    
        //Try Apple maps first
        if (UIApplication.shared.canOpenURL(appleMapURL as URL)) {
            UIApplication.shared.openURL(appleMapURL as URL)
                        
        //if Apple maps fail it'll try opening Using google map
        } else if (UIApplication.shared.canOpenURL(googleMapURL as URL)) {
            UIApplication.shared.openURL(googleMapURL as URL)
        }
    }
    
}

