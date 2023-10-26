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
    

    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(query, forKey: "query")
        aCoder.encode(totalRecordCount, forKey: "totalRecordCount")
        aCoder.encode(pageInfo, forKey: "pageInfo")
        aCoder.encode(records, forKey: "records")
        aCoder.encode(selectedNavigation, forKey: "selectedNavigation")
    }
}

 
