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
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return components[component][row].description
    }

    var selectedRows: [Int] {
        return components.enumerated().map { i, _ in
            return selectedRow(inComponent: i)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
