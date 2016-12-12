import UIKit
import CoreLocation

class VariableCell: UITableViewCell {
    
    static var cellIdentifier: String { return "VariableCellIdentifier" }

    private var inputViewDisplayer: InputViewDisplayer?
    private var executor: MethodExecutor!
    private var locationDistance: MethodExecutor.LocationDistanceEnum!
    private var data: [[PrettyLocationDistance]]!

    @IBOutlet weak var titleLabel: UILabel!

    @IBAction func didTapEditButton(sender: UIButton) {
        self.inputViewDisplayer = InputViewDisplayer(for: self,
                                                     data: data,
                                                     dataSelected: itemsSelected)
    }

    private func itemsSelected(items: [Int]) {
        items.enumerated().forEach { component, row in
            executor.set(locationDistance, data[component][row].distance)
        }
    }

    func configure(executor: MethodExecutor, locationDistance: MethodExecutor.LocationDistanceEnum) {
        self.executor = executor
        self.locationDistance = locationDistance
        self.data = [[PrettyLocationDistance(kCLDistanceFilterNone),
                      PrettyLocationDistance(CLLocationDistanceMax),
                      PrettyLocationDistance(1.0)]]
        titleLabel.text = String(describing: locationDistance)
    }

}
