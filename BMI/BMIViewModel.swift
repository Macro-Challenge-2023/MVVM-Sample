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
            bmiModel.weight
        }
    }

    var height: Double {
        set {
            bmiModel.height = newValue
        }
        get {
            bmiModel.height
        }
    }

    var weightAdjustment: Double { bmiModel.weightAdjustment }

    var resultTitle: String { bmiModel.resultTitle }

    var resultDescription: String { bmiModel.resultDescription }

    func calculate() {
        bmiModel.calculate()
    }
}
