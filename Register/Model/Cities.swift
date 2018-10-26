//
//  Cities.swift
//  Register
//
//  Created by Hiếu Nguyễn on 8/30/18.
//  Copyright © 2018 Hiếu Nguyễn. All rights reserved.
//

import Foundation

class Cities {
    var cityCodes: Int
    var name: String
    
    init?(dictionary: DICT ) {
        guard let cityCode = dictionary["CityCode"] as? Int else { return nil }
        guard let name = dictionary["Name"] as? String else { return  nil }
        self.cityCodes = cityCode
        self.name = name
    }
}
