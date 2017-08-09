//
//  TipModel.swift
//  TipCalculator
//
//  Created by Todd Fields on 2017-08-08.
//  Copyright © 2017 SKULLGATE Studios. All rights reserved.
//

import Foundation

class TipModel {
    
    // MARK: - Variables
    private var _billAmount: Double = 0
    private var _tipPercent: Double = 0
    private var _tipAmount: Double = 0
    private var _totalAmount: Double = 0
    private var _tipSplit: Int = 0
    private var _youPay: Double = 0
    
    var billAmount: Double {
        get {
            return _billAmount
        }
        set {
            _billAmount = newValue
        }
    }
    
    var tipPercent: Double {
        get {
            return _tipPercent
        }
        set {
            _tipPercent = newValue
        }
    }
    
    var tipSplit: Int {
        get {
            return _tipSplit
        }
        set {
            _tipSplit = newValue
        }
    }
    
    var tipAmount: Double {
        
        return _tipAmount
    }
    
    var totalAmount: Double {
        
        return _totalAmount
    }
    
    var youPay: Double {
        
        return _youPay
    }
    
    
    // MARK: - Initialization
    init(billAmount: Double, tipPercent: Double, tipSplit: Int) {
        
        self._billAmount = billAmount
        self._tipPercent = tipPercent
        self.tipSplit = tipSplit
    }
    
    func calculateTip() {
        
        _tipAmount = billAmount * tipPercent
        _totalAmount = billAmount + tipAmount
        _youPay = totalAmount / (Double(tipSplit))
    }
}






































