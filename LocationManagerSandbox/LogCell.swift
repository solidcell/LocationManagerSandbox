import UIKit

class LogCell: UITableViewCell {

    static let cellIdentifier = "LogCellIdentifier"

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailsStackView: UIStackView!

    func decorate(title: String,
                  detail: CustomStringConvertible,
                  detailColor: UIColor?) {
        decorate(title: title, details: [detail], detailsColor: detailColor)
    }

    func decorate(title: String,
                  details: [CustomStringConvertible],
                  detailsColor: UIColor! = UIColor.black) {

        titleLabel.text = title

        setDetails(details: details, color: detailsColor)
    }

    private func setDetails(details: [CustomStringConvertible], color: UIColor) {
        removeAllCurrentDetails()
        details.forEach { detail in
            addDetail(detail, color: color)
        }
    }

    private func addDetail(_ text: CustomStringConvertible, color: UIColor) {
        let detailLabel = UILabel()
        detailLabel.text = text.description
        detailLabel.textColor = color
        detailLabel.font = UIFont.systemFont(ofSize: 14)
        detailsStackView.addArrangedSubview(detailLabel)
    }

    private func removeAllCurrentDetails() {
        detailsStackView.arrangedSubviews.forEach { detailView in
            detailsStackView.removeArrangedSubview(detailView)
            detailView.removeFromSuperview()
        }
    }

}
