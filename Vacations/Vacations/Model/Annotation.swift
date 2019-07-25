//
//  Annotation.swift
//  Vacations
//
//  Created by Bouziane Bey on 25/07/2019.
//  Copyright © 2019 Bouziane Bey. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class Annotation: NSObject, MKAnnotation{
    
    var coordinate: CLLocationCoordinate2D
    var calanque: Calanque
    var title: String?
    var image: UIImage
    
    init(_ calanque: Calanque) {
        self.calanque = calanque
        coordinate = self.calanque.coordinate
        title = self.calanque.name
        image = self.calanque.image!
    }
}
