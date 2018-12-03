//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Levi Yoder on 12/3/18.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    private var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double){
        self.number = number
    }
   
    mutating func calculate(symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n * 0.01
            case "=":
                return performTwoNumberCalculation(n2: n)
            default:
                 intermediateCalculation = (n1: n, calcMethod: symbol)
                
                }
            
        }
        
        return nil
    }
    
    
  private func performTwoNumberCalculation(n2: Double) -> Double? {
       
    if let n1 = intermediateCalculation?.n1,
        let method = intermediateCalculation?.calcMethod {
        
        switch method {
        case "+":
            return n1 + n2
        case "-":
            return n1 - n2
        case "÷":
            return n1 / n2
        case "×":
            return n1 * n2
        default:
            fatalError("The method passed in doesn't match any of the cases")
        }
     
    }
    return nil
    }
    
}
