//
//  ViewController.swift
//  Calculator
//
//  Created by Matt Vroom on 2/5/17.
//  Copyright © 2017 Vroom Industries. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //numbers
    
    @IBOutlet private weak var display: UILabel!
    
    private var userIsInTheMiddleOfTyping = false
    
    @IBAction private func touchDigit(_ sender: UIButton) {
        
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping{
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        }
        else {
            display.text = digit
        }
        userIsInTheMiddleOfTyping = true
    }
    
    //additonal buttons
    
    private var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    private var brain = CalculatorBrain()
    @IBAction private func performOperation(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping {
            brain.setOperand(operand: displayValue)
            userIsInTheMiddleOfTyping = false
        }
        
        
        if let mathSymbol = sender.currentTitle {
            brain.performOperation(symbol: mathSymbol)
            
        }
        displayValue = brain.result
    }
    
    //clear button
    
    @IBAction func clearButton(_ sender: UIButton) {
        
        
        if userIsInTheMiddleOfTyping == true{
            display.text = "0"
            
            userIsInTheMiddleOfTyping = false
        }
        else {
            display.text = ""
        }
        
    }
    
}

