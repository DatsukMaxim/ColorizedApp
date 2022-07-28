//
//  ColorViewController.swift
//  ColorizedApp
//
//  Created by Maxim Datsuk on 13.07.2022.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setColor(_ color: UIColor)
}

final class ColorViewController: UIViewController {
    override func prepare(for segue: UIStoryboardSegue, sender _: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.viewBackbroundColorValue = view.backgroundColor
        settingsVC.delegate = self
    }
}

// MARK: - SettingsViewControllerDelegate
extension ColorViewController: SettingsViewControllerDelegate {
    func setColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}
