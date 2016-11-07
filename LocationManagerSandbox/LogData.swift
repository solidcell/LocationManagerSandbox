struct LogEntry {
    let title: String
    let subtitle: String
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
