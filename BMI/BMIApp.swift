//
//  BMIApp.swift
//  BMI
//
//  Created by Kristanto Sean on 29/09/23.
//

import SwiftUI

@main
struct BMIApp: App {
    @StateObject var bmiViewModel = BMIViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView(bmiViewModel: bmiViewModel)
        }
    }
}
