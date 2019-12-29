//
//  map.swift
//  app
//
//  Created by Gina Kim on 2019-12-26.
//

import Foundation
import UIKit
import GoogleMaps

class map: UIViewController{
    
    override func loadView() {
        overrideUserInterfaceStyle = .light
        let camera = GMSCameraPosition.camera(withLatitude: 49.265926, longitude: -123.1163567, zoom: 13.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        let oakridge = GMSMarker()
        oakridge.position = CLLocationCoordinate2D(latitude: 49.2320488, longitude: -123.1208704)
        oakridge.title = "LunarFest Visual Arts"
        oakridge.snippet = "Oakridge Centre"
        oakridge.map = mapView
        
        let jackpoole = GMSMarker()
        jackpoole.position = CLLocationCoordinate2D(latitude: 49.2892799, longitude: -123.1199624)
        jackpoole.title = "Coastal Lunar Lanterns"
        jackpoole.snippet = "Jack Poole Plaza"
        jackpoole.map = mapView
        
        let queenEliz = GMSMarker()
        queenEliz.position = CLLocationCoordinate2D(latitude: 49.2803017, longitude: -123.1154064)
        queenEliz.title = "Musical Banquet"
        queenEliz.snippet = "Queen Elizabeth Theatre"
        queenEliz.map = mapView
        
        let artGallery = GMSMarker()
        artGallery.position = CLLocationCoordinate2D(latitude: 49.2829607, longitude: -123.1226602)
        artGallery.title = "LunarFest Celebrations"
        artGallery.snippet = "Vancouver Art Gallery Plaza"
        artGallery.map = mapView
        
    }
    
    
}
