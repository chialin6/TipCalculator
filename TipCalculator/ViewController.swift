//
//  ViewController.swift
//  TipCalculator
//
//  Created by stlp on 8/8/20.
//  Copyright © 2020 codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipField: UITextField!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        billField.becomeFirstResponder()
    }

    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
//        print("hello")
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        // Get the bill now
        let bill = Double(billField.text!) ?? 0
        // Calculate Tip and Total
        let tipChoice = [15.0, 18.0, 20.0]
        var tipPercentage: Double = 0.0
        if tipControl.selectedSegmentIndex == 3 {
            tipField.isEnabled = true
            tipPercentage = Double(tipField.text!) ?? 0
        } else {
            tipField.isEnabled = false
            tipField.text = ""
            tipPercentage = tipChoice[tipControl.selectedSegmentIndex]
        }
        let tip = bill * (tipPercentage/100)
        let total = tip + bill
        // Update Tip and Total labels
        tipLabel.text = String(format: "$ %.2f", tip)
        totalLabel.text = String(format: "$ %.2f", total)
    }
    
}

