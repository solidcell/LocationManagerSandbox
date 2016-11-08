import CoreLocation

class MethodExecutor {

    enum MethodEnum {
        case requestWhenInUseAuthorization
        case requestAlwaysAuthorization
        case authorizationStatus
        case locationServicesEnabled
        case startUpdatingLocation
    }

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
        case .startUpdatingLocation: startUpdatingLocation()
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
        let entry = LogEntry(method: .executor(.authorizationStatus),
                             value: status.description)
        logData.newEntry(entry)
    }

    func locationServicesEnabled() {
        let enabled = CLLocationManager.locationServicesEnabled()
        let entry = LogEntry(method: .executor(.locationServicesEnabled),
                             value: String(describing: enabled))
        logData.newEntry(entry)
    }

    func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
    }
    
}
