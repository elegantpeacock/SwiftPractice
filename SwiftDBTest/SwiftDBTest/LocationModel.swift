//
//  LocationModel.swift
//  SwiftDBTest
//
//  Created by Hui Yin Tsai on 2020/04/16.
//  Copyright © 2020 Hui Yin Tsai. All rights reserved.
//

import Foundation

class LocationModel: NSObject {

    //properties
    
    var name: String?
    var address: String?
    var latitude: String?
    var longitude: String?
    
    
    //empty constructor
    
    override init()
    {
        
    }
    
    //construct with @name, @address, @latitude, and @longitude parameters
    
    init(name: String, address: String, latitude: String, longitude: String) {
        
        self.name = name
        self.address = address
        self.latitude = latitude
        self.longitude = longitude
        
    }
    
    
    //prints object's current state
    
    override var description: String {
        return "Name: \(String(describing: name)), Address: \(address), Latitude: \(latitude), Longitude: \(longitude)"
        
    }
    
}
