# manualSearch

Event type is used in case of:
- Sends details of the search in case other than Rezolve search API is used.
- For performing an A/B test between client's existing search engine and Rezolve Search.

## Example

```swift
// Create instance of tracker
let customerId = "<your-customer-id>"
let area = "<your-area>"
// Represents a shopper who is not logged in
let login = Login(loggedIn: false, username: nil)
let tracker = GbTracker(customerId: customerId, area: area, login: login)

// Code below assumes a tracker has been created called "tracker"

// Prepare event for beacon
let pageInfo = PageInfo(recordStart:1, recordEnd: 2)
let navigation = SelectedNavigation(name: "naviname", value: "navival")
let record1 = Record(id: "id1", title: "title1")
let record2 = Record(id: "id2", title: "title2")
let search = Search(query: "Download more RAM",
                    totalRecordCount: 1,
                    pageInfo: pageInfo,
                    records: [record1, record2],
                    selectedNavigation: [navigation])

let event = ManualSearchEvent(googleAttributionToken: "token_val", search: search)

// Prepare beacon for request
let manualSearchBeacon = ManualSearchBeacon(event: event, experiments: nil, metadata: nil)

// Use tracker instance to send beacon
tracker.sendManualSearchEvent(manualSearchBeacon: beacon) { error in
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

Record:

| Property | Description       | Java type | Required? | Min | Max | String format |
|----------|-------------------|-----------|-----------| --- |-----| ------------- |
| id       | The product ID    | `String`  | Yes       | 1 | n/a | n/a |
| title    | The product title | `String`  | No        | n/a | n/a | n/a |

PageInfo:

| Property    | Description                                        | Java type | Required? | Min | Max | String format |
|-------------|----------------------------------------------------|-----------|-----------|-----|-----| ------------- |
| recordStart | The first record in the search results (1-indexed) | `Long`    | Yes       | n/a | n/a | n/a |
| recordEnd   | The last record in the search results (1-indexed)  | `Long`    | Yes        | n/a | n/a | n/a |

Selected navigation:

| Property | Description                                                       | Java type | Required? | Min | Max | String format |
|----------|-------------------------------------------------------------------|-----------|-----------|-----|-----| ------------- |
| name     | The navigation field address                                      | `String`  | Yes       | n/a | n/a | n/a |
| value    | The value that was applied as a filter for the Search navigation  | `String`  | Yes        | n/a | n/a | n/a |


Search:

| Property           | Description                                                                                                                                                                                                                  | Java type                  | Required? | Min | Max | String format |
|--------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------|-----------| --- | --- | ------------- |
| query              | The search query or term for the event. Use an empty string if it was a browse event that had no search query or term.                                                                                                       | `String`                   | Yes       | n/a | n/a | n/a |
| totalRecordCount   | The total number of products in the search results                                                                                                                                                                           | `Long`                     | Yes       | n/a | n/a | n/a |
| records            | The results in a record set. Every item in the records property is an object with one property.                                                                                                                              | `List<Record>`             | Yes       | n/a | n/a | n/a |
| pageInfo           | The index number of the first and last record (1-indexed) within the response. If the page displays more records per page than were in the search results, use the number of records in the search results for this property | `PageInfo`                 | Yes       | n/a | n/a | n/a |
| selectedNavigation | The values that were refined. Required if applicable to the values of what refinements were selected.                                                                                                                        | `List<SelectedNavigation>` | No        | n/a | n/a | n/a |

ManualSearchEvent:

| Property               | Description | Java type | Required? | Min | Max | String format |
|------------------------| ----------- |-----------| --------- |-----|-----| ------------- |
| googleAttributionToken | The Google attribution token as described in Google Cloud Platform's [documentation for Cloud Retail Solutions](https://cloud.google.com/retail/docs/attribution-tokens). Instructions for implementing this are evolving over time. If you use Rezolve's Google-powered platform, reach out to your Customer Success rep to find out whether you need to implement this property and if so, how you should do it. | `String`  | No | n/a | 255 | n/a |
| search                 | The cart related to the event. | `Search`  | Yes | n/a | n/a | n/a |

ManualSearchBeacon:

| Property | Description | Java type          | Required? | Min | Max | String format |
| -------- | ----------- |--------------------| --------- |-----| --- | ------------- |
| event | The event data for the beacon. | `ManualSearchEvent` | Yes | n/a | n/a | n/a |
| experiments | The A/B testing experiments related to the event | `List<Experiments>` | No | 1   | 20 | n/a |
| metadata | The metadata for the event. | `List<Metadata>`   | No | n/a | 20 | n/a |

## Additional schemas

See [Experiments](experiments.md) for the schema of the experiments component.

See [Metadata](metadata.md) for the schema of the metadata component.
