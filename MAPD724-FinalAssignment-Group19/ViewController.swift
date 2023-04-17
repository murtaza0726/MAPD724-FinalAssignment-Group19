//
//  ViewController.swift
//  MAPD724-FinalAssignment-Group19
//
//  Created by Murtaza Haider Naqvi on 2023-04-08.
//

import UIKit
import MapKit
import FloatingPanel
import CoreLocation

class ViewController: UIViewController, SearchViewControllerDelegate, CLLocationManagerDelegate{
    
    let mapView = MKMapView()
    var locationManager = CLLocationManager()
    let panel = FloatingPanelController()
    let button =  UIButton(type: .custom)

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(mapView)
        self.navigationItem.title = "NaviGo"
        self.navigationItem.titleView = button
        
        let searchVC = SearchViewController()
        searchVC.delegate = self
        
        panel.set(contentViewController: searchVC)
        panel.addPanel(toParent: self)
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        mapView.showsUserLocation = true
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mapView.frame = view.bounds

    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last!
        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        
        mapView.setRegion(region, animated: true)
        
    }
    
    @objc func labelTapped(_ sender: UITapGestureRecognizer) {
            print("labelTapped")
        }
        
        func setupLabelTap() {
            let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.labelTapped(_:)))
            
        }
    
    func searchViewController(_ vc: SearchViewController, didSelectLocationWith coordinates: CLLocationCoordinate2D?) {
        guard let coordinates = coordinates else{
            return
        }
        panel.move(to: .tip, animated: true)
        mapView.removeAnnotations(mapView.annotations)
        
        let pin = MKPointAnnotation()
        pin.coordinate = coordinates
        mapView.addAnnotation(pin)
        
        mapView.setRegion(MKCoordinateRegion(center: coordinates, latitudinalMeters: 1000, longitudinalMeters: 1000), animated: true)
    }
}

