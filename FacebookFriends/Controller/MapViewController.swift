//
//  MapViewController.swift
//  FacebookFriends
//
//  Created by Muhammet Taha Genç on 26.02.2020.
//  Copyright © 2020 Muhammet Taha Genç. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    var indexRow : Int? = nil
    var friendsArray : [Friend]? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showLocation()
    }
    
    //MARK: - IBOutlets and IBActions
    @IBOutlet weak var mapView: MKMapView!
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: - Functions
    func showLocation () {
        let latitude : CLLocationDegrees = (friendsArray![indexRow!].home?.latitude)!
        let longitude : CLLocationDegrees = (friendsArray![indexRow!].home?.longitude)!
        //We created the latitude and the longitude of the location from the given json
        
        let location = CLLocationCoordinate2D(latitude: latitude,
                longitude: longitude)
        //We created the location using the latitude and the longitude
        
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        //The span made small so the big part of the location is visible
        
        let region = MKCoordinateRegion(center: location, span: span)
            mapView.setRegion(region, animated: true)
        //The region is created with the location and span
        
        let annotation = MKPointAnnotation()
        //An annotation is placed for showing the location
        annotation.coordinate = location
        annotation.title = "\(friendsArray![indexRow!].name!)'s home"
            annotation.subtitle = "London"
            mapView.addAnnotation(annotation)
    }


}
