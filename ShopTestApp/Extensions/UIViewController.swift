//
//  UIViewController.swift
//  ShopTestApp
//
//  Created by Nikita Grabar on 18.10.23.
//

import UIKit

extension UIViewController {

    func showErrorAlert(message: String) {
        let alert = UIAlertController.init(title: NSLocalizedString("Ошибка", comment: ""),
                                           message: message, preferredStyle: .alert)
        alert.addAction(.init(title: NSLocalizedString("Ok", comment: ""),
                              style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

