//
//  MapViewController.swift
//  Hvist
//
//  Created by Ivan Kovalisko on 2/8/15.
//  Copyright (c) 2015 Ivan Kovalisko. All rights reserved.
//

import UIKit

class MapViewController: UIViewController, CLLocationManagerDelegate, GMSMapViewDelegate {

    @IBOutlet var mapView: GMSMapView!

    let locationManager = CLLocationManager()
    let api = HvistAPI()

    override func loadView() {
        super.loadView()

        let titleView: UIImageView = UIImageView(image: UIImage(named: "logotype"));
        self.navigationItem.titleView = titleView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()

        mapView.delegate = self

        api.loadServices { (services, error) -> Void in
            if error != nil {
                UIAlertView(title: "Error", message: error?.localizedDescription, delegate: nil, cancelButtonTitle: "OK").show()
                return
            }
            for service in services! {

                let marker = PlaceMarker(service: service)
                marker.map = self.mapView
            }
        }
    }

    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .AuthorizedWhenInUse {
            locationManager.startUpdatingLocation()

            mapView.myLocationEnabled = true
            mapView.settings.myLocationButton = true
            mapView.settings.tiltGestures = false
        }
    }

    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        if let location = locations.first as? CLLocation {

            let camera: GMSCameraPosition = GMSCameraPosition(target: location.coordinate, zoom: 14, bearing: 0, viewingAngle: 0)
            mapView.animateToCameraPosition(camera)

            locationManager.stopUpdatingLocation()
        }
    }

    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println("Error: \(error.localizedDescription)")
    }

    func mapView(mapView: GMSMapView!, markerInfoWindow marker: GMSMarker!) -> UIView! {
        return nil
    }

    func mapView(mapView: GMSMapView!, markerInfoContents marker: GMSMarker!) -> UIView! {
        let placeContentView: PlaceContentView = NSBundle.mainBundle().loadNibNamed("PlaceContentView", owner: nil, options: nil).first as! PlaceContentView!

        let placeMarker: PlaceMarker = marker as! PlaceMarker

        placeContentView.titleLabel.text = placeMarker.service.title
        placeContentView.descriptionLabel.text = placeMarker.service.description

        return placeContentView
    }
}
