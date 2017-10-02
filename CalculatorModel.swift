//
//  CalculatorModel.swift
//  Calculator
//
//  Created by Huy Bui on 9/23/17.
//  Copyright © 2017 Huy Bui. All rights reserved.
//

import Foundation
enum Operands {
    case divide, multiply, plus, subtract, none
}
func compute(_ num1: Double, op: Operands, _ num2: Double) -> String {
    var result: Double
    switch op {
    case .plus:
        result = num1 + num2
    case .subtract:
        result = num1 - num2
    case .multiply:
        result = num1 * num2
    case .divide:
        result = num1 / num2
    default:
        result = 0
    }

    return String(format: "%g", result)
}

