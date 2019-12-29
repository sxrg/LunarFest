//
//  TableViewController.swift
//  app
//
//  Created by Yunseong hur on 2019-12-22.
//

import Foundation
import UIKit

class EventTableViewController2: UITableViewController{
    
    let imageArray = ["Craft-1","Craft-2","Craft-3","The Castles and The Lifestyles -  Korea art","The Castles and The Lifestyles - Chinese","The Castles and The Lifestyles - CHN - KOR","The Castles and The Lifestyles - Taiwan","The Castles and The Lifestyles - TW-VN","The Castles and The Lifestyles - Vietnam","The Ratafoodie"]
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
                heightConstraint.constant = 1145 //y axis
                aboutLabel.numberOfLines = 0
                return 1216 //height of table cell
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
    
    @IBAction func locationOakridge(_ sender: Any) {
        let appleMapURL = NSURL(string: "https://maps.apple.com/?address=650%20W%2041st%20Ave,%20Vancouver%20BC%20V5Z%202M9,%20Canada&auid=3600388601516857212&ll=49.232557,-123.119531&lsp=9902&q=Oakridge%20Centre&_ext=ChkKBAgEEGIKBAgFEAMKBQgGEIcCCgQIChABEiQphCYSNz+SSEAxohxukXbQXsA5yyCzQ0SpSEBBXuORNta+XsA%3D&t=m")!
        let googleMapURL = NSURL(string: "https://www.google.ca/maps/place/Oakridge+Centre/@49.2320523,-123.1208704,17z/data=!3m1!4b1!4m5!3m4!1s0x5486747a0f2c6bf5:0xe228fd66eda8a5af!8m2!3d49.2320488!4d-123.1186817")!
        
        //Try Apple maps first
        if (UIApplication.shared.canOpenURL(appleMapURL as URL)) {
            UIApplication.shared.openURL(appleMapURL as URL)
        
        //if Apple maps fail it'll try opening Using google map
        } else if (UIApplication.shared.canOpenURL(googleMapURL as URL)) {
            UIApplication.shared.openURL(googleMapURL as URL)
        }
    }
    
}
