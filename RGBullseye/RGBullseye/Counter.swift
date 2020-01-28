//
//  Counter.swift
//  RGBullseye
//
//  Created by Adam Ahrens on 1/27/20.
//  Copyright © 2020 Adam Ahrens. All rights reserved.
//

import Combine
import Foundation

final class Counter: ObservableObject {
  // Publisher
  @Published var counter = 0

  // Timer to perform countdown
  var timer: Timer?

  init() {
    timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(incrementCounter), userInfo: nil, repeats: true)
  }

  func stop() {
    timer?.invalidate()
    timer = nil
  }

  @objc func incrementCounter() {
    counter += 1
  }
}
