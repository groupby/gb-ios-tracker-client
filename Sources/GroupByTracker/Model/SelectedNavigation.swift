import Foundation

public struct SelectedNavigation: Codable, Hashable {
    var name: String
    var value: String
    
    
    public init(name: String, value: String) {
        self.name = name
        self.value = value
    }

}
extension SelectedNavigation {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(SelectedNavigation.self, from: data)
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
        name: String? = nil,
        value: String? = nil
    ) -> SelectedNavigation {
        return SelectedNavigation(
            name: name ?? self.name,
            value: value ?? self.value
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}


