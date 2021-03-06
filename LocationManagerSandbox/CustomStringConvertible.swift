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

struct PrettyActivityType: CustomStringConvertible {
    
    let activityType: CLActivityType

    init(_ activityType: CLActivityType) {
        self.activityType = activityType
    }
    
    var description: String {
        switch activityType {
        case .automotiveNavigation: return "automotiveNavigation"
        case .fitness: return "fitness"
        case .other: return "other"
        case .otherNavigation: return "otherNavigation"
        }
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

struct PrettyTimeInterval: CustomStringConvertible {
    
    let timeInterval: TimeInterval

    init(_ timeInterval: TimeInterval) {
        self.timeInterval = timeInterval
    }
    
    var description: String {
        switch timeInterval {
        case CLTimeIntervalMax: return "CLTimeIntervalMax"
        default: return String(describing: timeInterval)
        }
    }
    
}
