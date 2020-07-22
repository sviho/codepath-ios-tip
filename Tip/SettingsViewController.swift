//
//  SettingsViewController.swift
//  Tip
//
//  Created by Svitlana Honcharuk on 22.07.2020.
//  Copyright © 2020 Lana Honcharuk. All rights reserved.
//

import Foundation

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    @IBOutlet weak var splitSlider: UISlider!
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tipPercentage = defaults.integer(forKey: "tipPercentage")
        tipPercentageSlider.value = Float(tipPercentage)
        tipPercentageLabel.text = "\(tipPercentage)%"
        
        let split = defaults.integer(forKey: "split")
        splitSlider.value = Float(split)
        splitLabel.text = String(split)
    }
    
    @IBAction func defaultTipChanged(_ sender: UISlider) {
        let tipPercentage = Int(sender.value)
        tipPercentageLabel.text = "\(tipPercentage)%"
        defaults.set(tipPercentage, forKey: "tipPercentage")
    }
    
    @IBAction func defaultSplitChanged(_ sender: UISlider) {
        let split = Int(sender.value)
        splitLabel.text = String(split)
        defaults.set(split, forKey: "split")
    }
}
