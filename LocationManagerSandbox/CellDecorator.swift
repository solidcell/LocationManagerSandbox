import UIKit

class CellDecorator {

    func decorate(_ cell: UITableViewCell, logEntry: LogEntry) {
        switch logEntry {
        case .didFinishLaunchingWithOptions(let value):
            cell.decorate(title: "application(_:didFinishLaunchingWithOptions:)", subtitle: value)
        case .didChangeAuthorization(let value):
            cell.decorate(title: "locationManager(_:didChangeAuthorization:)", subtitle: value)
        case .didUpdateLocations(let value):
            cell.decorate(title: "locationManager(_:didUpdateLocations:)", subtitle: value)
        case .authorizationStatus(let value):
            cell.decorate(title: "authorizationStatus", subtitle: value)
        case .locationServicesEnabled(let value):
            cell.decorate(title: "locationServicesEnabled", subtitle: value)
        }
    }

}

private extension UITableViewCell {

    func decorate(title: String, subtitle: String? = nil) {
        textLabel?.text = title
        detailTextLabel?.text = subtitle
    }
    
}
