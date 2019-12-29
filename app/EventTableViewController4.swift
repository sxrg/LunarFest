//
//  EventTableViewController4.swift
//  app
//
//  Created by Yunseong hur on 2019-12-23.
//

import Foundation
import UIKit

class EventTableViewController4: UITableViewController{
    
    let imageArray = ["A Musical Banquet-1","A Musical Banquet-2"]
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
            return 154
        }
        else if indexPath.section == 3 && indexPath.row == 0{
            if dateCellExpanded {
                btnReadMoreOrLess.setTitle("Read less", for: .normal)
                heightConstraint.constant = 225
                aboutLabel.numberOfLines = 0
                return 266
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
        let appleMapURL = NSURL(string: "https://maps.apple.com/?address=630%20Hamilton%20St,%20Vancouver%20BC%20V6B%205N6,%20Canada&auid=2076382600581703840&ll=49.280392,-123.112605&lsp=9902&q=Queen%20Elizabeth%20Theatre&_ext=ChgKBAgEEGIKBAgFEAMKBAgGEBcKBAgKEAASJinY2rG4UKNIQDGaUrm4pcdewDlWsNcUd6RIQEGEnfYbxMZewFAE&t=m")!
              let googleMapURL = NSURL(string: "https://www.google.ca/maps/place/Queen+Elizabeth+Theatre/@49.2803017,-123.1132177,17z/data=!3m1!4b1!4m5!3m4!1s0x5486717c0141f5e7:0x7f9d3750ebc8785a!8m2!3d49.2803017!4d-123.1132177")!
              
              //Try Apple maps first
              if (UIApplication.shared.canOpenURL(appleMapURL as URL)) {
                  UIApplication.shared.openURL(appleMapURL as URL)
                  
              //if Apple maps fail it'll try opening Using google map
              } else if (UIApplication.shared.canOpenURL(googleMapURL as URL)) {
                  UIApplication.shared.openURL(googleMapURL as URL)
              }
    }
    
}


