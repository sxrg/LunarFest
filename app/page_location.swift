//
//  page_location.swift
//  app
//
//  Created by Sherry Guo on 2019-12-16.
//
import Foundation
import UIKit

struct CustomData {
    var title: String
    var url: String
    var backgroundImage: UIImage
}

extension page_location: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.width/2)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        cell.backgroundColor = .white
        return cell
    }
}

class page_location: UIViewController {
    
    @IBOutlet weak var leading: NSLayoutConstraint!
    @IBOutlet weak var trailing: NSLayoutConstraint!
    @IBOutlet weak var navbar: UINavigationItem!
    // view where main content is
    @IBOutlet var myView: UIView!
    
    var menuOut = false
    
    // tapping on 'Event' button on sidebar just shifts it back
    @IBAction func eventTapped(_ sender: Any) {
        leading.constant = 0
        trailing.constant = 0
        menuOut = false
        
        UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    @IBAction func menuTapped(_ sender: Any) {
        if (menuOut == false) {
            leading.constant = 180
            trailing.constant = -150
            menuOut = true
        } else {
            leading.constant = 0
            trailing.constant = 0
            menuOut = false
        }
        
        UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        })
        
    }
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    } ()
    
    let data = [
        CustomData(title: "one", url: "none", backgroundImage: #imageLiteral(resourceName: "placeholder")),
        CustomData(title: "two", url: "none", backgroundImage: #imageLiteral(resourceName: "placeholder")),
        CustomData(title: "three", url: "none", backgroundImage: #imageLiteral(resourceName: "placeholder")),
        CustomData(title: "four", url: "none", backgroundImage: #imageLiteral(resourceName: "placeholder"))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Modifying appearance of the menu bar.
        setUpElements()
        
        // for making the horizontal scroll view
        view.addSubview(collectionView)
        view.sendSubviewToBack(collectionView)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 90).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: view.frame.width/2).isActive = true
    }
    
    func setUpElements(){
        // Style the elements
        //Utilities.styleTextField(emailField)
        
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.1843137255, green: 0.1725490196, blue: 0.2862745098, alpha: 1)
        navigationController?.navigationBar.isTranslucent = false
     navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
    
    }
}

class CustomCell: UICollectionViewCell {
    
    var data: CustomData? {
        didSet {
            guard let data = data else { return }
            bg.image = data.backgroundImage
        }
    }
    
    let bg: UIImageView = {
      let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "placeholder")
        iv.layer.cornerRadius = 12
        return iv
    } ()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.addSubview(bg)
        
        bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bg.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        bg.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
