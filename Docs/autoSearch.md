# autoSearch

After performing a search using a GroupBy search API, this is used for sending details of the search to GroupBy's beacon API. The details are sent from the web browser using this event instead of being retrieved internally by GroupBy so that client tracking works correctly and aligns with the rest of the event types which must be sent from the client.

The search request could be a request to GroupBy's search API directly, or through a proxy.

Note that in this example, it is blocking because the example data is stored in memory, but in your app, it may be non-blocking.

## Example

Example data, retrieved by calling a method:

```swift
struct ExampleSearchResults {
    var records: [String]
    var searchId: String

    init(records: [String], searchId: String) {
        self.records = records;
        self.searchId = searchId;
    }
}
```

```swift
/**
 * Example of performing an HTTP request to GroupBy's search API. In the real world, the data
 * returned would include whichever records matched the search query and a UUID v4 as the search
 * ID, which is meant to be included in autoSearch beacons sent related to the request.
 *
 * @return The search results.
 */
func exampleSearchRequest() -> ExampleSearchResults {
    return ExampleSearchResults(records: ["record 1", "record 2"], searchId: "c8a16b67-d3dd-49a8-b49c-68ed18febc3f")
}
```

Sending the beacon:

```swift
// Create instance of tracker
let customerId = "<your-customer-id>";
let area = "<your-area>";
// Represents a shopper who is not logged in
let login = Login(loggedIn: false, username: nil)
let tracker = GbTracker(customerId: customerId, area: area, login: login)

// Code below assumes a tracker has been created called "tracker"

// Perform search request
let results = exampleSearchRequest()

// Prepare event for beacon
let event = AutoSearchEvent(origin: Origin.search, searchID: results.searchId)

// Prepare beacon for request
let beacon = AutoSearchBeacon(event: event, experiments: nil, metadata: nil)

// Use tracker instance to send beacon
tracker.sendAutoSearchEvent(autoSearchBeacon: beacon) { error in
    guard error == nil else {
        var msg = "Failed to send beacon: " + (error?.localizedDescription ?? "")
        guard let gbError = error as? GbError else {
            print(msg)
            return
        }
        switch gbError {
            case .error(let code, let errorDetails, let innerError):
                guard let errorDetails = errorDetails else {
                    msg += "; network or other error: " +
                String(code) + " " + (innerError?.localizedDescription ?? "")
                    print(msg)
                    return
                }
                if (errorDetails.jsonSchemaValidationErrors.count > 0)
                {
                    for validationError in errorDetails.jsonSchemaValidationErrors {
                        msg += "; validation errors: " + validationError
                    }
                }
                break
        }
        print(msg)
        return
    }

    let msg = "Sent beacon successfully."
    print(msg)
}
```

In the real world, you should re-use your tracker instance across the lifetime of your app, not create a new instance each time you want to send a beacon. These code examples create new tracker instances each time for demonstration purposes.

## Properties

AutoSearchEvent:

| Property | Description | Swift type | Required? | Min | Max | String format |
| -------- | ----------- | --------- | --------- | --- | --- | ------------- |
| searchId | The ID of the search performed with the GroupBy search engine API. This ID is returned in each HTTP response from the API and must be included in this event. | `String` | Yes | n/a | n/a | n/a |
| origin | The context in which the search was performed. Acceptable values are \"search\" (used when a search query is used with the API), \"sayt\" (used when GroupBy's SAYT search engine API is used instead of its regular search engine API, for search-as-you-type use cases), and \"navigation\" (used when no search query is used because the search engine is being used to power a PLP consisting of a category of products, often after a shopper has selected a facet). | `Origin` enum value | Yes | n/a | n/a | n/a |

AutoSearchBeacon:

| Property | Description | Swift type | Required? | Min | Max | String format |
| -------- | ----------- | --------- | --------- | --- | --- | ------------- |
| event | The event data for the beacon. | `AutoSearchEvent` | Yes | n/a | n/a | n/a |
| experiments | The A/B testing experiments related to the event. | `[Experiments]` | No | 1 | 20 | n/a |
| metadata | The metadata for the event. | `[Metadata]` | No | 1 | 20 | n/a |

## Additional schemas

See [Experiments](experiments.md) for the schema of the experiments component.

See [Metadata](metadata.md) for the schema of the metadata component.
