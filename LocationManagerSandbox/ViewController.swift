import UIKit
import CoreLocation

class ViewController: UIViewController {

    private let locationManager = CLLocationManager()
    let logData = LogData()

    @IBOutlet weak var separatorBar: UIView!
    @IBOutlet weak var separatorBarOffset: NSLayoutConstraint!
    
    private lazy var locationManagerDelegate: LocationManagerDelegate = {
        return LocationManagerDelegate(logData: self.logData)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.delegate = locationManagerDelegate
        let separatorBarPan = UIPanGestureRecognizer(target: self, action: #selector(didPanSeparatorBar(_:)))
        separatorBar.addGestureRecognizer(separatorBarPan)
    }

    var separatorPanStartOffset: CGFloat?

    func didPanSeparatorBar(_ panGestureRecognizer: UIPanGestureRecognizer) {
        switch panGestureRecognizer.state {
        case .began:
            separatorPanStartOffset = separatorBarOffset.constant
        case .ended:
            separatorPanStartOffset = nil
        case .changed:
            let delta = panGestureRecognizer.translation(in: view).y
            let offset = separatorPanStartOffset! + delta
            separatorBarOffset.constant = offset
        default:
            fatalError("what other things do we need to handle?")
        }
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
