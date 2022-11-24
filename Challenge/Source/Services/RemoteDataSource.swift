import Foundation

enum RemoteDataSourceError: LocalizedError {
    case notImplemented(String = #function)
    
    var errorDescription: String? {
        switch self {
        case let .notImplemented(functionName):
            return "Function \(functionName) not implemented"
        }
    }
}

// TODO: Add data fetching from remote
final class RemoteDataSource {}

// MARK: ListDataSource
extension RemoteDataSource: ListDataSource {
    func getCheckedIds() async throws -> Set<String> {
        try notImplemented()
    }
    
    func getItems() async throws -> [ItemDTO] {
        try notImplemented()
    }
    
    func check(_ id: String) async throws -> Set<String> {
        try notImplemented()
    }
    
    func uncheck(_ id: String) async throws -> Set<String> {
        try notImplemented()
    }
}

private func notImplemented(function: String = #function) throws -> Never {
    assertionFailure("not implemented")
    throw RemoteDataSourceError.notImplemented(function)
}
