//
//  TorEventTableViewController2.swift
//  app
//
//  Created by Yunseong hur on 2019-12-26.
//

import Foundation
import UIKit

class TorEventTableViewController2: UITableViewController{
    
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
    
    @IBAction func location(_ sender: Any) {
        let appleMapURL = NSURL(string: "https://maps.apple.com/?address=216%20Main%20St,%20Markham%20ON%20L3R%202H1,%20Canada&auid=3370971885486679582&ll=43.869419,-79.312348&lsp=9902&q=Varley%20Art%20Gallery&_ext=ChkKBAgEEGIKBAgFEAMKBQgGEIUBCgQIChAAEiYp8tca8bXuRUAxKTFdlmPUU8A5cK1ATdzvRUBBIUuRbpfTU8BQBA%3D%3D&t=m")!
        let googleMapURL = NSURL(string: "https://www.google.ca/maps/place/Varley+Art+Gallery+of+Markham/@43.8659567,-79.3117282,14.71z/data=!4m5!3m4!1s0x89d4d5c81b972c51:0xded7843301d2e649!8m2!3d43.8692296!4d-79.3126376")!
        
        //Try Apple maps first
        if (UIApplication.shared.canOpenURL(appleMapURL as URL)) {
            UIApplication.shared.openURL(appleMapURL as URL)
        
        //if Apple maps fail it'll try opening Using google map
        } else if (UIApplication.shared.canOpenURL(googleMapURL as URL)) {
            UIApplication.shared.openURL(googleMapURL as URL)
        }
    }
    
}


