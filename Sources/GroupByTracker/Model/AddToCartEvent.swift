// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let addToCartEvent = try AddToCartEvent(json)
//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

import Foundation

/// The event data for an addToCart event.
// MARK: - AddToCartEvent
public struct AddToCartEvent: Codable, Hashable {
    public var cart: Cart
    public var googleAttributionToken: String?

    public init(cart: Cart, googleAttributionToken: String?) {
        self.cart = cart
        self.googleAttributionToken = googleAttributionToken
    }
}

// MARK: AddToCartEvent convenience initializers and mutators

public extension AddToCartEvent {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(AddToCartEvent.self, from: data)
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
        cart: Cart? = nil,
        googleAttributionToken: String?? = nil
    ) -> AddToCartEvent {
        return AddToCartEvent(
            cart: cart ?? self.cart,
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
