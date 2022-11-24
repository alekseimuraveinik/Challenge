struct ItemDTO: Hashable, Identifiable {
    let id: String
    let type: ItemType
    let title: String
    let description: String
}

// MARK: Decodable
extension ItemDTO: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case type
        case title
        case description = "desc"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        
        let typeValue = try values.decode(String.self, forKey: .type)
        guard let type = ItemType(rawValue: typeValue) else {
            throw DecodingError.valueNotFound(
                ItemType.self,
                .init(
                    codingPath: [CodingKeys.type],
                    debugDescription: "`\(typeValue)` is not convertible to ItemType"
                )
            )
        }
        
        self.type = type
        title = try values.decode(String.self, forKey: .title)
        description = try values.decode(String.self, forKey: .description)
    }
}
