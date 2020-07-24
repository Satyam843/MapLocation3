//
//  ViewController.swift
//  MapLocation3
//
//  Created by soc-admin on 7/24/20.
//  Copyright © 2020 soc-admin. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
class ViewController: UIViewController {
//IB Outlets
    @IBOutlet weak var userMapView: MKMapView!
//Constants
    let locationManager = CLLocationManager()
    //View life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
          locationManager.desiredAccuracy = kCLLocationAccuracyBest
        navigationController?.setNavigationBarHidden(true, animated: true)
        // Do any additional setup after loading the view.
    }
}
//extension
extension ViewController : CLLocationManagerDelegate
{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: locations[0].coordinate, span: span)
        userMapView.setRegion(region, animated: true)
        userMapView.showsUserLocation = true
        let pin = MKPointAnnotation()
        pin.coordinate = locations[0].coordinate
        userMapView.addAnnotation(pin)
    }
}
