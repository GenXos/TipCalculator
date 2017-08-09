//
//  ViewController.swift
//  TipCalculator
//
//  Created by Todd Fields on 2017-08-07.
//  Copyright © 2017 SKULLGATE Studios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipSplitSlider: UISlider!
    @IBOutlet weak var tipSplitLabel: UILabel!
    @IBOutlet weak var youPayLabel: UILabel!
    
    // MARK: - Variables
    var tip = TipModel(billAmount: 0.0, tipPercent: 0.0, tipSplit: 1)
    
    // MARK: - Initialization
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.becomeFirstResponder()
        setTipCalculationValues()
        updateUI()
    }
    
    // MARK: - Functions
    func setTipCalculationValues() {
        
        tip.tipPercent = Double(tipPercentageSlider.value)
        tip.billAmount = ((textField.text)! as NSString).doubleValue
        tip.tipSplit = Int(tipSplitSlider.value)
        tip.calculateTip()
    }
    
    func updateUI() {
        
        tipLabel.text = String(format: "$%0.2f", tip.tipAmount)
        totalLabel.text = String(format: "$%0.2f", tip.totalAmount)
        tipPercentageLabel.text = "Tip \(Int(tipPercentageSlider.value * 100))%"
        tipSplitLabel.text = "\(Int(tipSplitSlider.value))-way split"
        
        youPayLabel.text = String(format: "$%0.2f", tip.youPay)
    }
    
    // MARK: - IBActions
    
    @IBAction func billAmountDidChange(_ sender: Any) {
        
        setTipCalculationValues()
        updateUI()
    }
    
    @IBAction func tipPercentageDidChange(_ sender: UISlider) {
        
        let steps: Float = 100
        let roundedValue = round(sender.value * steps) / steps
        sender.value = roundedValue
        
        setTipCalculationValues()
        updateUI()
    }

    
    @IBAction func tipSplitDidChange(_ sender: UISlider) {
        
        let steps: Float = 100
        let roundedValue = round(sender.value * steps) / steps
        sender.value = roundedValue
        
        print(Int(tipSplitSlider.value))
        setTipCalculationValues()
        updateUI()
    }
    
}

