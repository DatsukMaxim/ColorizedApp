//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Maxim Datsuk on 24.06.2022.
//

import UIKit

class SettingsViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    var colorViewBackbroundValue: UIColor!
    var delegate: SettingsViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        
        colorView.layer.cornerRadius = 15
        setSlidersValueFrom(color: colorViewBackbroundValue)
        setColor()
        setValuesBySliderPosition(for: redValueLabel, greenValueLabel, blueValueLabel)
        setupToolbar(for: redTextField, greenTextField, blueTextField)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - IB Actions
    @IBAction func sliderAction(_ sender: UISlider) {
        setColor()
        switch sender {
        case redSlider:
            redValueLabel.text = string(from: redSlider)
            redTextField.text = string(from: redSlider)
        case greenSlider:
            greenValueLabel.text = string(from: greenSlider)
            greenTextField.text = string(from: greenSlider)
        default:
            blueValueLabel.text = string(from: blueSlider)
            blueTextField.text = string(from: blueSlider)
        }
    }
    
    @IBAction func textFieldEditing(_ sender: UITextField) {
        guard let newValue = sender.text else { return }
        guard var numberValue = Float(newValue) else { return }
        if numberValue < 0 {
            numberValue = 0
        } else if numberValue > 1 {
            numberValue = 1
        }
//        setValuesByTextFieldValue()
        
        switch sender {
        case redTextField:
            redSlider.value = numberValue
            redValueLabel.text = string(from: redSlider)
        case greenTextField:
            greenSlider.value = float(from: greenTextField)
            greenValueLabel.text = string(from: greenSlider)
        default:
            blueSlider.value = float(from: blueTextField)
            blueValueLabel.text = string(from: blueSlider)
        }
    }
    
    @IBAction func doneButtonTapped() {
        view.endEditing(true)
        
        delegate.setNewColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
        
        dismiss(animated: true)
    }
    
    // MARK: - Private Methods
    private func setSlidersValueFrom(color: UIColor) {
        redSlider.value = colorViewBackbroundValue.redValue
        greenSlider.value = colorViewBackbroundValue.greenValue
        blueSlider.value = colorViewBackbroundValue.blueValue
    }
    
    private func setColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func setValuesBySliderPosition(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redValueLabel:
                redValueLabel.text = string(from: redSlider)
                redTextField.text = string(from: redSlider)
            case greenValueLabel:
                greenValueLabel.text = string(from: greenSlider)
                greenTextField.text = string(from: greenSlider)
            default:
                blueValueLabel.text = string(from: blueSlider)
                blueTextField.text = string(from: blueSlider)
            }
        }
    }
    
    private func setValuesByTextFieldValue(for textFields: UITextField...) {
        textFields.forEach { textField in
            guard let newValue = textField.text else { return }
            guard var numberValue = Float(newValue) else { return }
            if numberValue < 0 {
                numberValue = 0
            } else if numberValue > 1 {
                numberValue = 1
            }
            
            switch textField {
            case redTextField:
                redValueLabel.text = String(format: "%.2f", numberValue)
                redSlider.value = numberValue
            case greenTextField:
                greenValueLabel.text = String(format: "%.2f", numberValue)
                greenSlider.value = numberValue
            default:
                blueValueLabel.text = String(format: "%.2f", numberValue)
                blueSlider.value = numberValue
            }
        }
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func float(from textField: UITextField) -> Float {
        guard let newValue = textField.text else { return 0 }
        guard var numberValue = Float(newValue) else { return 0 }
        if numberValue < 0 {
            numberValue = 0
        } else if numberValue > 1 {
            numberValue = 1
        }
        
        let formatedValue = String(format: "%.2f", numberValue)
        let result = Float(formatedValue)!
        
        print("formatedValue: \(formatedValue)")
        print("result: \(result)")
        
        return result
    }
    
    private func setupToolbar(for textFields: UITextField...) {
        let toolBar = UIToolbar(frame: CGRect(
                x: 0,
                y: 0,
                width: view.frame.size.width,
                height: 50
            )
        )
        let flexibleSpace = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: self,
            action: nil
        )
        let doneButton = UIBarButtonItem(
            title: "Done",
            style: .done,
            target: self,
            action: #selector(didTapDone)
        )
        
        toolBar.items = [flexibleSpace, doneButton]
        toolBar.sizeToFit()
        
        textFields.forEach{ textField in
            switch textField {
            case redTextField:
                redTextField.inputAccessoryView = toolBar
            case greenTextField:
                greenTextField.inputAccessoryView = toolBar
            default:
                blueTextField.inputAccessoryView = toolBar
            }
        }
    }
    
    @objc private func didTapDone() {
        redTextField.resignFirstResponder()
        greenTextField.resignFirstResponder()
        blueTextField.resignFirstResponder()
    }
}

// MARK: - Extensions
extension UIColor {
    var redValue: Float { Float(CIColor(color: self).red) }
    var greenValue: Float { Float(CIColor(color: self).green) }
    var blueValue: Float { Float(CIColor(color: self).blue) }
}

// MARK: - UITextFieldsDelegete
extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newValue = textField.text else { return }
        guard let numberValue = Int(newValue) else { return }
        switch textField {
        case redTextField:
            redTextField.text = String(format: "%.2f", numberValue)
        case redTextField:
            greenTextField.text = String(format: "%.2f", numberValue)
        default:
            blueTextField.text = String(format: "%.2f", numberValue)
        }
    }
}
