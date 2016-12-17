import UIKit

class InputViewDisplayer {
    
    fileprivate let triggerView = UITextField()
    fileprivate let inputView: InputView
    fileprivate let dataSource: InputViewDataSource

    init(for parentView: UIView, dataSource: InputViewDataSource) {
        self.dataSource = dataSource

        self.inputView = InputView(components: dataSource.data)
        triggerView.inputView = inputView

        let inputAccessoryView = InputAccessoryView.fromNib()
        inputAccessoryView.delegate = self
        triggerView.inputAccessoryView = inputAccessoryView

        triggerView.isHidden = true
        parentView.addSubview(triggerView)
        
        triggerView.becomeFirstResponder()
    }

    deinit {
        triggerView.removeFromSuperview()
    }
    
}

extension InputViewDisplayer: InputAccessoryViewDelegate {
    
    func didTapDone() {
        dataSource.selected(items: inputView.selectedRows)
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
