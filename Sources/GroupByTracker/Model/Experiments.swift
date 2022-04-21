// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let experiments = try Experiments(json)
//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

import Foundation

/// Used when a GroupBy customer is performing an A/B test. Can be used for A/B testing
/// different configurations of GroupBy services but can also be used for A/B testing
/// different configurations for anything the customer has. Omit the field if you are not
/// running any A/B tests or if you are running A/B tests but do not wish to beacon them to
/// GroupBy to explore them in GroupBy Analytics. For more information on the kinds of
/// experiments a GroupBy customer can run and include in beacon data, they should consult
/// the A/B testing documentation or reach out to their Customer Success representative. The
/// two properties names' have redundant "experiment" prefixes, which is intentional, to be
/// backwards compatible with GroupBy's recommendations endpoints that return experiment data
/// in this format. This allows GroupBy customers to take the experiment data returned in the
/// recommendations response and include it as is in beacons that are sent from pages/app
/// screens that use data from that response.
///
/// An experiment item.
// MARK: - Experiments
public struct Experiments: Codable, Hashable {
    /// The ID (aka name) for the experiment. There should be one name shared by two or more
    /// variants.
    public var experimentID: String
    /// The variant (aka bucket) of the experiment active for this event. There should be at
    /// least two experiment variants for each experiment ID across all beacon data (otherwise
    /// there would be no comparison to make) and there should be only one experiment variant for
    /// each experiment ID in a single beacon (because it is invalid for an event to belong to
    /// more than one experiment bucket at a time).
    public var experimentVariant: String

    enum CodingKeys: String, CodingKey {
        case experimentID = "experimentId"
        case experimentVariant
    }

    public init(experimentID: String, experimentVariant: String) {
        self.experimentID = experimentID
        self.experimentVariant = experimentVariant
    }
}

// MARK: Experiments convenience initializers and mutators

public extension Experiments {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Experiments.self, from: data)
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
        experimentID: String? = nil,
        experimentVariant: String? = nil
    ) -> Experiments {
        return Experiments(
            experimentID: experimentID ?? self.experimentID,
            experimentVariant: experimentVariant ?? self.experimentVariant
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
