//
//  ContentView.swift
//  ColorGuessGame
//
//  Created by Lynneker Souza on 14/10/19.
//  Copyright © 2019 Lynneker Souza. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var showAlert = false
    
    let rTarget = Double.random(in: 0..<1)
    let gTarget = Double.random(in: 0..<1)
    let bTarget = Double.random(in: 0..<1)
    @State var rGuess = Double.random(in: 0..<1)
    @State var gGuess = Double.random(in: 0..<1)
    @State var bGuess = Double.random(in: 0..<1)
    
    func Int255(_ number: Double) -> Int {
        return Int(number * 255.0)
    }
    
    func computeScore() -> Int {
      let rDiff = rGuess - rTarget
      let gDiff = gGuess - gTarget
      let bDiff = bGuess - bTarget
      let diff = sqrt(rDiff * rDiff + gDiff * gDiff + bDiff * bDiff)
      return Int((1.0 - diff) * 100.0 + 0.5)
    }
    
    var body: some View {
        VStack {
            HStack {
                // Target color block
                VStack {
                    Rectangle()
                    .foregroundColor(Color(red: rTarget, green: gTarget, blue: bTarget, opacity: 1.0))
                    Text("Match this color")
                }
                // Guess color block
                VStack {
                    Rectangle()
                    .foregroundColor(Color(red: rGuess, green: gGuess, blue: bGuess, opacity: 1.0))
                    HStack {
                      Text("R: \(Int255(rGuess))")
                      Text("G: \(Int255(gGuess))")
                      Text("B: \(Int255(bGuess))")
                    }
                }
            }
            
            
            Button(action: {
                self.showAlert = true
            }) {
              Text("Done!")
            }
            .padding()
            .alert(isPresented: $showAlert) {
              Alert(title: Text("Your Score"), message: Text("\(computeScore())"))
            }
            
            VStack {
                ColorSlider(value: $rGuess, textColor: .red)
                ColorSlider(value: $gGuess, textColor: .green)
                ColorSlider(value: $bGuess, textColor: .blue)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}

struct ColorSlider: View {
    @Binding var value: Double
    var textColor: Color
    var body: some View {
        HStack {
            Text("0")
              .foregroundColor(textColor)
            Slider(value: $value)
            Text("255")
              .foregroundColor(textColor)
        }
        .padding()
    }
}
