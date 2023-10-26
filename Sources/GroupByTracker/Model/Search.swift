import Foundation

public struct Search:  Codable, Hashable  {
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
    

    

}

extension Search {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Search.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
      query: String? = nil, totalRecordCount: Int64, pageInfo: PageInfo, records: [Record], selectedNavigation: [SelectedNavigation]
    ) -> Search {
        return Search(
            query: query ?? self.query,
            totalRecordCount: totalRecordCount ?? self.totalRecordCount,
            pageInfo: pageInfo ?? self.pageInfo,
            records: records ?? self.records,
            selectedNavigation: selectedNavigation ?? self.selectedNavigation
            
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

 
