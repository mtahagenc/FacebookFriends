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
    @IBOutlet weak var mapView: MKMapView!
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func showLocation () {
        let latitude : CLLocationDegrees = (friendsArray![indexRow!].home?.latitude)!
        let longitude : CLLocationDegrees = (friendsArray![indexRow!].home?.longitude)!
        let location = CLLocationCoordinate2D(latitude: latitude,
                longitude: longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
            mapView.setRegion(region, animated: true)
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "\(friendsArray![indexRow!].name!)'s home"
            annotation.subtitle = "London"
            mapView.addAnnotation(annotation)
    }


}
