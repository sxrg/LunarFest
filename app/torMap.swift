//
//  torMap.swift
//  app
//
//  Created by Gina Kim on 2019-12-27.
//

import Foundation
import UIKit
import GoogleMaps

class torMap: UIViewController{
    
    override func loadView() {
        overrideUserInterfaceStyle = .light
        
        let camera = GMSCameraPosition.camera(withLatitude: 43.743461, longitude: -79.4930997, zoom: 10.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        let varley = GMSMarker()
        varley.position = CLLocationCoordinate2D(latitude: 43.8692296, longitude: -79.3126376)
        varley.title = "LunarFest Celebrations"
        varley.snippet = "Varley Art Gallery"
        varley.map = mapView
        
        let livingArts = GMSMarker()
        livingArts.position = CLLocationCoordinate2D(latitude: 43.5897008, longitude: -79.6483642)
        livingArts.title = "A Musical Banquet"
        livingArts.snippet = "Living Arts Centre"
        livingArts.map = mapView

        
    }
    
    
}
