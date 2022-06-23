//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Maxim Datsuk on 24.06.2022.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet var currentColorView: UIView!
    
    @IBOutlet var redColorValueLabel: UILabel!
    @IBOutlet var greenColorValueLabel: UILabel!
    @IBOutlet var blueColorValueLabel: UILabel!
    
    @IBOutlet var redColorSlider: UISlider!
    @IBOutlet var greenColorSlider: UISlider!
    @IBOutlet var blueColorSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentColorView.layer.cornerRadius = 10
        
    }

    // Получать значение каждого слайдера +
    // Записывать значение слайдера в соответствующую переменную +
    // Исходя из значений переменных миксовать цвет
    // Кажется, что для задания корректного значения цвета нужно slider.value * 255
    
    // MARK: - IB Actions
    @IBAction func redColorSliderAction() {
        redColorValueLabel.text = String(format: "%.2f", redColorSlider.value)
    }
    
    @IBAction func greenColorSliderAction() {
        greenColorValueLabel.text = String(format: "%.2f", greenColorSlider.value)
    }
    
    @IBAction func blueColorSliderAction() {
        blueColorValueLabel.text = String(format: "%.2f", blueColorSlider.value)
    }
    
    // MARK: - Private Methods
    private func setupCurrentColorView(red: Float, green: Float, blue: Float) {
        currentColorView.backgroundColor = UIColor.red
    }
}

