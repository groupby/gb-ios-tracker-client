// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let recImpressionEvent = try RecImpressionEvent(json)
//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

import Foundation

/// The event data for a recImpression event.
// MARK: - RecImpressionEvent
public struct RecImpressionEvent: Codable, Hashable {
    public var googleAttributionToken: String?
    /// The products the shopper witnessed during the event. It's valid for it to be just one
    /// product (ex. a prompt for them to add a particular product to their cart) and also
    /// multiple products (ex. a carousel of product recommendations displayed as they scroll
    /// down a PLP).
    public var products: [Product]

    public init(products: [Product], googleAttributionToken: String?) {
        self.googleAttributionToken = googleAttributionToken
        self.products = products
    }
}

// MARK: RecImpressionEvent convenience initializers and mutators

public extension RecImpressionEvent {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(RecImpressionEvent.self, from: data)
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
        products: [Product]? = nil,
        googleAttributionToken: String?? = nil
    ) -> RecImpressionEvent {
        return RecImpressionEvent(
            products: products ?? self.products,
            googleAttributionToken: googleAttributionToken ?? self.googleAttributionToken
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
