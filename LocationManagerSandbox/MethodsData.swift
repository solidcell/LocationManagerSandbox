import UIKit

class MethodsData {

    struct MethodSection {
        let name: String
        let items: [MethodExecutor.MethodEnum]
    }

    private let authorizationSection = MethodSection(name: "Authorization",
                                                     items: [.requestWhenInUseAuthorization,
                                                             .requestAlwaysAuthorization])
    
    private let availabilitySection = MethodSection(name: "Availability",
                                                    items: [.authorizationStatus,
                                                            .locationServicesEnabled])
    
    private let standardLocationUpdatesSection = MethodSection(name: "Standard Location Updates",
                                                               items: [.startUpdatingLocation,
                                                                       .stopUpdatingLocation])

    let sections: [MethodSection]

    init() {
        self.sections = [authorizationSection,
                         availabilitySection,
                         standardLocationUpdatesSection]
    }
    
}
