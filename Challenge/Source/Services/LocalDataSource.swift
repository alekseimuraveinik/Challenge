import Foundation

final class LocalDataSource {
    private let fileReader: FileReader
    @UserDefault private var checkedIds: [String]
    
    init(
        fileReader: FileReader,
        userDefaults: UserDefaults = .standard
    ) {
        self.fileReader = fileReader
        self._checkedIds = UserDefault(
            key: "checkedIds",
            defaultValue: [],
            container: userDefaults
        )
    }
}

// MARK: ListDataSource
extension LocalDataSource: ListDataSource {
    func getCheckedIds() async throws -> Set<String> {
        Set(checkedIds)
    }
    
    func getItems() async throws -> [ItemDTO] {
        try await fileReader.read(jsonName: "items")
    }
    
    func check(_ id: String) async throws -> Set<String> {
        var stored = try await getCheckedIds()
        stored.insert(id)
        checkedIds = Array(stored)
        return stored
    }
    
    func uncheck(_ id: String) async throws -> Set<String> {
        var stored = try await getCheckedIds()
        stored.remove(id)
        checkedIds = Array(stored)
        return stored
    }
}
