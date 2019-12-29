//
//  TorEventTableViewController1.swift
//  app
//
//  Created by Yunseong hur on 2019-12-26.
//

import Foundation
import UIKit

class TorEventTableViewController1: UITableViewController{
    
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
        self.tableView.separatorColor = #colorLiteral(red: 0.9019607843, green: 0.7176470588, blue: 0.4509803922, alpha: 1)
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

    @IBAction func location(_ sender: Any) {
        let appleMapURL = NSURL(string: "https://maps.apple.com/?address=4141%20Living%20Arts%20Dr,%20Mississauga%20ON%20L5B%204B8,%20Canada&auid=2647745780203833947&ll=43.589281,-79.645917&lsp=9902&q=Living%20Arts%20Centre&_ext=ChkKBAgEEGIKBAgFEAMKBQgGEIUBCgQIChAAEiYpE30+u97KRUAxZrBcmrjpU8A5kVJkFwXMRUBBwnhTZu3oU8BQBA%3D%3D&t=m")!
        let googleMapURL = NSURL(string: "https://www.google.ca/maps/place/Living+Arts+Centre/@43.5896199,-79.6483651,17z/data=!3m1!4b1!4m5!3m4!1s0x882b472a0d5f8f61:0x51eb3da61e7a1f6f!8m2!3d43.5896199!4d-79.6461711?hl=en")!
        
        //Try Apple maps first
        if (UIApplication.shared.canOpenURL(appleMapURL as URL)) {
            UIApplication.shared.openURL(appleMapURL as URL)
        
        //if Apple maps fail it'll try opening Using google map
        } else if (UIApplication.shared.canOpenURL(googleMapURL as URL)) {
            UIApplication.shared.openURL(googleMapURL as URL)
        }
    }
    
}

