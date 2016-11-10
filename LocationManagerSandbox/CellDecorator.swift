import UIKit

class CellDecorator {

    func decorate(_ cell: UITableViewCell, logEntry: LogEntry) {
        switch logEntry {
        case .didFinishLaunchingWithOptions(let launchOptions):
            cell.decorate(title: "application(_:didFinishLaunchingWithOptions:)",
                          subtitle: String(describing: launchOptions))
        case .didChangeAuthorization(let status):
            cell.decorate(title: "locationManager(_:didChangeAuthorization:)",
                          subtitle: String(describing: status))
        case .didUpdateLocations(let locations):
            cell.decorate(title: "locationManager(_:didUpdateLocations:)",
                          subtitle: String(describing: locations))
        case .authorizationStatus(let status):
            cell.decorate(title: "authorizationStatus",
                          subtitle: String(describing: status))
        case .locationServicesEnabled(let isEnabled):
            cell.decorate(title: "locationServicesEnabled",
                          subtitle: isEnabled.description)
        }
    }

}

private extension UITableViewCell {

    func decorate(title: String, subtitle: String? = nil) {
        textLabel?.text = title
        detailTextLabel?.text = subtitle
    }
    
}
