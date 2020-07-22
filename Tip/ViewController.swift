//
//  ViewController.swift
//  Tip
//
//  Created by Svitlana Honcharuk on 12.07.2020.
//  Copyright © 2020 Lana Honcharuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var splitSlider: UISlider!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var totalPerPersonLabel: UILabel!
    @IBOutlet weak var dollarSign: UILabel!
    
    @IBOutlet weak var navigationBar: UINavigationItem!
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billAmountTextField.becomeFirstResponder();
        
        
        UIView.animate(withDuration: 0.2, delay: 0.0,
                        options: [.autoreverse,.repeat], animations: { () -> Void in
           self.dollarSign.transform = CGAffineTransform(translationX: 0, y: 2)
        }, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let tipPercentage = defaults.integer(forKey: "tipPercentage")
        tipPercentageSlider.value = Float(tipPercentage)
        tipPercentageLabel.text = "\(tipPercentage)%"
        
        let split = defaults.integer(forKey: "split")
        splitSlider.value = Float(split)
        splitLabel.text = String(split)
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        // Get the bill amount
        let bill = Double(billAmountTextField.text!) ?? 0.00
        
        // Calculate the tip and total
        let tipPercentage = round(tipPercentageSlider.value)
        let tip = bill * Double(tipPercentage) / 100
        let total = bill + tip
        
        // Calculate Per Person
        let peopleCount = Int(splitSlider.value)
        let totalPerPerson = total / Double(peopleCount)
        
        // Update the tip and total labels
        tipPercentageLabel.text = "\(Int(tipPercentage))%"
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        splitLabel.text = String(peopleCount)
        totalPerPersonLabel.text = String(format: "$%.2f", totalPerPerson)
    }
}
