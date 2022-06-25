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
    
    // MARK: - IB Actions
    @IBAction func redColorSliderAction() {
        redColorValueLabel.text = String(format: "%.2f", redColorSlider.value)
        setupCurrentColorView()
    }
    
    @IBAction func greenColorSliderAction() {
        greenColorValueLabel.text = String(format: "%.2f", greenColorSlider.value)
        setupCurrentColorView()
    }
    
    @IBAction func blueColorSliderAction() {
        blueColorValueLabel.text = String(format: "%.2f", blueColorSlider.value)
        setupCurrentColorView()
    }
    
    // MARK: - Private Methods
    private func setupCurrentColorView() {
        currentColorView.backgroundColor = UIColor(
            red: CGFloat(self.redColorSlider.value),
            green: CGFloat(self.greenColorSlider.value),
            blue: CGFloat(self.blueColorSlider.value),
            alpha: 1
        )
    }
}

