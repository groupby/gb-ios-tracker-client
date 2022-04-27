# GroupBy Tracker Client for iOS

This is the iOS SDK used to send beacons to GroupBy.

## Add package using Swift Package Manager

1. From the Xcode menu click File > Swift Packages > Add Package Dependency.

2. In the dialog that appears, enter the repository URL: https://github.com/groupby/gb-ios-tracker-client

3. In Version, select Up to Next Major and take the default option.

## Add package using CocoaPods

1. Follow instructions here for setting up CocoaPods for the project, if not set up already: https://guides.cocoapods.org/using/using-cocoapods.html

2. Add the dependency to your pod file

```ruby
  pod 'GroupByTracker', '~> 0.1.1'
```

3. Run `pod install`

## Usage

To import and use the tracker:

```swift
import GroupByTracker

// create the SDK instance
let tracker = GbTracker(customerId: "customer_id", area: "area", login: Login(loggedIn: false, username: ""))

// set the login data
tracker.setLogin(login: Login(loggedIn: true, username: "shopper@example.com"))

// create beacon
let atcBeacon = AddToCartBeacon(...)

// send beacon
tracker.sendAddToCartEvent(addToCartBeacon: atcBeacon) { error in
    guard error == nil else {
        guard let gbError = error as? GbError else {
            // unknown error
            ...
            return
        }
        
        // If there are data validation errors, a list of string with the error details will be returned.
	// If there is a network or any other error, the code variable will contain the HTTP status code returned.
        switch gbError {
            case .error(let code, let errorDetails, let innerError):
                guard let errorDetails = errorDetails else {
                    // network or other error
                    ...
                    return
                }
                
                if (errorDetails.jsonSchemaValidationErrors.count > 0)
                {
                    ...
                }
                
                break
    	}
        
        return
    }
}
```

## Options

The constructor for the tracker client has an optional parameter for overriding the default url.
By default, the url points to production endpoints. This can be overriden to point to a test endpoint or internal endpoint 

```swift
let tracker = GbTracker(customerId: "customer_id", area: "area", login: Login(loggedIn: true, username: "shopper@example.com"), urlPrefixOverride: <some_url>) // Optional, overrides the URL the beacon is sent to. Useful for testing.
```

## Set Login Information

The user's login data can be set during the creation of the tracker instance or set when the user logs in after the tracker is already created.

Login data allows activities between multiple merchandiser applications and web to be attributed to the same user.

```swift
let tracker = GbTracker(customerId: "customer_id", area: "area", login: Login(loggedIn: true, username: "shopper@example.com"))

// or
let tracker = GbTracker(customerId: "customer_id", area: "area", login: Login(loggedIn: false, username: ""))

...
tracker.setLogin(login: Login(loggedIn: true, username: "shopper@example.com"))
```
On user logout: 
```swift
tracker.setLogin(login: Login(loggedIn: false, username: ""))

```


## Shopper tracking

VisitorId is a UUID used to anonymously track the user. This id is not tied to any external systems and can only be used to track activity within the same app install. VisitorId has an expiry time of 1 year since the last time the shopper visited. After that a new Id will be generated.
This by default is stored in UserDefaults.standard.

## More Usage Details

See the docs for more detailed information about implementing beacons:

https://docs.groupbycloud.com/gb-docs/gb-implementation/beacons/overview
