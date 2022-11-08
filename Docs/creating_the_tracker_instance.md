# Creating the tracker instance

The user's login data can be set during the creation of the tracker instance or set when the user logs in after the tracker is already created.

This allows activities between multiple merchandiser applications and web to be attributed to the same user.

To create an instance of the tracker for a shopper who is logged in:

```swift
GbTracker instance = GbTracker.getInstance("my-customer-id",
        "my-area",
        new Login(true, "shopper's-username"));
```

To create an instance of the tracker for a shopper who is not logged in:

```swift
let instance = GbTracker(customerId: "my-customer-id", area: "my-area", login: Login(loggedIn: false, username: nil))
```

To change the shopper's status from "not logged in" to "logged in" at any point during the app's lifecycle after the instance has been created:

```swift
instance.setLogin(login: Login(loggedIn: true, username: "shopper's-username"))
```

To change the shopper's status from "logged in" to "not logged in" at any point during the app's lifecycle after the instance has been created:

```swift
instance.setLogin(login: Login(loggedIn: false, username: nil))
```
