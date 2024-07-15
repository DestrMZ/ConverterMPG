//
//  CalculateMPGApp.swift
//  CalculateMPG
//
//  Created by Ivan Maslennikov on 15.07.2024.
//

import SwiftUI

@main
struct CalculateMPGApp: App {
    
    @StateObject private var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                WindowsView()
                    .environmentObject(viewModel)
            }
        }
    }
}
