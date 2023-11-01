# viewProduct

For sending details of which product (or SKU within a product) the shopper is viewing details of.

## Example

```swift
// Create instance of tracker
let customerId = "<your-customer-id>"
let area = "<your-area>"
// Represents a shopper who is not logged in
let login = Login(loggedIn: false, username: nil)
let tracker = GbTracker(customerId: customerId, area: area, login: login)

// Code below assumes a tracker has been created called "tracker"

// Prepare price for product
let price = Price(actual: "12.34", currency: "usd", onSale: true, regular: "23.45")

// Prepare product for event
let product = Product(category: "abc123", collection: "abc123", id: "abc123", price: price, sku: "abc123", title: "abc123")

// Prepare event for beacon
let event = ViewProductEvent(product: product, googleAttributionToken: "abc123")

// Prepare beacon for request
let beacon = ViewProductBeacon(event: event, experiments: nil, metadata: nil)

// Use tracker instance to send beacon
tracker.sendViewProductEvent(viewProductBeacon: beacon) { error in
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

Price:

| Property | Description | Swift type | Required? | Min | Max | String format |
| -------- | ----------- | --------- | --------- | --- | --- | ------------- |
| actual | The price the customer would pay that was displayed to them as they viewed details of the product. | `String` | Yes | n/a | 100 | ^[0-9]{1,9}\\.?[0-9]{1,2}$ |
| currency | The ISO 4217 code of the currency for the product. | `String` | Yes | 3 | 3 | [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) format |
| onSale | Whether the product was on sale when the shopper viewed details of it. | `Bool` | Yes | n/a | n/a | n/a |
| regular | The regular price of the product (when it is not on sale). Disallowed when property onSale is set to `false`. | `String` | When property onSale is set to `true`. | n/a | 100 | ^[0-9]{1,9}\\.?[0-9]{1,2}$ |

Product:

| Property | Description | Swift type | Required? | Min | Max | String format |
| -------- | ----------- | --------- | --------- | --- | --- | ------------- |
| category | The category the product belongs to in your catalog's category hierarchy. | `String` | No | 1 | 100 | n/a |
| collection | The collection the product belongs to in GroupBy's systems after it has been uploaded to GroupBy. | `String` | No | 1 | 100 | n/a |
| id | The product's ID in your catalog stored in GroupBy's system. | `String` | Yes | 1 | 36 | n/a |
| price | Contains data about the price of the product, including whether it was on sale to the shopper when the event occurred. | `Price` | Yes | n/a | n/a | n/a |
| sku | The product's SKU in your catalog stored in GroupBy's system. | `String` | No | 1 | 73 | n/a |
| title | The product's title. This is used in GroupBy UIs that render information about the product. | `String` | Yes | 1 | 100 | n/a |


ViewProductEvent:

| Property | Description | Swift type | Required? | Min | Max | String format |
| -------- | ----------- | --------- | --------- | --- | --- | ------------- |
| googleAttributionToken | The Google attribution token as described in Google Cloud Platform's [documentation for Cloud Retail Solutions](https://cloud.google.com/retail/docs/attribution-tokens). Instructions for implementing this are evolving over time. If you use GroupBy's Google-powered platform, reach out to your Customer Success rep to find out whether you need to implement this property and if so, how you should do it. | `String` | No | n/a | n/a | n/a |
| product | The product the shopper viewed details of. | `Product` | Yes | n/a | n/a | n/a |

ViewProductBeacon:

| Property | Description | Swift type | Required? | Min | Max | String format |
| -------- | ----------- | --------- | --------- | --- | --- | ------------- |
| event | The event data for the beacon. | `ViewProductEvent` | Yes | n/a | n/a | n/a |
| experiments | The A/B testing experiments related to the event. | `[Experiments]` | No | 1 | 20 | n/a |
| metadata | The metadata for the event. | `[Metadata]` | No | 1 | 20 | n/a |

## Additional schemas

See [Experiments](experiments.md) for the schema of the experiments component.

See [Metadata](metadata.md) for the schema of the metadata component.


