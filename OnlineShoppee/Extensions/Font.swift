//
//  Font.swift
//  OnlineShoppee
//
//  Created by anita on 3/17/23.
//

import SwiftUI

enum CustomFont: String {
    case regular = "MontserratRoman-Regular"
    case medium = "MontserratRoman-Medium"
    case semibold = "MontserratRoman-SemiBold"
    case bold = "MontserratRoman-Bold"
    case light = "MontserratRoman-Light"
    case extraLight = "MontserratRoman-ExtraLight"
}

extension Font {
    
    static func custom(_ font: CustomFont, size: CGFloat) -> SwiftUI.Font {
        return SwiftUI.Font.custom(font.rawValue, size: size)
    }
}
