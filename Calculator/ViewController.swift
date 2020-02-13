//
//  ViewController.swift
//  UdemyCalculator
//
//  Created by bkulasiewicz on 11/02/2020.
//  Copyright © 2020 bkulasiewicz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentOperator: Operator = Operator.nothing
    var calcState: CalculationState = CalculationState.enteringNum
    var firstValue: String = ""
    
    @IBOutlet weak var viemResultLabel: UILabel!
    
    @IBAction func numberCalculator( _ sender: UIButton) {
        updateDisplay(number: String(sender.tag))
        }
    
    func updateDisplay(number: String){
        if calcState == CalculationState.newNumStarted {
            if let num = viemResultLabel.text {
                if num != "" {
                    firstValue = num
                }
            }
            calcState = CalculationState.enteringNum
            viemResultLabel.text = number
        }
        else if calcState == CalculationState.enteringNum {
            viemResultLabel.text = viemResultLabel.text! + number
        }
        
    }
    
    @IBAction func functionCalculator( _ sender: UIButton) {
        calcState = CalculationState.newNumStarted
        if let num = viemResultLabel.text {
            if num != "" {
                firstValue = num
                viemResultLabel.text = ""
            }
        }
        switch sender.tag {
        case 11:
            currentOperator = Operator.add
        case 12:
            currentOperator = Operator.minus
        case 13:
            currentOperator = Operator.times
        case 14:
            currentOperator = Operator.divide
        default:
            return
        }
        changeBackground(tag: sender.tag)
    }
    
/*    func changeBackground(buttonType: UIButton) {
        if currentOperator == Operator.add {
            buttonType.backgroundColor = UIColor.red
        }
        else if currentOperator == Operator.minus {
            buttonType.backgroundColor = UIColor.blue
        }
        else if currentOperator == Operator.times {
            buttonType.backgroundColor = UIColor.green
        }
        else if currentOperator == Operator.divide {
        buttonType.backgroundColor = UIColor.darkGray
        }
        else {
            return
        }
        
        */
    
    func changeBackground(tag: Int) {
        //clear color
        for i in 11..<15 {
            if let button = self.view.viewWithTag(i) {
                button.backgroundColor = UIColor.clear
            }
        }
        if let button = self.view.viewWithTag(tag) {
            button.backgroundColor = UIColor.red
        }
        
        

               
               
        
        
        
    }
    
    
    @IBAction func equalsCalculator( _ sender: UIButton) {
        
        
        calculateSum()
    }

    func calculateSum() {
        if firstValue.isEmpty {
            return
        }
        var result = ""
        if currentOperator == Operator.times {
            result = "\(Double(firstValue)! * Double(viemResultLabel.text!)!)"
        }
        else if currentOperator == Operator.divide{
            result = "\(Double(firstValue)! / Double(viemResultLabel.text!)!)"
        }
        else if currentOperator == Operator.add {
            result = "\(Double(firstValue)! + Double(viemResultLabel.text!)!)"
        }
        else if currentOperator == Operator.minus {
            result = "\(Double(firstValue)! - Double(viemResultLabel.text!)!)"
        }
        viemResultLabel.text = result
        calcState = CalculationState.newNumStarted
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

