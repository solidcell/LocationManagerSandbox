enum LogEntry {
    // App Delegate
    case didFinishLaunchingWithOptions(String)
    // Location Manager
    case authorizationStatus(String)
    case locationServicesEnabled(String)
    // Location Manager Delegate
    case didChangeAuthorization(String)
    case didUpdateLocations(String)
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
