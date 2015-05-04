//
//  HvistAPI.swift
//  Hvist
//
//  Created by Ivan Kovalisko on 2/8/15.
//  Copyright (c) 2015 Ivan Kovalisko. All rights reserved.
//

import Foundation

import Alamofire
import SwiftyJSON

public class HvistAPI {
    public func loadServices(completionHandler: ([VetService]?, NSError?) -> Void) -> Request {
        return Alamofire.request(.GET, "http://hvist.org/api/v1/services")
            .responseJSON { (request, response, json, error) in
                if (error != nil) {
                    NSLog("Error: \(error)")
                    println(request)
                    println(response)
                    
                    completionHandler(nil, error)
                }
                else {
                    NSLog("Success: \(request.URL)")
                    var json = JSON(json!)
                    
                    var services: [VetService] = [VetService]()
                    for (key: String, subJson: JSON) in json["services"] {
                            services.append(VetService.fromJSON(subJson.dictionaryObject!))
                    }
                    
                    completionHandler(services, nil)
                }
        }
    }
}