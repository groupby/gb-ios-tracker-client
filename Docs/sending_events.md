# Sending events

You must program your app so that the `sendXEvent` methods (where "X" is the name of the event to send) are called at the appropriate times throughout the lifecycle of your app on the shopper's iOS device, reflecting shopping behavior. The single instance of the tracker (described in the previous step) should be re-used to do this.

Example:

A method you can call to send an event is the `sendViewProductEvent` method. The shopper may be viewing a list of products in search results and they may tap on one of the products to see details of it. When this happens, your app might begin a new View to show them the details. You should hook into the new ViewController's lifecycle methods to call the `sendViewProductEvent` of your tracker instance as that View starts up. 

```swift
// Based on starter code from a new iOS Storyboard App project
override func viewDidLoad() {
    // Beginning of code from starter code
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    // Ending of code from starter code

    // Added code for sending a beacon, assumes "tracker" is a reference to the
    // tracker singleton in your app
    tracker.sendViewProductEvent(/* ... */);
}
```

This example was for when the important event occurred when the activity started. That's why it uses the `viewDidLoad` lifecycle hook method. Your situation and app design might be different. You may need to use different hooks or respond to a UI element being tapped, etc.

This example is only meant to describe when to send an event, so it doesn't fill in the viewProduct event details. For complete viewProduct event details, see [viewProduct](viewProduct.md).
