//
//  VetService.swift
//  Hvist
//
//  Created by Ivan Kovalisko on 2/9/15.
//  Copyright (c) 2015 Ivan Kovalisko. All rights reserved.
//

import Foundation

import SwiftyJSON

public enum Availability: String {
    case Open = "open"
    case Closed = "closed"
}

public enum Type: String {
    case Clinic = "clinic"
    case Pharmacy = "pharmacy"
}

public class VetService {
    
    public let id: Int = 0
    public let coordinate: CLLocationCoordinate2D
    public let title: String
    public let description: String
    public let workingHours: String
    public let availability: Availability
    public let type: Type
    
    init(id: Int, coordinate: CLLocationCoordinate2D, title: String, description: String, workingHours: String, availability: Availability, type: Type) {
        self.id = id;
        self.coordinate = coordinate
        self.title = title
        self.description = description
        self.workingHours = workingHours
        self.availability = availability
        self.type = type
    }
    
    public class func fromJSON(json: [String: AnyObject]) -> VetService {
        let json = JSON(json)
     
        let id = json["id"].intValue
        let title = json["title"].stringValue
        let coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: json["lat"].doubleValue, longitude: json["lng"].doubleValue)
        let description: String = json["description"].stringValue
        let workingHours: String = json["working_hours_html"].stringValue
        let availability = Availability(rawValue: json["availability_type"].stringValue)
        let type = Type(rawValue: json["type"].stringValue)
        
        let vetService = VetService(id: id, coordinate: coordinate, title: title, description: description, workingHours: workingHours, availability: availability!, type: type!)
        
        return vetService
    }
}