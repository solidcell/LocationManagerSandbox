import UIKit

class LogDataSource: NSObject, UITableViewDataSource {

    private let logData: LogData
    private let cellDecorator = CellDecorator()

    init(logData: LogData) {
        self.logData = logData
        super.init()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LogCell.cellIdentifier,
                                                 for: indexPath) as! LogCell
        let entry = logData.logs[indexPath.row]
        cellDecorator.decorate(cell, logEntry: entry)
        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return logData.logs.count
    }
    
}
