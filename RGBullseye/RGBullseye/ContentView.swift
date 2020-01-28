//
//  ContentView.swift
//  RGBullseye
//
//  Created by Adam Ahrens on 1/26/20.
//  Copyright © 2020 Adam Ahrens. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  private let redTarget = Double.random(in: 0..<1)
  private let greenTarget = Double.random(in: 0..<1)
  private let blueTarget = Double.random(in: 0..<1)

  @State var redGuess: Double
  @State var greenGuess: Double
  @State var blueGuess: Double
  @State var showAlert = false

  func computeScore() -> Int {
    let redDelta = redGuess - redTarget
    let greenDelta = greenGuess - greenTarget
    let blueDelta = blueGuess - blueTarget
    let diff = sqrt(redDelta * redDelta + greenDelta * greenDelta + blueDelta * blueDelta)
    return Int((1.0 - diff) * 100.0 + 0.5)
  }

  var body: some View {
    VStack {
      HStack {
        VStack {
          Color(red: redTarget, green: greenTarget, blue: blueTarget)
          Text("Match this color")
        }
        VStack {
          Color(red: redGuess, green: greenGuess, blue: blueGuess)
          Text("R: \(Int(redGuess * 255.0))  G: \(Int(greenGuess * 255.0))  B: \(Int(blueGuess * 255.0))")
        }
      }

      Button(action: {
        self.showAlert = true
      }) {
        Text("Guess")
      }.alert(isPresented: $showAlert) {
        Alert(title: Text("Your Score"), message: Text(String(computeScore())))
      }.padding()

      ColorSlider(value: $redGuess, textColor: .red)
      ColorSlider(value: $greenGuess, textColor: .green)
      ColorSlider(value: $blueGuess, textColor: .blue)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(redGuess: 0.5, greenGuess: 0.5, blueGuess: 0.5)
  }
}

struct ColorSlider: View {
  @Binding var value: Double
  var textColor: Color

  var body: some View {
    HStack {
      Text("0").foregroundColor(textColor)
      Slider(value: $value)
      Text("255").foregroundColor(textColor)
    }.padding(.leading, 20.0)
      .padding(.trailing, 20.0)
  }
}
