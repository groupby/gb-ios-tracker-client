import Foundation

public struct SelectedNavigation {
    var name: String
    var value: String
    
    
    public init(name: String, value: String) {
        self.name = name
        self.value = value
    }
    
    var description: String {
        return "SelectedNavigation{name: \(name), value: \(value)}"
    }
    
    func printDescription() {
        print(description)
    }
}

let navigation = SelectedNavigation(name: "refined 1", value: "ukulele")
navigation.printDescription()
