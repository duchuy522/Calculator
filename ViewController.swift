//
//  ViewController.swift
//  Calculator
//
//  Created by Huy Bui on 9/19/17.
//  Copyright © 2017 Huy Bui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var ac: UIButton!
    var calculating: Bool = false
    var num1 = 0.0, num2 = 0.0
    var op = Operands.none
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func digits(_ sender: UIButton) {
        if !calculating {
            if label.text == "0" {
                label.text = String(sender.tag);
            } else {
                label.text = label.text! + String(sender.tag);
            }
        } else {
            label.text = String(sender.tag)
            calculating = false
        }
    }
    
    @IBAction func operand(_ sender: UIButton) {
        calculating = true
        let tag = sender.tag
        switch tag {
        case 10:
            num1 = Double(label.text!)!
            op = Operands.plus
        case 11:
            num1 = Double(label.text!)!
            op = Operands.subtract
        case 12:
            num1 = Double(label.text!)!
            op = Operands.multiply
        case 13:
            num1 = Double(label.text!)!
            op = Operands.divide
        case 14: //equal, call compute()
            num2 = Double(label.text!)!
            label.text = compute(num1, op: op, num2)
            op = Operands.none
            num1 = 0.0
            num2 = 0.0
        default: op = Operands.none
        }
    }
    
    @IBAction func del(_ sender: UIButton) {
        label.text = "0"
        calculating = false
        op = Operands.none
    }
    @IBAction func dot(_ sender: Any) {
        if !label.text!.contains(".") {
            label.text = label.text! + "."
        }
    }
    @IBAction func sign(_ sender: Any) {
        if label.text!.hasPrefix("-") {
            let index = label.text!.index(label.text!.startIndex, offsetBy: 1)
            label.text = label.text!.substring(from: index)
        } else {
            if label.text! != "0" {
                label.text = "-" + label.text!
            }
        }
    }
    @IBAction func percent(_ sender: Any) {
        let temp = Double(label.text!)! / 100;
        label.text = String(format: "%g", temp)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

