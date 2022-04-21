// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let autoSearchBeacon = try AutoSearchBeacon(json)
//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

import Foundation

/// An autoSearch event for the Android client type (as opposed to other client types like
/// web browsers) sent directly from the client (as opposed to sent from a server serving the
/// client). This event is used when the GroupBy search engine (as opposed to a non-GroupBy
/// search engine) is used to power a product list page (PLP). Note that the only client
/// officially supported for sending GroupBy this data is the official GroupBy native app SDK
/// for the respective platform (Android, iOS, etc). A backwards incompatible change may be
/// made to a major version of this schema if the change would not be backwards incompatible
/// with respect to correct usage of the corresponding major version of the native app SDK.
// MARK: - AutoSearchBeacon
public class AutoSearchBeacon: Codable {
    var client: NativeAppClient
    var customer: Customer
    public var event: AutoSearchEvent
    public var experiments: [Experiments]?
    public var metadata: [Metadata]?
    var shopper: ShopperTracking
    var time: Date

    init(client: NativeAppClient, customer: Customer, event: AutoSearchEvent, experiments: [Experiments]?, metadata: [Metadata]?, shopper: ShopperTracking, time: Date) {
        self.client = client
        self.customer = customer
        self.event = event
        self.experiments = experiments
        self.metadata = metadata
        self.shopper = shopper
        self.time = time
    }
    
    public init(event: AutoSearchEvent, experiments: [Experiments]?, metadata: [Metadata]?) {
        self.client = NativeAppClient()
        self.customer = Customer()
        self.event = event
        self.experiments = experiments
        self.metadata = metadata
        self.shopper = ShopperTracking()
        self.time = Date()
    }
}

// MARK: AutoSearchBeacon convenience initializers and mutators

public extension AutoSearchBeacon {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(AutoSearchBeacon.self, from: data)
        self.init(client: me.client, customer: me.customer, event: me.event, experiments: me.experiments, metadata: me.metadata, shopper: me.shopper, time: me.time)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    internal func with(
        client: NativeAppClient? = nil,
        customer: Customer? = nil,
        event: AutoSearchEvent? = nil,
        experiments: [Experiments]?? = nil,
        metadata: [Metadata]?? = nil,
        shopper: ShopperTracking? = nil,
        time: Date? = nil
    ) -> AutoSearchBeacon {
        return AutoSearchBeacon(
            client: client ?? self.client,
            customer: customer ?? self.customer,
            event: event ?? self.event,
            experiments: experiments ?? self.experiments,
            metadata: metadata ?? self.metadata,
            shopper: shopper ?? self.shopper,
            time: time ?? self.time
        )
    }
    
    func with(
        event: AutoSearchEvent? = nil,
        experiments: [Experiments]?? = nil,
        metadata: [Metadata]?? = nil
    ) -> AutoSearchBeacon {
        return AutoSearchBeacon(
            event: event ?? self.event,
            experiments: experiments ?? self.experiments,
            metadata: metadata ?? self.metadata
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
