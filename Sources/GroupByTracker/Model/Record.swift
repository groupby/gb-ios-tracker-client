import Foundation

public class Record {
    private var id: String
    private var title: String

    init(id: String, title: String) {
        self.id = id
        self.title = title
    }

    func getId() -> String {
        return id
    }

    func setId(id: String) {
        self.id = id
    }

    func getTitle() -> String {
        return title
    }

    func setTitle(title: String) {
        self.title = title
    }
}
