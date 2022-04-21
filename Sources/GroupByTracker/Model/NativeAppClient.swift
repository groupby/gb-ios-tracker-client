// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let nativeAppClient = try NativeAppClient(json)
//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

import Foundation

/// Contains data about the client sending the beacon when the client is a native app. This
/// is a generic submodel meant to be used for all types of native apps like Android and iOS.
// MARK: - NativeAppClient
struct NativeAppClient: Codable, Hashable {
    /// An identifier for the native app. For iOS, see https://developer.apple.com/library/archive/documentation/General/Conceptual/DevPedia-CocoaCore/AppID.html. For Android, see https://developer.android.com/studio/build/configure-app-module. This isn't required because it doesn't stop GroupBy from being able to use native app beacons to improve Search and Recommendations, but it does provide a dimension in Analytics if provided.
    public var appId: String
    /// The device user's language preference, expressed as a language code. Ex. "en-US".
    public var lang: String
    /// The model of the device. Ex. "Pixel 5" or "iOS".
    public var model: String
    /// The native app platform.
    public var platform: Platform

    public init(appId: String, lang: String, model: String, platform: Platform) {
        self.appId = appId
        self.lang = lang
        self.model = model
        self.platform = platform
    }
    
    init() {
        self.appId = ""
        self.lang = ""
        self.model = ""
        self.platform = Platform.ios
    }
}

// MARK: NativeAppClient convenience initializers and mutators

extension NativeAppClient {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(NativeAppClient.self, from: data)
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
        appId: String? = nil,
        lang: String? = nil,
        model: String? = nil,
        platform: Platform? = nil
    ) -> NativeAppClient {
        return NativeAppClient(
            appId: appId ?? self.appId,
            lang: lang ?? self.lang,
            model: model ?? self.model,
            platform: platform ?? self.platform
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
