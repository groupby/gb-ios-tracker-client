// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let autoSearchEvent = try AutoSearchEvent(json)
//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

import Foundation

/// The event data for an autoSearch event. Note that this is the only event type that
/// doesn't have a "googleAttributionToken" property. This is because the "searchId" acts as
/// a token that allows GroupBy to tie this event together with the search that powered the
/// shopper's experience leading up to the event, replacing the "googleAttributionToken"
/// property.
// MARK: - AutoSearchEvent
public struct AutoSearchEvent: Codable, Hashable {
    /// The context in which the search was performed. Acceptable values are "search" (used when
    /// a search query is used with the API), "sayt" (used when GroupBy's SAYT search engine API
    /// is used instead of its regular search engine API, for search-as-you-type use cases), and
    /// "navigation" (used when no search query is used because the search engine is being used
    /// to power a PLP consisting of a category of products, often after a shopper has selected a
    /// facet).
    public var origin: Origin
    /// The ID of the search performed with the GroupBy search engine API. This ID is returned in
    /// each HTTP response from the API and must be included in this event.
    public var searchID: String

    enum CodingKeys: String, CodingKey {
        case origin
        case searchID = "searchId"
    }

    public init(origin: Origin, searchID: String) {
        self.origin = origin
        self.searchID = searchID
    }
}

// MARK: AutoSearchEvent convenience initializers and mutators

public extension AutoSearchEvent {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(AutoSearchEvent.self, from: data)
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
        origin: Origin? = nil,
        searchID: String? = nil
    ) -> AutoSearchEvent {
        return AutoSearchEvent(
            origin: origin ?? self.origin,
            searchID: searchID ?? self.searchID
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
