import UIKit

class CellDecorator {

    func decorate(_ cell: UITableViewCell, logEntry: LogEntry) {
        switch logEntry.method {
        case .app(let method):
            switch method {
            case .didFinishLaunchingWithOptions:
                cell.decorate(title: "application(_:didFinishLaunchingWithOptions:)", subtitle: logEntry.value)
            }
        case .delegate(let method):
            switch method {
            case .didChangeAuthorization:
                cell.decorate(title: "locationManager(_:didChangeAuthorization:)", subtitle: logEntry.value)
            case .didUpdateLocations:
                cell.decorate(title: "locationManager(_:didUpdateLocations:)", subtitle: logEntry.value)
            }
        case .executor(let method):
            switch method {
            case .authorizationStatus:
                cell.decorate(title: "authorizationStatus", subtitle: logEntry.value)
            case .locationServicesEnabled:
                cell.decorate(title: "locationServicesEnabled", subtitle: logEntry.value)
            default:
                fatalError("The other methods don't support logging yet.")
            }
        }
    }
    
}

private extension UITableViewCell {

    func decorate(title: String, subtitle: String? = nil) {
        textLabel?.text = title
        detailTextLabel?.text = subtitle
    }
    
}
