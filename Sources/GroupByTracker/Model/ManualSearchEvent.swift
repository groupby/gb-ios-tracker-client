import Foundation

public struct ManualSearchEvent : Codable, Hashable {
    var googleAttributionToken: String?
    var search: Search
    
    public init(googleAttributionToken: String?, search: Search) {
        self.googleAttributionToken = googleAttributionToken
        self.search = search
    }
    
    public init(search: Search) {
        self.search = search
    }


}
extension ManualSearchEvent {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(ManualSearchEvent.self, from: data)
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
        googleAttributionToken: String? = nil,
        search: Search? = nil
    ) -> ManualSearchEvent {
        return ManualSearchEvent(
            googleAttributionToken: googleAttributionToken ?? self.googleAttributionToken,
            search: search ?? self.search
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
