//
//  GoogleDataProvider.swift
//  Hvist
//
//  Created by Ivan Kovalisko on 2/8/15.
//  Copyright (c) 2015 Ivan Kovalisko. All rights reserved.
//

import Foundation

import Alamofire
import SwiftyJSON

class GoogleDataProvider {
    private let APIKey: String = "AIzaSyBAtrNoTVFLoHKGzUlRNdmzRPE2dpQ1dXE"
  
    func configureGMS() {
        GMSServices.provideAPIKey(self.APIKey)
    }
    
    
}