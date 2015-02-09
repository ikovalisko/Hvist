//
//  PlaceMarker.swift
//  Hvist
//
//  Created by Ivan Kovalisko on 2/9/15.
//  Copyright (c) 2015 Ivan Kovalisko. All rights reserved.
//

import UIKit

class PlaceMarker: GMSMarker {
    let service: VetService
    
    init(service: VetService) {
        self.service = service
        super.init()
        
        position = service.coordinate
        icon = UIImage(named: service.availability.rawValue)
        groundAnchor = CGPoint(x: 0.5, y: 1)
        appearAnimation = kGMSMarkerAnimationPop
    }
}
