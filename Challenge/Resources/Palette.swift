import SwiftUI

enum ColorKey: String {
    case background
    case dark
    case light
    case white
}

extension UIColor {
    static func assetColor(_ key: ColorKey) -> UIColor {
        UIColor(named: key.rawValue)!
    }
}

extension Color {
    static func assetColor(_ key: ColorKey) -> Color {
        Color(key.rawValue)
    }
}

enum Palette {
    static let backgound: Color = .assetColor(.background)
    static let dark: Color = .assetColor(.dark)
    static let light: Color = .assetColor(.light)
    static let white: Color = .assetColor(.white)
}
