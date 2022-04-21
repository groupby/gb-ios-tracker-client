// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let login = try Login(json)
//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

import Foundation

/// Data about the shopper's logged in/logged out status.
// MARK: - Login
public struct Login: Codable, Hashable {
    /// Whether the shopper was logged in the event in this beacon occured.
    public var loggedIn: Bool
    /// The shopper's username in the GroupBy customer's system.
    public var username: String?

    public init(loggedIn: Bool, username: String?) {
        self.loggedIn = loggedIn
        self.username = username
    }
    
    init() {
        self.loggedIn = false
        self.username = nil
    }
}

// MARK: Login convenience initializers and mutators

public extension Login {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Login.self, from: data)
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
        loggedIn: Bool? = nil,
        username: String?? = nil
    ) -> Login {
        return Login(
            loggedIn: loggedIn ?? self.loggedIn,
            username: username ?? self.username
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
