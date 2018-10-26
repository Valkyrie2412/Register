//
//  Districts.swift
//  Register
//
//  Created by Hiếu Nguyễn on 9/7/18.
//  Copyright © 2018 Hiếu Nguyễn. All rights reserved.
//

import Foundation

class Districts {
    var cityCodes: Int
    var districtCodes: Int
    var name : String
    
    init?(dictionary: DICT) {
        
        guard let cityCode = dictionary["CityCode"] as? Int else {return nil}
        guard let districtCode = dictionary["DistrictCode"] as? Int else {return nil}
        guard let name = dictionary["Name"] as? String else {return nil}
        self.cityCodes = cityCode
        self.districtCodes = districtCode
        self.name = name
    }
    
}
