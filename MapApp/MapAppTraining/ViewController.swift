//
//  ViewController.swift
//  MapAppTraining
//
//  Created by bkulasiewicz on 13/02/2020.
//  Copyright © 2020 bkulasiewicz. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //permision
        self.locationManager.requestAlwaysAuthorization()

        self.locationManager.requestWhenInUseAuthorization()
//set current localization
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }

        mapView.delegate = self
        mapView.mapType = .standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true

        if let coor = mapView.userLocation.location?.coordinate{
            mapView.setCenter(coor, animated: true)
        
        updatePin()
        }
    }
    // add pin on map
    func updatePin() {
        if let oldPlace = DataStore().getLastPlace(){
            let annotation = MKPointAnnotation()
            annotation.coordinate.latitude = Double(oldPlace.laitude)!
            annotation.coordinate.longitude = Double(oldPlace.longitude)!
            annotation.title = "I was here"
            annotation.subtitle = "Remember"
            mapView.addAnnotation(annotation)
                
        }
    }
    
    
    @IBAction func addLocalizationButton(_ sender: Any) {
        let coordi = locationManager.location?.coordinate
        if let lati = coordi?.latitude {
            if let long = coordi?.longitude {
                DataStore().storeDataPoints(lati: String(lati), long: String(long))
                updatePin()
            }
        }
    }

    
 
    


}

