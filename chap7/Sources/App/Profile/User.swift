//
//  User.swift
//  Kuchi
//
//  Created by Adam Ahrens on 2/27/20.
//  Copyright © 2020 Omnijar. All rights reserved.
//

import Foundation
import Combine

final class User {
  
  @Published var isRegistered = false
  
  let willChange = PassthroughSubject<User, Never>()
  
  var profile = Profile() {
    willSet {
      willChange.send(self)
    }
  }
  
  init() {}
  init(name: String) {
    profile.name = name
  }
}

extension User: ObservableObject {
  
}
