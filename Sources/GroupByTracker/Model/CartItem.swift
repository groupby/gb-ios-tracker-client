// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let cartItem = try CartItem(json)
//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

import Foundation

/// Contains data about one of the items in a shopper's cart. used for all event types
/// involving carts.
// MARK: - CartItem
public struct CartItem: Codable, Hashable {
    public var product: Product
    /// The quantity of this product added to the cart, removed from the cart, or ordered,
    /// depending on the event type. Note that this should not be the number of items in the cart
    /// after the operation the shopper is performing is finished. For example, if the event type
    /// is addToCart, and the shopper started with 2 items in the cart, then added 1 more, the
    /// quantity in the addToCart event should be set to 1, not 3.
    public var quantity: Int

    public init(product: Product, quantity: Int) {
        self.product = product
        self.quantity = quantity
    }
}

// MARK: CartItem convenience initializers and mutators

public extension CartItem {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CartItem.self, from: data)
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
        product: Product? = nil,
        quantity: Int? = nil
    ) -> CartItem {
        return CartItem(
            product: product ?? self.product,
            quantity: quantity ?? self.quantity
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
