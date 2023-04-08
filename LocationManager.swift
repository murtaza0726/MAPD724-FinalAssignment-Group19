//
//  LocationManager.swift
//  MAPD724-FinalAssignment-Group19
//
//  Created by Murtaza Haider Naqvi on 2023-04-08.
//

import Foundation
import CoreLocation

struct Location{
    let title : String
    let coordinates : CLLocationCoordinate2D?
}

class LocationManager: NSObject{
    static let shared = LocationManager()
    
    public func findLocations(with query: String, completion: @escaping (([Location]) -> Void)){
        let geoCoder = CLGeocoder()
        
        geoCoder.geocodeAddressString(query){ places, error in
            guard let places = places, error == nil else {
                completion([])
                return
            }
            let models: [Location] = places.compactMap({places in
                var name = ""
                if let locationName = places.name {
                    name += locationName
                }
                if let adminRegion = places.administrativeArea {
                    name += ", \(adminRegion)"
                }
                if let locality = places.locality{
                    name += ", \(locality)"
                }
                if let country = places.locality {
                    name += ", \(country)"
                }
                let result = Location(
                    title: name,
                    coordinates: places.location?.coordinate
                )
                return result
            })
            completion(models)
        }
    }
}
