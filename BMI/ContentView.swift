//
//  ContentView.swift
//  BMI
//
//  Created by Kristanto Sean on 27/09/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var bmiViewModel: BMIViewModel

    var body: some View {
        VStack {
            Form {
                Section("Weight") {
                    TextField("Weight", value: $bmiViewModel.weight, formatter: NumberFormatter())
                }

                Section("Height") {
                    TextField("Height", value: $bmiViewModel.height, formatter: NumberFormatter())
                }

                Button("Calculate") {
                    bmiViewModel.calculate()
                }
                .listRowBackground(Color.clear)
                .buttonStyle(.borderedProminent)

                Section("Result") {
                    VStack(alignment: .leading) {
                        Text(bmiViewModel.resultTitle)
                        Text(bmiViewModel.resultDescription)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(bmiViewModel: BMIViewModel())
    }
}
