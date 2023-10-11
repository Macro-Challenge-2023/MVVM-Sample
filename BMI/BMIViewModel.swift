//
//  BMIViewModel.swift
//  BMI
//
//  Created by Aaron Christopher Tanhar on 11/10/23.
//

import Foundation

class BMIViewModel: ObservableObject {
    @Published private var bmiModel = BMIModel()

    var weight: Double {
        set {
            bmiModel.weight = newValue
        }
        get {
            return bmiModel.weight
        }
    }
    var height: Double {
        set {
            bmiModel.height = newValue
        }
        get {
            return bmiModel.height
        }
    }
    var weightAdjustment: Double {
        set {
            bmiModel.weightAdjustment = newValue
        }
        get {
            return bmiModel.weightAdjustment
        }
    }
    var resultTitle: String {
        set {
            bmiModel.resultTitle = newValue
        }
        get {
            return bmiModel.resultTitle
        }
    }
    var resultDescription: String {
        set {
            bmiModel.resultDescription = newValue
        }
        get {
            return bmiModel.resultDescription
        }
    }
    
    func calculate() {
        bmiModel.calculate()
    }
}
