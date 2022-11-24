import SwiftUI

struct ListItemView: View {
    let item: ItemDTO
    @Binding var isChecked: Bool
    
    var body: some View {
        HStack(spacing: checkBoxTextSpacing) {
            CheckBoxView(isChecked: $isChecked)
                .frame(width: checkBoxSize, height: checkBoxSize)
            
            VStack(alignment: .leading, spacing: typeTitleSpacing) {
                Text(item.type.rawValue.capitalized)
                    .font(.small)
                    .foregroundColor(isChecked ? Palette.dark : Palette.white)
                
                NavigationLink(destination: DetailsView(item: item)) {
                    Text(item.title)
                        .font(.large)
                        .foregroundColor(isChecked ? Palette.dark : Palette.white)
                }
            }
            
            Spacer()
        }
        .padding(.horizontal, horizontalPadding)
        .background(
            Rectangle()
                .foregroundColor(isChecked ? Palette.light : Palette.dark)
                .frame(height: height)
        )
        .frame(maxWidth: .infinity, idealHeight: height)
        .cornerRadius(radius)
    }
}

private let horizontalPadding = 24.0
private let height = 84.0
private let radius = 14.0

private let checkBoxSize = 36.0
private let checkBoxTextSpacing = 20.0
private let typeTitleSpacing = 8.0
