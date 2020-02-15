//
//  DataStore.swift
//  MapAppTraining
//
//  Created by bkulasiewicz on 15/02/2020.
//  Copyright © 2020 bkulasiewicz. All rights reserved.
//

import Foundation



struct DataKeys {
    static let storedLatitude = "latitude"
    static let storedLongtude = "longitude"
}


class DataStore {
    func defaults() -> UserDefaults {
        return UserDefaults.standard
    }
    
    
    func storeDataPoints(lati: String, long: String) {
        let def = defaults()
        def.setValue(lati, forKey: DataKeys.storedLatitude)
        def.setValue(long, forKey: DataKeys.storedLongtude)
        
        
        def.synchronize()
        print(lati + " " + long)
        
    }
    
    func getLastPlace() -> placeVisited? {
        let def = defaults()
        if let lat = def.string(forKey: DataKeys.storedLatitude){
            if let long = def.string(forKey: DataKeys.storedLongtude){
                return placeVisited(lat: lat, long: long)
               
            }
        }
        
        return nil
     }
}

