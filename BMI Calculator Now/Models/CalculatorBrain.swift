//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Angela Yu on 28/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?
    
    func getBMIValue() -> String {
        let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiTo1DecimalPlace
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = (weight * 703) / (height * height)

        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "You are Underweight", color: #colorLiteral(red: 0, green: 0.06638821214, blue: 0.837713778, alpha: 1))
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Perfect! You are at a Healthy Weight", color: #colorLiteral(red: 0, green: 0.704760015, blue: 0, alpha: 1))
        } else if bmiValue < 29.9 {
            bmi = BMI(value: bmiValue, advice: "You are Overweight", color: #colorLiteral(red: 0.9322059751, green: 0, blue: 0, alpha: 1))
        }
        else {
        bmi = BMI(value: bmiValue, advice: "You are Obese", color: #colorLiteral(red: 0.6378107071, green: 0, blue: 0, alpha: 1))
    }
}
}
