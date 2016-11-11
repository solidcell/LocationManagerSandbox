import UIKit
import CoreLocation

enum LogEntry {
    // App Delegate
    case didFinishLaunchingWithOptions([UIApplicationLaunchOptionsKey: Any]?)
    case applicationDidEnterBackground
    case applicationWillResignActive
    case applicationWillEnterForeground
    case applicationDidBecomeActive
    case applicationWillTerminate
    // Location Manager
    case requestWhenInUseAuthorization(NSDate)
    case requestAlwaysAuthorization(NSDate)
    case authorizationStatus(CLAuthorizationStatus)
    case locationServicesEnabled(Bool)
    case startUpdatingLocation(NSDate)
    // Location Manager Delegate
    case didUpdateLocations([CLLocation])
    case didChangeAuthorization(CLAuthorizationStatus)
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
