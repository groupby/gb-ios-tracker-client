// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let metadata = try Metadata(json)
//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

import Foundation

/// The metadata component. Miscellaneous data that a GroupBy customer may want to include in
/// their beacons. This is an advanced feature that is only used when the customer is talking
/// to their Customer Success rep, who has instructed them to add certain metadata to their
/// beacons. It is used in all event types. Omit if there are no metadata items you want to
/// send in the beacon.
///
/// A metadata item.
// MARK: - Metadata
public struct Metadata: Codable, Hashable {
    /// The metadata item's key.
    public var key: String
    /// The metadata item's value.
    public var value: String

    public init(key: String, value: String) {
        self.key = key
        self.value = value
    }
}

// MARK: Metadata convenience initializers and mutators

public extension Metadata {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Metadata.self, from: data)
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
        key: String? = nil,
        value: String? = nil
    ) -> Metadata {
        return Metadata(
            key: key ?? self.key,
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
