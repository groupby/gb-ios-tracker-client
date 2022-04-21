// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let product = try Product(json)
//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

import Foundation

/// Contains data about one of the GroupBy customer's products. Used by all event types that
/// relate to product data.
// MARK: - Product
public struct Product: Codable, Hashable {
    /// The category of the product in GroupBy's systems after it has been uploaded to GroupBy.
    public var category: String?
    /// The collection the product belongs to in GroupBy's systems after it has been uploaded to
    /// GroupBy.
    public var collection: String?
    /// The product's ID in the GroupBy customer's system.
    public var id: String
    public var price: Price
    /// The product's SKU in the GroupBy customer's system.
    public var sku: String?
    /// The product's title. This is used in GroupBy UIs that render information about the
    /// product.
    public var title: String

    public init(category: String?, collection: String?, id: String, price: Price, sku: String?, title: String) {
        self.category = category
        self.collection = collection
        self.id = id
        self.price = price
        self.sku = sku
        self.title = title
    }
}

// MARK: Product convenience initializers and mutators

public extension Product {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Product.self, from: data)
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
        category: String?? = nil,
        collection: String?? = nil,
        id: String? = nil,
        price: Price? = nil,
        sku: String?? = nil,
        title: String? = nil
    ) -> Product {
        return Product(
            category: category ?? self.category,
            collection: collection ?? self.collection,
            id: id ?? self.id,
            price: price ?? self.price,
            sku: sku ?? self.sku,
            title: title ?? self.title
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
