import UIKit

class InputView: UIPickerView, UIPickerViewDataSource, UIPickerViewDelegate {
    
    typealias Component = [CustomStringConvertible]
    typealias Data = [Component]

    let components: Data

    init(components: Data) {
        self.components = components
        super.init(frame: CGRect.zero)
        self.dataSource = self
        self.delegate = self
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return components.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return components[component].count
    }

    var selectedRows: [Int] {
        return components.enumerated().map { i, _ in
            return selectedRow(inComponent: i)
        }
    }

    /* For some reason, when there are multiple dials, the text alignment is 
     changes for a row in focus vs out of focus. Check out "Deferring Location
     Updates" > "allowDeferredLocationUpdates" to reproduce it.
     Punting for now, since it's low priority.
     */
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = view as? UILabel ?? UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18)
        label.adjustsFontSizeToFitWidth = true
        label.text = components[component][row].description
        
        return label
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
