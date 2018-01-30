//
//  MapPoint.swift
//  iOS Eindproject
//
//  Created by Admin on 61-J30-.
//  Copyright © 2561 BE EhB. All rights reserved.
//

import UIKit
import MapKit

class MapPoint: NSObject , MKAnnotation{
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?

    init(coord:CLLocationCoordinate2D, title:String, subtitle:String) {
        self.coordinate = coord
        self.title = title
        self.subtitle = subtitle
    }
    
}
