import Foundation

public class ManualSearchEvent: NSObject, NSCoding {
    var googleAttributionToken: String
    var search: Search
    
    init(googleAttributionToken: String, search: Search) {
        self.googleAttributionToken = googleAttributionToken
        self.search = search
    }
    
    required init?(coder aDecoder: NSCoder) {
        if let googleAttributionToken = aDecoder.decodeObject(forKey: "googleAttributionToken") as? String,
           let search = aDecoder.decodeObject(forKey: "search") as? Search {
            self.googleAttributionToken = googleAttributionToken
            self.search = search
        } else {
            // Handle initialization failure
            self.googleAttributionToken = ""
            self.search = Search() // Assuming Search has a default initializer
        }
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(googleAttributionToken, forKey: "googleAttributionToken")
        aCoder.encode(search, forKey: "search")
    }
}

class Search: NSObject, NSCoding {
    // Define the Search class if it's not already defined
    // You need to implement NSCoding for Search as well
}
