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

    func methodSection(at index: Int) -> MethodSection {
        return sections[index]
    }

    func methodEnums(at index: Int) -> [MethodExecutor.MethodEnum] {
        return methodSection(at: index).items
    }

    func methodItem(at indexPath: IndexPath) -> MethodExecutor.MethodEnum {
        return methodEnums(at: indexPath.section)[indexPath.row]
    }
    
}
