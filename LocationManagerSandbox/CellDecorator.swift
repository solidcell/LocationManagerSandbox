import UIKit
import CoreLocation

class CellDecorator {

    func decorate(_ cell: UITableViewCell, logEntry: LogEntry) {
        switch logEntry {
        case .didFinishLaunchingWithOptions(let launchOptions):
            cell.decorate(title: "application(_:didFinishLaunchingWithOptions:)",
                          subtitle: String(describing: launchOptions))
        case .didChangeAuthorization(let status):
            cell.decorate(title: "locationManager(_:didChangeAuthorization:)",
                          subtitle: String(describing: status),
                          subtitleColor: status.color)
        case .didUpdateLocations(let locations):
            cell.decorate(title: "locationManager(_:didUpdateLocations:)",
                          subtitle: String(describing: locations))
        case .authorizationStatus(let status):
            cell.decorate(title: "authorizationStatus",
                          subtitle: String(describing: status),
                          subtitleColor: status.color)
        case .locationServicesEnabled(let isEnabled):
            cell.decorate(title: "locationServicesEnabled",
                          subtitle: isEnabled.description,
                          subtitleColor: isEnabled ? UIColor.green : UIColor.red)
        }
    }

}

private extension CLAuthorizationStatus {

    private var good: UIColor { return UIColor(rgb: 0x67AD65) }
    private var bad: UIColor { return UIColor(rgb: 0xC94D3F) }
    private var neutral: UIColor { return UIColor.black }

    var color: UIColor {
        switch self {
        case .notDetermined: return neutral
        case .authorizedAlways: return good
        case .authorizedWhenInUse: return good
        case .denied: return bad
        case .restricted: return bad
        }
    }
    
}

private extension UITableViewCell {

    func decorate(title: String,
                  subtitle: String? = nil,
                  subtitleColor: UIColor? = UIColor.black) {
        textLabel?.text = title
        detailTextLabel?.text = subtitle
        detailTextLabel?.textColor = subtitleColor
    }
    
}
