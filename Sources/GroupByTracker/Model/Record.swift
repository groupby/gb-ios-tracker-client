import Foundation

public struct  Record :  Codable, Hashable {
    private var id: String
    private var title: String

    public init(id: String, title: String) {
        self.id = id
        self.title = title
    }

}
extension Record {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Record.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        id: String? = nil,
        title: String? = nil
    ) -> Record {
        return Record(
            id: id ?? self.id,
            title: title ?? self.title
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}