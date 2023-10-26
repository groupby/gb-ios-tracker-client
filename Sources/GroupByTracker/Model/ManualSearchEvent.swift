import Foundation

public class ManualSearchEvent{
    var googleAttributionToken: String
    var search: Search
    
    public init(googleAttributionToken: String, search: Search) {
        self.googleAttributionToken = googleAttributionToken
        self.search = search
    }


}

