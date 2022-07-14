//
//  ColorViewController.swift
//  ColorizedApp
//
//  Created by Maxim Datsuk on 13.07.2022.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setNewColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)
}

class ColorViewController: UIViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.colorViewBackbroundValue = view.backgroundColor
        settingsVC.delegate = self
        
    }
}

// MARK: - SettingsViewControllerDelegate
extension ColorViewController: SettingsViewControllerDelegate {
    func setNewColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        view.backgroundColor = UIColor(
            red: red,
            green: green,
            blue: blue,
            alpha: alpha
        )
    }
}
