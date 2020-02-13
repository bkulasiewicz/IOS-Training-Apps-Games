//
//  StructEnum.swift
//  UdemyCalculator
//
//  Created by bkulasiewicz on 12/02/2020.
//  Copyright © 2020 bkulasiewicz. All rights reserved.
//

import Foundation



enum Operator: String {
    case add = "+"
    case minus = "-"
    case times = "*"
    case divide = "/"
    case nothing = ""
    
}
enum CalculationState: String {
    case enteringNum = "EnteringNumber"
    case newNumStarted = "NewNumStarted"
}
