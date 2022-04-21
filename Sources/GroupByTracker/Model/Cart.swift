// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let cart = try Cart(json)
//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

import Foundation

/// Contains data about the cart in an event involving interacting with a cart.
// MARK: - Cart
public struct Cart: Codable, Hashable {
    /// The cart items in the cart.
    public var items: [CartItem]
    /// The cart's type. A freeform text field that can be used by the GroupBy customer to
    /// indicate what kind of cart products were added to, removed from, or ordered from.
    /// Example: "wedding registry".
    public var type: String?

    public init(items: [CartItem], type: String?) {
        self.items = items
        self.type = type
    }
}

// MARK: Cart convenience initializers and mutators

public extension Cart {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Cart.self, from: data)
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
        items: [CartItem]? = nil,
        type: String?? = nil
    ) -> Cart {
        return Cart(
            items: items ?? self.items,
            type: type ?? self.type
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
