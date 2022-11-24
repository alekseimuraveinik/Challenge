import SwiftUI

struct DetailsView: View {    
    let item: ItemDTO
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        VStack(alignment: .leading, spacing: titleDescriptionSpacing) {
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text(backButtonTitle)
                        .font(.medium)
                        .foregroundColor(Palette.white)
                }
                .padding(.top, topPadding)
                
                Spacer()
            }
            
            Spacer()
            
            Text(item.title)
                .font(.veryLarge)
                .foregroundColor(Palette.white)
            
            Text(item.description)
                .font(.small)
                .foregroundColor(Palette.white)
            
            Spacer()
        }
        .padding(.horizontal, 20)
        .navigationBarHidden(true)
        .background(Palette.dark.edgesIgnoringSafeArea(.all))
    }
}

private let backButtonTitle = "Back"
private let topPadding = 28.0
private let titleDescriptionSpacing = 10.0


// MARK: Preview
struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(
            item: ItemDTO(
                id: "1",
                type: .exercise,
                title: "Breathe Air",
                description: "It's good"
            )
        )
    }
}
