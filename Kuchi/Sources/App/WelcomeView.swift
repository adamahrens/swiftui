//
//  WelcomeView.swift
//  Kuchi
//
//  Created by Adam Ahrens on 2/3/20.
//  Copyright © 2020 Omnijar. All rights reserved.
//

import SwiftUI

struct WelcomeView: View {
  private let side = CGFloat(60.0)

    var body: some View {
      // Cmd + click -> Show SwiftUI Inspector
      // Ton of modifiers
      ZStack {
        Image("welcome-background")
          .resizable()
          .edgesIgnoringSafeArea(.all)
          .saturation(0.5)
          .blur(radius: 5.0)
          .opacity(0.4)
          .aspectRatio(1 / 1, contentMode: .fill)
        VStack {
          VStack {
            Text("Hello to")
              .bold()
            Text("Kuchi World")
              .bold()
            }
          .font(.system(size: side))
          .foregroundColor(.red)
          .background(Color.black)
          .lineLimit(2)
          .multilineTextAlignment(.center)

          Image(systemName: "table")
            .resizable()
            .frame(width: side, height: side, alignment: .center)
            .cornerRadius(side / 2)
            .border(Color.gray, width: 1)
            .background(Color.black)
            .clipShape(Circle())
            .foregroundColor(.red)
        }
      }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
