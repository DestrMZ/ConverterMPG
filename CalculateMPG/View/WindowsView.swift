//
//  WindowsView.swift
//  ConvertMPG
//
//  Created by Ivan Maslennikov on 15.07.2024.
//

import SwiftUI

struct WindowsView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    @State private var mpgInput: String = ""
    @State private var result: String = ""
    @State private var animateGradient: Bool = false
    let startColor: Color = Color("startColor")
    let endColor: Color = Color("endColor")
    
    @FocusState private var isInputFocused: Bool

    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("MPG to l/100km Converter")
                    .foregroundColor(.white)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top, 50)
                    .padding(.bottom, 20)
                
                Spacer()
                
                Text(result)
                    .padding()
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .font(.title2)
                
                TextField("Enter MPG", text: $mpgInput)
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(8)
                    .foregroundColor(.white)
                    .accentColor(.white)
                    .frame(width: geometry.size.width * 0.8, height: 50)
                    .keyboardType(.decimalPad)
                    .padding(.horizontal)
                    .focused($isInputFocused)
                
                Button(action: {
                    if let mpg = Double(mpgInput) {
                        let convert = viewModel.convertMPGtoL100km(mpg: mpg)
                        result = "\(mpg) MPG соответствует \(String(format: "%.2f", convert)) литров на 100 км."
                    } else {
                        result = "Некорректный ввод данных!"
                    }
                    isInputFocused = false
                }) {
                    Text("Convert")
                        .padding()
                        .frame(width: geometry.size.width * 0.5)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(6)
                }
                .padding(.bottom, 20)
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundColor(.black)
            .padding(.horizontal)
            .multilineTextAlignment(.center)
            .background {
                LinearGradient(colors: [startColor, .cyan], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                    .hueRotation(.degrees(animateGradient ? 45 : 0))
                    .onAppear {
                        withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
                            animateGradient.toggle()
                        }
                    }
            }
        }
    }
}

#Preview {
    WindowsView()
        .environmentObject(ViewModel())
}
