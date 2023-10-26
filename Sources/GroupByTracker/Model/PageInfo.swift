import Foundation
 
public struct  PageInfo : Codable, Hashable  {
    private var recordStart: Int64
    private var recordEnd: Int64

    public init(recordStart: Int64, recordEnd: Int64) {
        self.recordStart = recordStart
        self.recordEnd = recordEnd
    }

}
