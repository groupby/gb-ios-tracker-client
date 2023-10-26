import Foundation
 
public struct  PageInfo {
    private var recordStart: Int64
    private var recordEnd: Int64

    public init(recordStart: Int64, recordEnd: Int64) {
        self.recordStart = recordStart
        self.recordEnd = recordEnd
    }

    func getRecordStart() -> Int64 {
        return recordStart
    }

    func setRecordStart(recordStart: Int64) {
        self.recordStart = recordStart
    }

    func getRecordEnd() -> Int64 {
        return recordEnd
    }

    func setRecordEnd(recordEnd: Int64) {
        self.recordEnd = recordEnd
    }
}
