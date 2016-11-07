class LogData {

    weak var delegate: LogDataDelegate?
    private(set) var logs = [String]()

    func newEntry(_ entry: String) {
        logs.append(entry)
        delegate?.didAddEntry(at: logs.count - 1)
    }

}

protocol LogDataDelegate: class {
    func didAddEntry(at index: Int)
}
