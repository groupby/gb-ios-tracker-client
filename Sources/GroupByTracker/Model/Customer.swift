// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let customer = try Customer(json)
//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

import Foundation

/// Contains data about the GroupBy customer sending the beacons.
// MARK: - Customer
struct Customer: Codable, Hashable {
    /// The customer's area.
    public var area: String
    /// The customer's customer ID. Must be alphanumeric and must start with an alphabetic
    /// character.
    public var id: String

    public init(area: String, id: String) {
        self.area = area
        self.id = id
    }
    
    init() {
        self.area = ""
        self.id = ""
    }
}

// MARK: Customer convenience initializers and mutators

extension Customer {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Customer.self, from: data)
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
        area: String? = nil,
        id: String? = nil
    ) -> Customer {
        return Customer(
            area: area ?? self.area,
            id: id ?? self.id
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
