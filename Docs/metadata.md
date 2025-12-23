# Metadata

Metadata is miscellaneous key value pair data not part of each event's schema that you can include in each beacon you send.

This data cannot improve the quality of Rezolve's search results or recommendations (because those services can only be powered by data that follows a schema they are designed for) but it provides extra dimensions that can be used in Rezolve's analytics.

## Example

To include metadata alongside an event in the beacon, create a list of metadata items using the model classes and include them in the beacon:

```swift
var metadata: [Metadata] = []
metadata.append(Metadata(key: "example-key1", value: "example-value1"))
metadata.append(Metadata(key: "example-key2", value: "example-value2"))
beacon.metadata = metadata
```

## Properties

| Property | Description | Swift type | Required? | Min | Max | String format |
| -------- | ----------- | --------- | --------- | --- | --- | ------------- |
| key | The key of the metadata pair. | `String` | Yes | 1 | 50 | n/a |
| value | The value of the metadata pair. | `String` | Yes | 1 | 1000 | n/a |

In every event type where metadata is included, the list of `Metadata` objects must be between 1 and 20 items.

## More help

Consult with your Technical Implementation Consultant at Rezolve for more guidance using this feature.
