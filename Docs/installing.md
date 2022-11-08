# Installing

## Add package using Swift Package Manager

1. From the Xcode menu click File > Swift Packages > Add Package Dependency.

2. In the dialog that appears, enter the repository URL: https://github.com/groupby/gb-ios-tracker-client

3. In Version, select Up to Next Major and take the default option.

## Add package using CocoaPods

1. Follow instructions here for setting up CocoaPods for the project, if not set up already: https://guides.cocoapods.org/using/using-cocoapods.html

2. Add the dependency to your pod file

```ruby
  pod 'GroupByTracker', '~> 1.0.1'
```

3. Run `pod install`

You'll know you've completed these steps properly if Xcode Jump to Definition works for the `GbTracker` class:

![image](https://user-images.githubusercontent.com/7719209/188748073-c11673ff-3187-4218-9403-d765ad8ccc93.png)
