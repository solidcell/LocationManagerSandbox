import CoreLocation

extension CLLocation {

    override open var description: String {
        return "\(coordinate)(\(horizontalAccuracy)) \(timestamp.formatted) a\(altitude)(\(verticalAccuracy)) s\(speed) c\(course)"
    }
    
}

extension CLLocationCoordinate2D: CustomStringConvertible {

    public var description: String {
        return "\(latitude),\(longitude)"
    }
    
}

struct PrettyLocationDistance: CustomStringConvertible {
    
    let distance: CLLocationDistance

    init(_ distance: CLLocationDistance) {
        self.distance = distance
    }
    
    var description: String {
        switch distance {
        case kCLDistanceFilterNone: return "kCLDistanceFilterNone"
        case CLLocationDistanceMax: return "CLLocationDistanceMax"
        default: return String(describing: distance)
        }
    }
    
}
