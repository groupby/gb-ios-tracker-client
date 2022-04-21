// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let price = try Price(json)
//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

import Foundation

/// Contains data about the price of a product in event types that involve products.
// MARK: - Price
public struct Price: Codable, Hashable {
    /// The price the customer would pay (if viewing) or paid (for order events) for the product.
    public var actual: String
    /// The ISO 4217 code of the currency for the product.
    public var currency: String
    public var onSale: Bool
    /// The regular price of the product (when it is not on sale).
    public var regular: String?

    public init(actual: String, currency: String, onSale: Bool, regular: String?) {
        self.actual = actual
        self.currency = currency
        self.onSale = onSale
        self.regular = regular
    }
}

// MARK: Price convenience initializers and mutators

public extension Price {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Price.self, from: data)
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
        actual: String? = nil,
        currency: String? = nil,
        onSale: Bool? = nil,
        regular: String?? = nil
    ) -> Price {
        return Price(
            actual: actual ?? self.actual,
            currency: currency ?? self.currency,
            onSale: onSale ?? self.onSale,
            regular: regular ?? self.regular
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
