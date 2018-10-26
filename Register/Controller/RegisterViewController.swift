//
//  RegisterViewController.swift
//  Register
//
//  Created by Hiếu Nguyễn on 9/17/18.
//  Copyright © 2018 Hiếu Nguyễn. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet var buttonArray: [UIButton]!
    var pickerData: [Int] = [Int]()
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
//        if let typeText = defaults.string(forKey: "name") {
//            nameText.text = typeText
//        }
        
        self.picker.delegate = self
        self.picker.dataSource = self
        
        pickerData = Array(10...30)
        picker.selectRow(8, inComponent: 0, animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(pickerData[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        defaults.set(String(pickerData[row]), forKey: "age")
    }
    
    
    @IBAction func btnClicked(sender: UIButton) {
        buttonArray.forEach { (button) in
            button.isSelected = false
        }
        sender.isSelected = true
        defaults.set(sender.title(for: .selected), forKey: "gender")
    }
    
    @IBAction func btnRegister(_ sender: UIButton) {
        if nameText.text != nil {
            defaults.set(nameText.text, forKey: "name")
            print("Store")
        }
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
