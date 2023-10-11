//
//  BMIModel.swift
//  BMI
//
//  Created by Aaron Christopher Tanhar on 11/10/23.
//

import Foundation

struct BMIModel {
    var weight: Double = 0
    var height: Double = 0
    var weightAdjustment: Double = 0
    var resultTitle: String = ""
    var resultDescription: String = ""

    func calculateWeightAdjustment(normalBMI: Double) -> Double {
        let idealWeight = normalBMI * (height/100 * height/100)
        return abs(weight - idealWeight).rounded(toPlaces: 2)
    }

    mutating func calculate() {
        if height == 0 {
            resultTitle = "Invalid BMI Value"
            resultDescription = "Please check your input!"
            return
        }

        let bmiValue = weight / (height/100 * height/100)

        if bmiValue <= 18.5 {
            weightAdjustment = calculateWeightAdjustment(normalBMI: 18.5)
        } else if bmiValue >= 25 {
            weightAdjustment = calculateWeightAdjustment(normalBMI: 25)
        }
        
        var result = ""
        switch (bmiValue) {
        case 0...16:
            result = "Based on your BMI value, you are severely underweight and need to gain \(weightAdjustment) kg"
        case 16...17:
            result = "Based on your BMI value, you are moderately underweight and need to gain \(weightAdjustment) kg"
        case 17...18.5:
            result = "Based on your BMI value, you are underweight and need to gain \(weightAdjustment) kg"
        case 18.5...25:
            result = "Your BMI is normal"
        case 25...30:
            result = "Based on your BMI value, you are overweight and need to lose \(weightAdjustment) kg"
        case 30...35:
            result = "Based on your BMI value, you have Class I Obesity and need to lose \(weightAdjustment) kg"
        case 35...40:
            result = "Based on your BMI value, you have Class II Obesity and need to lose \(weightAdjustment) kg"
        case 40...100:
            result = "Based on your BMI value, you have Class III Obesity and need to lose \(weightAdjustment) kg"
        default:
            result = "Not Found!"
        }
        resultTitle = "Your BMI Index is \(bmiValue.rounded(toPlaces: 2)) kg/m2"
        resultDescription = result
    }
}
