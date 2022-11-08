# GroupBy Tracker Client for iOS

This is the iOS SDK used to send beacons to GroupBy.

Like other GroupBy beacon SDKs, it allows you to send a beacon representing a shopping event to GroupBy whenever that event occurs. This causes anonymous information about the shopper and the search results and products they interact with to be saved in GroupBy's systems to power GroupBy's platform.

Examples of platform components enhanced by beacons:

* Search results are more personalized
* Recommendations are better
* Insights are available in analytics dashboards

## Installing

### Add package using Swift Package Manager

1. From the Xcode menu click File > Swift Packages > Add Package Dependency.

2. In the dialog that appears, enter the repository URL: https://github.com/groupby/gb-ios-tracker-client

3. In Version, select Up to Next Major and take the default option.

### Add package using CocoaPods

1. Follow instructions here for setting up CocoaPods for the project, if not set up already: https://guides.cocoapods.org/using/using-cocoapods.html

2. Add the dependency to your pod file

```ruby
  pod 'GroupByTracker', '~> 1.0.1'
```

3. Run `pod install`

## Creating the tracker instance

You must program your app so that this happens when the app starts and a reference should be kept to the same tracker client object to re-use throughout the entire lifecycle of your app on the shopper's iOS device.

Example:

```swift
import GroupByTracker

// login status for a shopper who is not logged in
let login = Login(loggedIn: false, username: nil)
let instance = GbTracker(customerId: "my-customer-id", area: "my-area", login: login)
```

See [Creating the tracker instance](docs/creating_the_tracker_instance.md) for more details.

## Sending events

You must program your app so that the `sendXEvent` methods (where "X" is the name of the event to send) are called at the appropriate times throughout the lifecycle of your app on the shopper's iOS device, reflecting shopping behavior. The single instance of the tracker (described in the previous step) should be re-used to do this.

An example of a method you can call to send an event is the `sendViewProductEvent` method.

See [Sending events](docs/sending_events.md) for more details.

## Setting login status

Login status describes whether the shopper is logged in or not when the event occurs. With this information set in the tracker GroupBy can anonymously track shoppers across their devices, not just anonymously track them in the iOS app.

You can set the login status as you create the tracker instance and by mutating an existing tracker instance throughout the lifecycle of the app.

See [Setting login status](docs/setting_login_status.md) for more details.

## Validation

You can test your beacon implementation for validation errors using the callback. Example, where validation errors returned in a 400 Bad Request response are logged:

```swift
{ error in
    guard error == nil else {
        guard let gbError = error as? GbError else {
            // unknown error
            let errorText = "unknown error: " + (error?.localizedDescription ?? "")
            print(errorText)
            return
        }
        
        // If there are data validation errors, a list of string with the error details will be returned.
        // If there is a network or any other error, the code variable will contain the HTTP status code returned.
        switch gbError {
            case .error(let code, let errorDetails, let innerError):
                guard let errorDetails = errorDetails else {
                    // network or other error
                    let errorText = "network or other error: " +
                    String(code) + " " + (innerError?.localizedDescription ?? "")
                    print(errorText)
                    return
                }
                
                if (errorDetails.jsonSchemaValidationErrors.count > 0)
                {
                    let errorText = "data validation error: " + errorDetails.jsonSchemaValidationErrors[0]
                    print(errorText)
                }
                
                break
        }
        
        return
    }
}
```

You can see these logs in Xcode while debugging your app:

![image](https://user-images.githubusercontent.com/7719209/188751932-023b0671-5947-4563-8332-ab2eccb2e8fe.png)

See [Validation](docs/validation.md) for more details.

## Event types

The following event types are supported in the client. The "main four" event types are what GroupBy considers to be a minimum required beacon implementation in your iOS app:

| Event type | In "main four"? | Description | Details |
| ---------- | --------------- | ----------- | ------- |
| autoSearch  | Yes | After performing a search using a GroupBy search API, this is used for sending details of the search to GroupBy's beacon API. The details are sent from the web browser using this event instead of being retrieved internally by GroupBy so that client tracking works correctly and aligns with the rest of the event types which must be sent from the client. | [autoSearch](docs/autoSearch.md)
| viewProduct  | Yes | For sending details of which product (or SKU within a product) the shopper is viewing details of. | [viewProduct](docs/viewProduct.md)
| addToCart | Yes | For sending details of which products (or SKUs within products) the shopper is adding to their cart. | [addToCart](docs/addToCart.md)
| removeFromCart | No | For sending details of which products (or SKUs within products) the shopper is removing from their cart. | [removeFromCart](docs/removeFromCart.md)
| order | Yes | For sending details of which products (or SKUs within products) the shopper is ordering. | [order](docs/order.md)
| recImpression | No | For sending details of which products (or SKUs within products) the shopper is viewing on a page where you're rendering recommendations from a GroupBy recommendation API. | [recImpression](docs/recImpression.md)

When at least the main four event types have been implemented, session level insights become available instead of just event level insights. For example, you can get a breakdown via GroupBy's analytics of which search terms are leading your shoppers to the products they're buying.

## Including metadata and experiments in events

### Metadata

Metadata is miscellaneous key value pair data not part of each event's schema that you can include in each beacon you send.

When you include metadata in beacons you send, you extend GroupBy's analytics by enabling new dimensions.

See [Metadata](docs/metadata.md) for more details.

### Experiments

Experiments are key value pairs of data not part of each event's schema that you can in each beacon you send.

When you are running an A/B test, including details of the experiments in your A/B testing allows you to extend GroupBy's analytics by using your experiment as a a new dimension in analytics. For example, you can measure revenue for each bucket in your experiment.

See [Experiments](docs/experiments.md) for more details.

## Shopper tracking

Shoppers are tracked anonymously. GroupBy will know when a shopper returns but will not know who the shopper is.

VisitorId is a UUID used to anonymously track the user. This ID is not tied to any external systems and can only be used to track activity within the same app install. VisitorId has an expiry time of 1 year since the last time the shopper visited. After that, a new ID will be generated.

This ID is stored in UserDefaults.standard.

## Internal GroupBy testing

By default, beacons will be send to the production environment. This can be overridden by specifying a URL to send the beacons in the tracker constructor. This is useful for sending beacons to a test environment or to GroupBy's development environment.

```swift
import GroupByTracker

// Optional, overrides the URL the beacon is sent to. Useful for testing.
let login = Login(loggedIn: false, username: nil)
let instance = GbTracker(customerId: "customer_id", area: "area", login: login, urlPrefixOverride: "<some_url>")
```
