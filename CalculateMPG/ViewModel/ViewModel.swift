//
//  ViewModel.swift
//  ConvertMPG
//
//  Created by Ivan Maslennikov on 15.07.2024.
//

import Foundation

class ViewModel: ObservableObject {
 
    
    func convertMPGtoL100km(mpg: Double) -> Double {
        let conversionFactor = 235.215
        let l100km = conversionFactor / mpg
        return l100km
    }
}
