//
//  ContentView.swift
//  BMI
//
//  Created by Kristanto Sean on 27/09/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var weight: Double = 0
    @State var height: Double = 0
    @State var weightAdjustment: Double = 0
    @State var resultTitle: String = ""
    @State var resultDescription: String = ""
    
    var body: some View {
        VStack {
            Form {
                Section("Weight"){
                    TextField("Weight", value: $weight, formatter: NumberFormatter())
                }

                Section("Height"){
                    TextField("Height", value: $height, formatter: NumberFormatter())
                }

                Button("Calculate") {
                    if height == 0 {
                        resultTitle = "Invalid BMI Value"
                        resultDescription = "Please check your input!"
                        return
                    }

                    let bmiValue = weight / (height/100 * height/100)

                    if bmiValue <= 18.5 {
                        weightAdjustment = calculateWeightAdjustment(normalBMI: 18.5, weight: weight, height: height)
                    } else if bmiValue >= 25 {
                        weightAdjustment = calculateWeightAdjustment(normalBMI: 25, weight: weight, height: height)
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
                .listRowBackground(Color.clear)
                .buttonStyle(.borderedProminent)

                Section("Result") {
                    VStack(alignment: .leading) {
                        Text(resultTitle)
                        Text(resultDescription)
                    }
                }
            }
        }
    }
    
    func calculateWeightAdjustment(normalBMI: Double, weight: Double, height: Double) -> Double {
        let idealWeight = normalBMI * (height/100 * height/100)
        return abs(weight - idealWeight).rounded(toPlaces: 2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
