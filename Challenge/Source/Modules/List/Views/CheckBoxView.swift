import SwiftUI

struct CheckBoxView: View {
    @Binding var isChecked: Bool
    
    var body: some View {
        RoundedRectangle(cornerRadius: radius)
            .foregroundColor(isChecked ? Palette.dark : Color.clear)
            .overlay(
                RoundedRectangle(cornerRadius: radius)
                    .stroke(Palette.light, lineWidth: borderWidth)
                    .overlay(
                        Image.checkmark
                            .foregroundColor(Palette.light)
                            .opacity(isChecked ? 1 : 0)
                    )
            )
            .contentShape(Rectangle())
            .onTapGesture {
                isChecked.toggle()
            }
    }
}

private let radius = 9.0
private let borderWidth = 1.0
