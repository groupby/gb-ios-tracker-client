# Validation

You can use the callback available for every beacon sending method to test whether the HTTP request sending the beacon had a 400 Bad Request response sent back with validation errors. In Xcode, you can use the simulator and Output window in the debugger to see these messages when they are logged with `print`, `NSLog`, etc.

For example, you can run the following code which sends a valid autoSearch beacon:

```swift
func sendAutoSearchEvent() {
    // Create instance of tracker
    let customerId = "<customer-id>"
    let area = "<area>"
    // Represents a shopper who is not logged in
    let login = Login(loggedIn: false, username: nil)
    let tracker = GbTracker(customerId: customerId, area: area, login: login)

    // Code below assumes a tracker has been created called "tracker"

    // Prepare event for beacon
    let event = AutoSearchEvent(origin: Origin.search, searchID: "167e44d4-2140-4098-91b0-1e1f0558fd8c")

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
}
```

This code can be wired up to a GUI element to send a test beacon like this:

```swift
@IBAction func buttonTouchUpInside(_ sender: Any) {
    sendAutoSearchEvent()
    print("Invoked code to send beacon.")
}
```

You can click the GUI element in the emulator send the test beacon:

![image](https://user-images.githubusercontent.com/101598674/200876861-15d86c36-9444-41d8-adc8-463c31e4fa5b.png)


You will see the following logged in the Output window in Xcode:

![image](https://user-images.githubusercontent.com/101598674/200878312-f0de65dd-0315-4a41-bbd3-6f5955c606bb.png)


You can also send an invalid beacon. For example, one where the customerId has invalid string format.

```swift
let customerId = "!invalid-customer-id!"
let area = "area"
// Represents a shopper who is not logged in
let login = Login(loggedIn: false, username: nil)
let tracker = GbTracker(customerId: customerId, area: area, login: login)
```

When you send an invalid beacon, the error logging code above will result in you seeing this in the Output Window in Xcode:

![image](https://user-images.githubusercontent.com/101598674/200877677-1ebd6f8f-e712-4b92-b6c6-c4cc4d3ae531.png)

Error code copied here in text form too:

```
Failed to send beacon: The operation couldn’t be completed. (GroupByTracker.GbError error 0.); validation errors: customer.id: Does not match pattern '^[a-zA-Z][a-zA-Z0-9]*$'
```

In the real world, you should re-use your tracker instance across the lifetime of your app, not create a new instance each time you want to send a beacon. These code examples create new tracker instances each time for demonstration purposes.
