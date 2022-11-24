import SwiftUI

enum ImageKey: String {
    case checkmark
}

extension Image {
    static func assetImage(_ key: ImageKey) -> Image {
        Image(key.rawValue)
    }
}

extension Image {
    static let checkmark: Image = .assetImage(.checkmark)
}
