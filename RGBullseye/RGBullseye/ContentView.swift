//
//  ContentView.swift
//  RGBullseye
//
//  Created by Adam Ahrens on 1/26/20.
//  Copyright © 2020 Adam Ahrens. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
  private let redTarget = Double.random(in: 0..<1)
  private let greenTarget = Double.random(in: 0..<1)
  private let blueTarget = Double.random(in: 0..<1)

  @State var redGuess: Double
  @State var greenGuess: Double
  @State var blueGuess: Double
  @State var showAlert = false

  @ObservedObject var counter = Counter()

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
          self.showAlert ? Text("R: \(Int(redTarget * 255.0))  G: \(Int(greenTarget * 255.0))  B: \(Int(blueTarget * 255.0))") : Text("Match this color")
        }
        VStack {
          ZStack(alignment: .center) {
            Color(red: redGuess, green: greenGuess, blue: blueGuess)
            Text(String(counter.counter))
              .padding(.all, 5.0)
              .background(Color.white)
              .mask(Circle())
              .foregroundColor(.black)
          }
          Text("R: \(Int(redGuess * 255.0))  G: \(Int(greenGuess * 255.0))  B: \(Int(blueGuess * 255.0))")
        }
      }

      Button(action: {
        self.showAlert = true
        self.counter.stop()
      }) {
        Text("Guess")
      }.alert(isPresented: $showAlert) {
        Alert(title: Text("Your Score"), message: Text(String(computeScore())))
      }.padding()

      VStack {
        ColorSlider(value: $redGuess, textColor: .red)
        ColorSlider(value: $greenGuess, textColor: .green)
        ColorSlider(value: $blueGuess, textColor: .blue)
      }.padding(EdgeInsets(top: 5.0, leading: 10.0, bottom: 5.0, trailing: 10.0))
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(redGuess: 0.5, greenGuess: 0.5, blueGuess: 0.5)
  }
}

struct ColorSlider: View {
  // Makes a single source of truth
  // Instead of another @State variable
  @Binding var value: Double
  var textColor: Color

  var body: some View {
    HStack {
      Text("0").foregroundColor(textColor)
      Slider(value: $value)
        .background(textColor)
        .cornerRadius(10)
        .accentColor(.white)
      Text("255").foregroundColor(textColor)
    }
  }
}
