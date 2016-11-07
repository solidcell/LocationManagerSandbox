import CoreLocation

enum MethodEnum {
    case requestWhenInUseAuthorization
    case requestAlwaysAuthorization
}

class MethodExecutor {

    fileprivate let locationManager: CLLocationManager

    init(locationManager: CLLocationManager) {
        self.locationManager = locationManager
    }

    func execute(_ method: MethodEnum) {
        switch method {
        case .requestWhenInUseAuthorization: requestWhenInUseAuthorization()
        case .requestAlwaysAuthorization: requestAlwaysAuthorization()
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
    
}
