//
//  GuessView.swift
//  RGBullseye
//
//  Created by Adam Ahrens on 1/27/20.
//  Copyright © 2020 Adam Ahrens. All rights reserved.
//

import SwiftUI

struct GuessView: View {
  @State var guess = 0.5
  @State var showAlert = false

  private let initialGuess = Int.random(in: 1...100)

  func computeScore() -> Int {
    let difference = abs(initialGuess - Int(guess * 100))
    return difference
  }

  var body: some View {
    NavigationView {
      VStack {
        Text("Put the bullsye closest to \(initialGuess)")
        GuessSlider(value: $guess).background(Color.blue)
        Button(action: {
          self.showAlert = true
        }) {
          Text("Guess")
        }.alert(isPresented: $showAlert) {
          Alert(title: Text("Your Score"), message: Text(String(computeScore())))
        }.padding()
      }
    }.navigationBarTitle("Matcher", displayMode: .inline)
  }
}

struct GuessSlider: View {
  @Binding var value: Double

  var body: some View {
    HStack {
      Text("1")
      Slider(value: $value)
      Text("100")
    }.padding(.leading, 20.0)
      .padding(.trailing, 20.0)
  }
}

struct GuessView_Previews: PreviewProvider {
  static var previews: some View {
    // Need top level element in NavigationView
    GuessView().environment(\.colorScheme, .light)
  }
}
