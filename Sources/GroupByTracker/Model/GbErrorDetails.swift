// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let gbErrorDetails = try GbErrorDetails(json)
//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

import Foundation

/// The schema for the response body when there is a 400 error because the beacon data was
/// invalid.
// MARK: - GbErrorDetails
public struct GbErrorDetails: Codable, Hashable {
    /// The errors encountered while validating the beacon according to the request body JSON
    /// Schemas.
    public var jsonSchemaValidationErrors: [String]

    public init(jsonSchemaValidationErrors: [String]) {
        self.jsonSchemaValidationErrors = jsonSchemaValidationErrors
    }
}

// MARK: GbErrorDetails convenience initializers and mutators

public extension GbErrorDetails {
    init(data: Data) throws {
        let me = try newJSONDecoder().decode(GbErrorDetails.self, from: data)
        self.init(jsonSchemaValidationErrors: me.jsonSchemaValidationErrors)
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
        jsonSchemaValidationErrors: [String]? = nil
    ) -> GbErrorDetails {
        return GbErrorDetails(
            jsonSchemaValidationErrors: jsonSchemaValidationErrors ?? self.jsonSchemaValidationErrors
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
