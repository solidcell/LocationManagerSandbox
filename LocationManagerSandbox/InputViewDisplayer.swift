import UIKit

protocol InputViewDisplaying {
    func show()
}

class InputViewDisplayer {
    
    fileprivate let triggerView = UITextField()

    init(for parentView: UIView) {
        triggerView.isHidden = true
        parentView.addSubview(triggerView)
        
        let inputAccessoryView = InputAccessoryView.fromNib()
        inputAccessoryView.delegate = self
        triggerView.inputAccessoryView = inputAccessoryView

        let accessoryView = UIPickerView()
        triggerView.inputView = accessoryView
    }
    
}

extension InputViewDisplayer: InputViewDisplaying {
    
    func show() {
        triggerView.becomeFirstResponder()
    }
    
}

extension InputViewDisplayer: InputAccessoryViewDelegate {
    
    func didTapDone() {
        dismiss()
    }

    func didTapCancel() {
        dismiss()
    }

    private func dismiss() {
        UIView.animate(withDuration: 0.5, animations: { [weak self] in
            self?.triggerView.resignFirstResponder()
        })
    }
    
}
