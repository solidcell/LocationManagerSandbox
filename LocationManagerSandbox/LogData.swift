struct LogEntry {
    let method: MethodEnum
    let value: String
}

enum MethodEnum {
    case executor(MethodExecutor.MethodEnum)
    case delegate(LocationManagerDelegate.MethodEnum)
}

class LogData {

    weak var delegate: LogDataDelegate?
    private(set) var logs = [LogEntry]()

    func newEntry(_ entry: LogEntry) {
        logs.append(entry)
        delegate?.didAddEntry(at: logs.count - 1)
    }

}

protocol LogDataDelegate: class {
    func didAddEntry(at index: Int)
}
