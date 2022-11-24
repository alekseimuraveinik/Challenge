import SwiftUI

protocol ListDataSource: AnyObject {
    func getCheckedIds() async throws -> Set<String>
    func getItems() async throws -> [ItemDTO]
    
    func check(_ id: String) async throws -> Set<String>
    func uncheck(_ id: String) async throws -> Set<String>
}

protocol ListViewModel: ObservableObject {
    var items: [ItemDTO] { get }
    var checkedIds: Set<String> { get }
    
    func loadItems()
    func setIsChecked(_ isChecked: Bool, item: ItemDTO)
}

extension ListViewModel {
    var uncheckedCount: Int {
        items.count - checkedIds.count
    }
}

final class ListViewModelImpl: ListViewModel {
    @Published private(set) var items = [ItemDTO]()
    @Published private(set) var checkedIds = Set<String>()
    var uncompletedThingsCount: Int {
        items.count - checkedIds.count
    }
    
    private let dataSource: ListDataSource
    
    init(dataSource: ListDataSource) {
        self.dataSource = dataSource
    }
    
    func loadItems() {
        Task {
            let items = try await dataSource.getItems()
            let checkedIds = try await dataSource.getCheckedIds()
            
            await MainActor.run {
                self.checkedIds = Set(checkedIds)
                self.items = items
            }
        }
    }
    
    func setIsChecked(_ isChecked: Bool, item: ItemDTO) {
        Task {
            let update = isChecked ? dataSource.check : dataSource.uncheck
            let ids = try await update(item.id)
            
            await MainActor.run {
                self.checkedIds = ids
            }
        }
    }
}
