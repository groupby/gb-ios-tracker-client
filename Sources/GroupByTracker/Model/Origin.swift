import Foundation

/// The context in which the search was performed. Acceptable values are "search" (used when
/// a search query is used with the API), "sayt" (used when GroupBy's SAYT search engine API
/// is used instead of its regular search engine API, for search-as-you-type use cases), and
/// "navigation" (used when no search query is used because the search engine is being used
/// to power a PLP consisting of a category of products, often after a shopper has selected a
/// facet).
public enum Origin: String, Codable, Hashable {
    case navigation = "navigation"
    case sayt = "sayt"
    case search = "search"
}
