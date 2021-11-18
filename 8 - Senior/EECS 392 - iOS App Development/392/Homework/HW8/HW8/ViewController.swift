//
//  ViewController.swift
//  HW8
//
//  Created by Jacob Alspaw on 4/17/19.
//  Copyright © 2019 EECS 345 Group. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var addressField: AddressFieldView!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var mapView: MKMapView!
    
    private let locationManager = CLLocationManager()
    private var currentLocation: CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        mapView.delegate = self
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
            self.locationManager.startUpdatingLocation()
        }
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    @IBAction func onSearchClicked(_ sender: Any) {
        mapView.removeOverlays(mapView.overlays)
        mapView.removeAnnotations(mapView.annotations)
        
        let location = addressField.text ?? ""
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(location, completionHandler: { placemarks, error in
            if let placemark = placemarks?.first, let destination = placemark.location {
                let destinationPlaceMark = MKPlacemark(placemark: placemark)
                self.mapView.addAnnotation(destinationPlaceMark)
                
                print(CLLocationManager.locationServicesEnabled())
                
                print(self.currentLocation)
                if let currentLocation = self.currentLocation {
                    
                    let sourcePlaceMark = MKPlacemark(coordinate: currentLocation.coordinate)
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = currentLocation.coordinate
                    annotation.title = "Current Location"
                    self.mapView.addAnnotation(annotation)
                    
                    self.showRouteOnMap(sourcePlaceMark: sourcePlaceMark, destinationPlaceMark: destinationPlaceMark)
                }
                else {
                    var region = self.mapView.region
                    region.center = destination.coordinate
                    region.span.longitudeDelta /= 8.0
                    region.span.latitudeDelta /= 8.0
                    self.mapView.setRegion(region, animated: true)
                }
            }
            else {
                let alert = UIAlertController(title: "Error",
                                              message: "No matching locations found. Try again using a different search query.",
                                              preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        })
    }
    
    private func showRouteOnMap(sourcePlaceMark: MKPlacemark, destinationPlaceMark: MKPlacemark) {
        let directionRequest = MKDirections.Request()
        directionRequest.source = MKMapItem(placemark: sourcePlaceMark)
        directionRequest.destination = MKMapItem(placemark: destinationPlaceMark)
        directionRequest.transportType = .automobile
        
        // Calculate the direction
        let directions = MKDirections(request: directionRequest)
        
        directions.calculate(completionHandler: { (response, error) -> Void in
            guard let response = response else {
                print("Error: \(error.debugDescription)")
                return
            }
            
            let route = response.routes[0]
            self.mapView.addOverlay(route.polyline, level: MKOverlayLevel.aboveRoads)
            let rect = route.polyline.boundingMapRect
            self.mapView.setVisibleMapRect(rect, edgePadding: UIEdgeInsets(top: 50, left: 75, bottom: 50, right: 75), animated: true)
            //self.mapView.setRegion(MKCoordinateRegion(rect), animated: true)
        })
    }
}

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        currentLocation = locations.last
    }
    
    func locationManager(_: CLLocationManager, didFailWithError error: Error) {
        print(error)
        let alert = UIAlertController(title: "Error",
                                      message: "Could not get current location.",
                                      preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}


extension ViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor(red: 17.0/255.0, green: 147.0/255.0, blue: 255.0/255.0, alpha: 1)
        renderer.lineWidth = 5.0
        return renderer
    }
    
}
