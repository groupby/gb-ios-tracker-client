import Foundation

public class ManualSearchEvent: NSObject, NSCoding {
    var googleAttributionToken: String
    var search: Search
    
    public init(googleAttributionToken: String, search: Search) {
        self.googleAttributionToken = googleAttributionToken
        self.search = search
    }


}

