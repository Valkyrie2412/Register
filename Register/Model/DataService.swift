//
//  DataService.swift
//  Register
//
//  Created by Hiếu Nguyễn on 8/30/18.
//  Copyright © 2018 Hiếu Nguyễn. All rights reserved.
//

import UIKit

typealias DICT = Dictionary<AnyHashable, Any>

class DataService {
    static let sharedInstance: DataService = DataService()
    
    // Cities
    private var _dataCities: [Cities]?
    
    var dataCities: [Cities] {
        get {
            if _dataCities == nil {
                getDataCity()
            }
            return _dataCities ?? []
        }
        set {
            _dataCities = newValue
        }
    }
    
    func getDataCity()  {
        _dataCities = []
        guard let plistPath  = Bundle.main.path(forResource: "Cities", ofType: "plist") else {return}
        guard FileManager.default.fileExists(atPath: plistPath) else { return}
        guard let plistXML = FileManager.default.contents(atPath: plistPath) else {return}
        
        do {
            guard let plistData = try PropertyListSerialization.propertyList(from: plistXML, options: .mutableContainersAndLeaves, format: nil)  as? DICT else {return}
            if let itemData = plistData["Cities"] as? [DICT] {
                for item in itemData {
                    if let cities = Cities(dictionary: item) {
                        _dataCities?.append(cities)
                    }
                }
                
            }
        } catch {
            print("Error reading plist: \(error)")
        }
    }
    
    // Districts
    private var _dataDistrict: [Districts]?
    
    var dataDistricts: [Districts] {
        get {
            if _dataDistrict == nil {
                getDataDistrict()
            }
            return _dataDistrict ?? []
        }
        set {
            _dataDistrict = newValue
        }
    }
    
    func getDataDistrict()  {
        _dataDistrict = []
        
        guard let plistPath = Bundle.main.path(forResource: "Districts", ofType: "plist") else {
            return }
        guard FileManager.default.fileExists(atPath: plistPath) else {return}
        guard let plistXML = FileManager.default.contents(atPath: plistPath) else {return}
        
        do {
            guard let plistData = try PropertyListSerialization.propertyList(from: plistXML, options: .mutableContainersAndLeaves, format: nil) as? DICT else {return}
            if let itemData = plistData["Districts"] as? [DICT] {
                for item in itemData {
                    if let districts = Districts(dictionary: item) {
                        _dataDistrict?.append(districts)
                    }
                }
            }
            
        } catch {
            print("Error reading plist: \(error)")
        }
        
    }
    
    func syncCityCode(dataCityCode: Int) -> [Districts] {
        var dataReceive: [Districts] = []
        for code in dataDistricts {
            if dataCityCode == code.cityCodes {
                dataReceive.append(code)
            }
        }
        return dataReceive
    }
}


