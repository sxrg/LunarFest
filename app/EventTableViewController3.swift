//
//  EventTableViewController3.swift
//  app
//
//  Created by Yunseong hur on 2019-12-23.
//

import Foundation
import UIKit

class EventTableViewController3: UITableViewController{
    
    let imageArray = ["Coastal Lunar Lanterns-1","Coastal Lunar Lanterns-2","Doors Open"]
    @IBOutlet weak var scrollView: UIScrollView!{
        didSet{
            scrollView.delegate = self
            scrollView.isPagingEnabled = true
        }
    }
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // For page control
        pageControl.numberOfPages = imageArray.count
               
        for i in 0..<imageArray.count {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: imageArray[i])
                   
        let xPos = CGFloat(i)*self.view.bounds.size.width
        imageView.frame = CGRect(x: xPos, y: 0, width: view.frame.size.width, height: scrollView.frame.size.height)
                   
        scrollView.contentSize.width = view.frame.size.height*CGFloat(i+1)
        scrollView.addSubview(imageView)
        }
        
        // For removing separator
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let page = scrollView.contentOffset.x/scrollView.frame.width
        pageControl.currentPage = Int(page)
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
            return 122
        }
        else if indexPath.section == 3 && indexPath.row == 0{
            if dateCellExpanded {
                btnReadMoreOrLess.setTitle("Read less", for: .normal)
                heightConstraint.constant = 1515
                aboutLabel.numberOfLines = 0
                return 1566
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
        let appleMapURL = NSURL(string: "https://maps.apple.com/?address=1055%20Canada%20Pl,%20Vancouver%20BC%20V6C%200C3,%20Canada&auid=10786242516495626786&ll=49.289121,-123.115925&lsp=9902&q=Jack%20Poole%20Plaza&_ext=ChgKBAgEEGIKBAgFEAMKBAgGEHMKBAgKEAASJik0Yfu6bqRIQDHtrcMj3MdewDmyNiEXlaVIQEF1d8d8+sZewFAE&t=m")!
        let googleMapURL = NSURL(string: "https://www.google.ca/maps/place/Jack+Poole+Plaza/@49.2892799,-123.1177737,17z/data=!3m1!4b1!4m5!3m4!1s0x548671849c518981:0xa54f2b04c3a0f19a!8m2!3d49.2892799!4d-123.1177737")!
        
        //Try Apple maps first
        if (UIApplication.shared.canOpenURL(appleMapURL as URL)) {
            UIApplication.shared.openURL(appleMapURL as URL)
            
        //if Apple maps fail it'll try opening Using google map
        } else if (UIApplication.shared.canOpenURL(googleMapURL as URL)) {
            UIApplication.shared.openURL(googleMapURL as URL)
        }
    }
}

