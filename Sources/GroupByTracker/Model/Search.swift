import Foundation

public class Search: NSObject, NSCoding {
    var query: String
    var totalRecordCount: Int64
    var pageInfo: PageInfo
    var records: [Record]
    var selectedNavigation: [SelectedNavigation]
    
    public init(query: String, totalRecordCount: Int64, pageInfo: PageInfo, records: [Record], selectedNavigation: [SelectedNavigation]) {
        self.query = query
        self.totalRecordCount = totalRecordCount
        self.pageInfo = pageInfo
        self.records = records
        self.selectedNavigation = selectedNavigation
    }
    
    required init?(coder aDecoder: NSCoder) {
        if let query = aDecoder.decodeObject(forKey: "query") as? String,
           let totalRecordCount = aDecoder.decodeInt64(forKey: "totalRecordCount") as? Int64,
           let pageInfo = aDecoder.decodeObject(forKey: "pageInfo") as? PageInfo,
           let records = aDecoder.decodeObject(forKey: "records") as? [Record],
           let selectedNavigation = aDecoder.decodeObject(forKey: "selectedNavigation") as? [SelectedNavigation] {
            self.query = query
            self.totalRecordCount = totalRecordCount
            self.pageInfo = pageInfo
            self.records = records
            self.selectedNavigation = selectedNavigation
        } else {
            // Handle initialization failure
            self.query = ""
            self.totalRecordCount = 0
            self.pageInfo = PageInfo() // Assuming PageInfo has a default initializer
            self.records = []
            self.selectedNavigation = []
        }
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(query, forKey: "query")
        aCoder.encode(totalRecordCount, forKey: "totalRecordCount")
        aCoder.encode(pageInfo, forKey: "pageInfo")
        aCoder.encode(records, forKey: "records")
        aCoder.encode(selectedNavigation, forKey: "selectedNavigation")
    }
}

 
