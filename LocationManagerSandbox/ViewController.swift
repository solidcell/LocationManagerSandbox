import UIKit
import CoreLocation

class ViewController: UIViewController {

    private let locationManager = CLLocationManager()
    let logData = LogData()
    
    private lazy var locationManagerDelegate: LocationManagerDelegate = {
        return LocationManagerDelegate(logData: self.logData)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.delegate = locationManagerDelegate
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let navVC = segue.destination as? UINavigationController,
            let methodsVC = navVC.topViewController as? MethodsTableViewController {
            prepare(methodsTableViewController: methodsVC)
        } else if let logVC = segue.destination as? LogTableViewController {
            prepare(logTableViewController: logVC)
        }
    }

    private func prepare(methodsTableViewController: MethodsTableViewController) {
        methodsTableViewController.methodExecutor = MethodExecutor(locationManager: locationManager,
                                                                   logData: logData)
    }

    private func prepare(logTableViewController: LogTableViewController) {
        logData.delegate = logTableViewController
        logTableViewController.dataSource = LogDataSource(logData: logData)
    }

}
