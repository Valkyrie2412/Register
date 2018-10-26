//
//  InformationViewController.swift
//  Register
//
//  Created by Hiếu Nguyễn on 9/18/18.
//  Copyright © 2018 Hiếu Nguyễn. All rights reserved.
//

import UIKit

class InformationViewController: UIViewController {
    
    @IBOutlet weak var infoAge: UILabel!
    @IBOutlet weak var infoName: UILabel!
    @IBOutlet weak var infoGender: UILabel!
    @IBOutlet weak var infoCity: UILabel!
    @IBOutlet weak var infoDistrict: UILabel!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        gettingData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func gettingData()  {
         let name = defaults.string(forKey: "name") ?? "Unknown Name"
        infoName.text = name
        let age = defaults.integer(forKey: "age") 
        infoAge.text = String(age)
         let gender = defaults.string(forKey: "gender") ?? "Unknown Gender"
         infoGender.text = gender
         let city = defaults.string(forKey: "city") ?? "Unknown City"
        infoCity.text = city
         let district = defaults.string(forKey: "district") ?? "Unknown District"
        infoDistrict.text = district
        
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
