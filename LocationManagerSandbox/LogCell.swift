import UIKit

class LogCell: UITableViewCell {

    static let cellIdentifier = "LogCellIdentifier"

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailsStackView: UIStackView!

    func decorate(title: String,
                  subtitle: String? = nil,
                  subtitleColor: UIColor? = UIColor.black) {

        titleLabel.text = title
        
        let detailLabel = UILabel()
        detailLabel.text = subtitle
        detailLabel.textColor = subtitleColor
        detailLabel.font = UIFont.systemFont(ofSize: 14)
        detailsStackView.addArrangedSubview(detailLabel)
    }

}
