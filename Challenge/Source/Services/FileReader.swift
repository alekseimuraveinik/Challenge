import Foundation

enum FileReaderError: LocalizedError {
    case pathNotFound(resourceName: String)
    
    var errorDescription: String? {
        switch self {
        case let .pathNotFound(resourceName):
            return "Unable to find file `\(resourceName)`"
        }
    }
}

final class FileReader {
    private let bundle: Bundle
    
    init(bundle: Bundle = .main) {
        self.bundle = bundle
    }
    
    func read(fileName: String, fileType: String) async throws -> Data {
        guard let path = bundle.path(forResource: fileName, ofType: fileType) else {
            throw FileReaderError.pathNotFound(resourceName: "\(fileName).\(fileType)")
        }

        return try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
    }
    
    func read<T: Decodable>(jsonName: String) async throws -> T {
        let data = try await read(fileName: jsonName, fileType: "json")
        return try JSONDecoder().decode(T.self, from: data)
    }
}
