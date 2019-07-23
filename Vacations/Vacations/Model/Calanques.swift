//
//  Calanques.swift
//  Vacations
//
//  Created by Bouziane Bey on 23/07/2019.
//  Copyright © 2019 Bouziane Bey. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

class Calanque {
    private var _name: String
    private var _desc: String
    private var _latitude: Double
    private var _longitude: Double
    private var _image: UIImage?
    
    var name: String{
        return _name
    }
    
    var desc: String{
        return _desc
    }
    
    var coordinate: CLLocationCoordinate2D{
        return CLLocationCoordinate2D(latitude: _latitude, longitude: _longitude)
    }
    
    var image: UIImage? {
        return _image
    }
    
    init(name: String, desc: String, image: UIImage?, latitude: Double, longitude: Double) {
        _name = name
        _desc = desc
        _image = image
        _latitude = latitude
        _longitude = longitude
    }
}
