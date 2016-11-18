import UIKit

class InputAccessoryView: UIView {

    weak var delegate: InputAccessoryViewDelegate?

    @IBAction func didTapCancel(_: UIButton) {
        delegate?.didTapCancel()
    }

    @IBAction func didTapDone(_: UIButton) {
        delegate?.didTapDone()
    }
}

protocol InputAccessoryViewDelegate: class {
    func didTapCancel()
    func didTapDone()
}
