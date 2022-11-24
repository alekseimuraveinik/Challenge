import SwiftUI

struct ListView<ViewModel: ListViewModel>: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: titleListSpacing) {
            Text(title(count: viewModel.uncheckedCount))
                .font(.medium)
                .foregroundColor(Palette.white)
                .padding(.top, topPadding)
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: itemsSpacing) {
                    ForEach(viewModel.items) { item in
                        ListItemView(item: item, isChecked: isChecked(item: item))
                    }
                }
                .padding(.top, listTopInset)
                .padding(.bottom, listBottomInset)
            }
        }
        .padding(.horizontal, horizontalPadding)
        .background(Palette.backgound.edgesIgnoringSafeArea(.all))
        .navigationBarHidden(true)
        .onAppear(perform: viewModel.loadItems)
    }
    
    private func isChecked(item: ItemDTO) -> Binding<Bool> {
        .init {
            viewModel.checkedIds.contains(item.id)
        } set: { isChecked in
            viewModel.setIsChecked(isChecked, item: item)
        }
    }
}

private func title(count: Int) -> String {
    if count > 0 {
        return "You have \(count) uncompleted things"
    }
    return "Good job!"
}

private let topPadding = 34.0
private let horizontalPadding = 20.0

private let titleListSpacing = 10.0

private let listTopInset = 24.0
private let listBottomInset = 16.0
private let itemsSpacing = 15.0


// MARK: Preview
struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(
            viewModel: ListViewModelMock(
                items: [
                    ItemDTO(
                        id: "1",
                        type: .exercise,
                        title: "Breathe Air",
                        description: "It's good"
                    ),
                    ItemDTO(
                        id: "2",
                        type: .meal,
                        title: "Water",
                        description: "It's also good"
                    )
                ],
                checkedIds: ["1"]
            )
        )
    }
}

private final class ListViewModelMock: ListViewModel {
    var items: [ItemDTO]
    var checkedIds: Set<String>
    
    init(items: [ItemDTO], checkedIds: Set<String>) {
        self.items = items
        self.checkedIds = checkedIds
    }
    
    func loadItems() {}
    func setIsChecked(_ isChecked: Bool, item: ItemDTO) {}
}
