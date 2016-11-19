import UIKit

protocol InputViewDisplaying {
    func show()
}

class InputViewDisplayer {
    
    fileprivate let triggerView = UITextField()
    fileprivate let inputView: InputView
    fileprivate let dataSelected: ([Int]) -> Void

    init(for parentView: UIView,
         data: InputView.Data,
         dataSelected: @escaping ([Int]) -> Void) {
        
        self.dataSelected = dataSelected

        self.inputView = InputView(components: data)
        triggerView.inputView = inputView

        let inputAccessoryView = InputAccessoryView.fromNib()
        inputAccessoryView.delegate = self
        triggerView.inputAccessoryView = inputAccessoryView

        triggerView.isHidden = true
        parentView.addSubview(triggerView)
    }
    
}

extension InputViewDisplayer: InputViewDisplaying {
    
    func show() {
        triggerView.becomeFirstResponder()
    }
    
}

extension InputViewDisplayer: InputAccessoryViewDelegate {
    
    func didTapDone() {
        dataSelected(inputView.selectedRows)
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
