# addToCart

For sending details of which products (or SKUs within products) the shopper is adding to their cart.

You must only include the products or SKUs that the shopper is adding to their cart during this event, not the products or SKUs the cart has after this event occurs.

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

// Prepare product for cart item
let product = Product(category: "abc123", collection: "abc123", id: "abc123", price: price, sku: "abc123", title: "abc123")

// Prepare cart item for list of cart items
let item = CartItem(product: product, quantity: 1)

// Prepare list of cart items for cart
let items = [item]

// Prepare cart for event
let cart = Cart(items: items, type: "abc123")

// Prepare event for beacon
let event = AddToCartEvent(cart: cart, googleAttributionToken: "abc123")

// Prepare beacon for request
let beacon = AddToCartBeacon(event: event, experiments: nil, metadata: nil)

// Use tracker instance to send beacon
tracker.sendAddToCartEvent(addToCartBeacon: beacon) { error in
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
| actual | The price the customer would pay for the product as they added it to their cart. | `String` | Yes | n/a | 100 | ^[0-9]{1,9}\\.?[0-9]{1,2}$ |
| currency | The ISO 4217 code of the currency for the product. | `String` | Yes | 3 | 3 | [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) format |
| onSale | Whether the product was on sale when the shopper viewed details of it. | `Bool` | Yes | n/a | n/a | n/a |
| regular | The regular price of the product (when it is not on sale). Disallowed when property onSale is set to `false`. | `String` | When property onSale is set to `true`. | n/a | 100 | ^[0-9]{1,9}\\.?[0-9]{1,2}$ |

Product:

| Property | Description | Swift type | Required? | Min | Max | String format |
| -------- | ----------- | --------- | --------- | --- | --- | ------------- |
| category | The category the product belongs to in your catalog's category hierarchy. | `String` | No | 1 | 100 | n/a |
| collection | The collection the product belongs to in Rezolve's systems after it has been uploaded to Rezolve. | `String` | No | 1 | 100 | n/a |
| id | The product's ID in your catalog stored in Rezolve's system. | `String` | Yes | 1 | 36 | n/a |
| price | Contains data about the price of the product, including whether it was on sale to the shopper when the event occurred. | `Price` | Yes | n/a | n/a | n/a |
| sku | The product's SKU in your catalog stored in Rezolve's system. | `String` | No | 1 | 73 | n/a |
| title | The product's title. This is used in Rezolve UIs that render information about the product. | `String` | Yes | 1 | 100 | n/a |

CartItem:

| Property | Description | Swift type | Required? | Min | Max | String format |
| -------- | ----------- | --------- | --------- | --- | --- | ------------- |
| product | The product related to the cart item. | `Product` | Yes | n/a | n/a | n/a |
| quantity | The quantity of the product being added to the cart. | `Int` | Yes | 1 | 2147483647 | n/a |

Cart:

| Property | Description | Swift type | Required? | Min | Max | String format |
| -------- | ----------- | --------- | --------- | --- | --- | ------------- |
| items | The cart items being added to the cart. | `[CartItem]` | Yes | 1 | 1000 | n/a |
| type | A value to label the cart with to differentiate it from other types of carts you might have. Ex. "gift registry". If provided, this will not affect search personalization or recommendations but will provide a new dimension to use in analytics dashboards. | `String` | No | 1 | 100 | n/a |

AddToCartEvent:

| Property | Description | Swift type | Required? | Min | Max | String format |
| -------- | ----------- | --------- | --------- | --- | --- | ------------- |
| googleAttributionToken | The Google attribution token as described in Google Cloud Platform's [documentation for Cloud Retail Solutions](https://cloud.google.com/retail/docs/attribution-tokens). Instructions for implementing this are evolving over time. If you use Rezolve's Google-powered platform, reach out to your Customer Success rep to find out whether you need to implement this property and if so, how you should do it. | `String` | No | n/a | 255 | n/a |
| cart | The cart related to the event. | `Cart` | Yes | n/a | n/a | n/a |

AddToCartBeacon:

| Property | Description | Swift type | Required? | Min | Max | String format |
| -------- | ----------- | --------- | --------- | --- | --- | ------------- |
| event | The event data for the beacon. | `AddToCartEvent` | Yes | n/a | n/a | n/a |
| experiments | The A/B testing experiments related to the event. | `[Experiments]` | No | 1 | 20 | n/a |
| metadata | The metadata for the event. | `[Metadata]` | No | 1 | 20 | n/a |

## Additional schemas

See [Experiments](experiments.md) for the schema of the experiments component.

See [Metadata](metadata.md) for the schema of the metadata component.


