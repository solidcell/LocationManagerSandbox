import UIKit

class MethodSectionTableViewController: UITableViewController {

    var delegate: MethodSectionDelegate!
    var dataSource: MethodSectionDataSource!

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate.inputRetriever = InputRetriever(view: view)
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController!.setNavigationBarHidden(false, animated: true)
    }
    
}

class InputRetriever {

    private weak var view: UIView?
    private var inputViewDisplayer: InputViewDisplayer?

    init(view: UIView) {
        self.view = view
    }

    func inputFrom(data: InputView.Data,
                   dataSelected: @escaping ([Int]) -> Void) {
        guard let view = view else { return }
        self.inputViewDisplayer = InputViewDisplayer(for: view,
                                                     data: data,
                                                     dataSelected: dataSelected)
    }
    
}
