//
//  EventTableViewController1.swift
//  app
//
//  Created by Yunseong hur on 2019-12-23.
//

import Foundation
import UIKit

class EventTableViewController1: UITableViewController{
    
    let imageArray = ["Craft-1","Craft-2","Craft-3","Food Rat-2","Food Rat","LunarFest Celebrations - Fortune Telling","LunarFest Celebrations-Mongolia","Paper Fantasy","The Longevity Noodle","The Ratafoodie","算命廟"]
    @IBOutlet weak var scrollView: UIScrollView!{
        didSet{
            scrollView.delegate = self
            scrollView.isPagingEnabled = true
        }
    }
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        
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
     if(pageControl.currentPage ==  (imageArray.count - 1)){
         print("last item" )
         scrollView.contentOffset = CGPoint(x: 320,y: 0)
         pageControl.currentPage = 0
         
     }else{
             pageControl.currentPage = Int(page)
         }
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
                heightConstraint.constant = 1015
                aboutLabel.numberOfLines = 0
                return 1066
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
