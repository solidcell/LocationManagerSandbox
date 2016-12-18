import CoreLocation

protocol InputViewDataSource {

    var data: [[CustomStringConvertible]] { get }
    func selected(items: [Int])

}

struct LocationDistanceDataSource : InputViewDataSource {

    private let locationDistance: MethodExecutor.LocationDistanceEnum
    private let executor: MethodExecutor
    private let locationDistances = [PrettyLocationDistance(kCLDistanceFilterNone),
                                     PrettyLocationDistance(CLLocationDistanceMax),
                                     PrettyLocationDistance(1.0)]

    init(executor: MethodExecutor, locationDistance: MethodExecutor.LocationDistanceEnum) {
        self.executor = executor
        self.locationDistance = locationDistance
    }

    var data: [[CustomStringConvertible]] {
        return [locationDistances]
    }

    func selected(items: [Int]) {
        let prettyDistance = locationDistances[items[0]]
        executor.set(locationDistance, prettyDistance.distance)
    }

}

struct DeferredUpdatedDataSource : InputViewDataSource {

    private let executor: MethodExecutor
    private let distanceData = [PrettyLocationDistance(kCLDistanceFilterNone),
                                PrettyLocationDistance(CLLocationDistanceMax),
                                PrettyLocationDistance(1.0)]
    private let timeoutData = [PrettyTimeInterval(CLTimeIntervalMax),
                               PrettyTimeInterval(1),
                               PrettyTimeInterval(5),
                               PrettyTimeInterval(15),
                               PrettyTimeInterval(30),
                               PrettyTimeInterval(60),
                               PrettyTimeInterval(180),
                               PrettyTimeInterval(600),
                               PrettyTimeInterval(1800)]

    init(executor: MethodExecutor) {
        self.executor = executor
    }

    var data: [[CustomStringConvertible]] {
        return [distanceData, timeoutData]
    }
    
    func selected(items: [Int]) {
        let distance = distanceData[items[0]].distance
        let timeout = timeoutData[items[1]].timeInterval
        executor.allowDeferredLocationUpdates(distance: distance, timeout: timeout)
    }
}

struct ActivityTypeDataSource : InputViewDataSource {

    private let executor: MethodExecutor
    private let activityTypes = [PrettyActivityType(.automotiveNavigation),
                                 PrettyActivityType(.fitness),
                                 PrettyActivityType(.other),
                                 PrettyActivityType(.otherNavigation)]

    init(executor: MethodExecutor) {
        self.executor = executor
    }

    var data: [[CustomStringConvertible]] {
        return [activityTypes]
    }
    
    func selected(items: [Int]) {
        let activityType = activityTypes[items[0]].activityType
        executor.activityTypeSet(activityType)
    }
}
