//
//  Colors.swift
//  Cat.2
//
//  Created by Ihor Stalevskiy on 25.03.2025.
//

import Foundation
import SwiftUICore

//Фонові/текстові кольори

//struct Colors {
//    static let background = Color(hue: 0.56, saturation: 0.97, brightness: 0.28)
//    static let foreground = Color(hue: 0.31, saturation: 0.14, brightness: 0.92)
//    static let backgroundFrame = Color(hue: 0.54, saturation: 0.50, brightness: 0.43)
//}

import SwiftUI

enum Colors {
    static let background = Color("Background")
    static let foreground = Color("Foreground")
    static let cardBackground = Color("CardBackground")
    static let tagBackground = Color.blue.opacity(0.2)
  //  static let accent = Color("AppAccent")
}

// використання
// .background(Colors.background)
//   .foregroundColor(Colors.foreground)
// .backgroundFrame(Colors.backgroundFrame)
