import UIKit
import CoreLocation

enum LogEntry {
    // App Delegate
    case didFinishLaunchingWithOptions([UIApplicationLaunchOptionsKey: Any]?)
    // Location Manager
    case authorizationStatus(CLAuthorizationStatus)
    case locationServicesEnabled(Bool)
    // Location Manager Delegate
    case didChangeAuthorization(CLAuthorizationStatus)
    case didUpdateLocations([CLLocation])
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
