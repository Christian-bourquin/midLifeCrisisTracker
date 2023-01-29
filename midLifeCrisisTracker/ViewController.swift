//
//  ViewController.swift
//  midLifeCrisisTracker
//
//  Created by CHRISTIAN BOURQUIN on 1/27/23.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {

    @IBOutlet weak var ageOutlet: UILabel!
    
    @IBOutlet weak var pickerOutlet: UIPickerView!

    var foods = [String]()
    var selectedFood = ""
    var min = 40
    var max = 60
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0...100 {
            foods.append(String(i))
        }
                // need to attach the delegate of the pickerviewOutlet
                pickerOutlet.delegate = self
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    //How many rows in each wheel/component
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0{
            return foods.count
        }
        return 0
    }

    //This function is looped for you for every row in the component
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0{
            return foods[row]
        }
        return ""
    }

    // this function gets called when you stop on an item in a wheel
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0{
            selectedFood = foods[row]
        }
    }
    
    

    @IBAction func foodSubmitAction(_ sender: UIButton) {
        print(selectedFood)
        var newMin = 0
        var newMax = 0
        var ageRange = 0
        var min = 40 - (Int(selectedFood) ?? 0)
        var max = 60 - (Int(selectedFood) ?? 0)
        if max > 0{
            if min >= 0{
                newMin = min
            }
            else{
                newMin = 0
            }
            newMax = max
            print("min age is \(newMin)")
            print("max age is \(newMax)")
             ageRange = Int.random(in: newMin...newMax)
               // ageRange = ageRange - (Int(selectedFood) ?? 0)
            ageOutlet.text = "your midlife crisis will be in \(ageRange) years"

        }
        else{
        
            ageOutlet.text = "you are past the average age of a midlife crisis"
        }
       /* if 40 - (Int(selectedFood) ?? 0) > 0 {
             newMin = 40 - (Int(selectedFood) ?? 0)
        }
        else {
             newMin = 40
        }
        if 60 - (Int(selectedFood) ?? 0) > 0 {
             newMax = 60 - (Int(selectedFood) ?? 0)
        }
        else {
            newMax = 60
        }
        */
    }

 
}

