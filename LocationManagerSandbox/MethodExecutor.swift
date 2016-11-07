import CoreLocation

enum MethodEnum {
    case requestWhenInUseAuthorization
    case requestAlwaysAuthorization
    case authorizationStatus
    case locationServicesEnabled
}

class MethodExecutor {

    fileprivate let locationManager: CLLocationManager
    fileprivate let logData: LogData

    init(locationManager: CLLocationManager,
         logData: LogData) {
        self.locationManager = locationManager
        self.logData = logData
    }

    func execute(_ method: MethodEnum) {
        switch method {
        case .requestWhenInUseAuthorization: requestWhenInUseAuthorization()
        case .requestAlwaysAuthorization: requestAlwaysAuthorization()
        case .authorizationStatus: authorizationStatus()
        case .locationServicesEnabled: locationServicesEnabled()
        }
    }
    
}

fileprivate extension MethodExecutor {

    func requestWhenInUseAuthorization() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    func requestAlwaysAuthorization() {
        locationManager.requestAlwaysAuthorization()
    }

    func authorizationStatus() {
        let status = CLLocationManager.authorizationStatus()
        let entry = LogEntry(title: "authorizationStatus",
                             subtitle: status.description)
        logData.newEntry(entry)
    }

    func locationServicesEnabled() {
        let enabled = CLLocationManager.locationServicesEnabled()
        let entry = LogEntry(title: "locationServicesEnabled",
                             subtitle: String(describing: enabled))
        logData.newEntry(entry)
    }
    
}
