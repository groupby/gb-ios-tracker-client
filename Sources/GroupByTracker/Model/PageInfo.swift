import Foundation
 
public struct  PageInfo :   Codable, Hashable   {
    private var recordStart: Int64
    private var recordEnd: Int64

    public init(recordStart: Int64, recordEnd: Int64) {
        self.recordStart = recordStart
        self.recordEnd = recordEnd
    }

}

extension PageInfo {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(PageInfo.self, from: data)
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
        recordStart: Int64,
        recordEnd: Int64
    ) -> PageInfo {
        return PageInfo(
            recordStart: recordStart ?? self.recordStart,
            recordEnd: recordEnd ?? self.recordEnd
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
