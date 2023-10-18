//
//  ProductDetailController.swift
//  ShopTestApp
//
//  Created by Nikita Grabar on 18.10.23.
//

import Foundation
import UIKit


class ProductDetailController: UIViewController {
    
    var model: ProductDetailModelProtocol = ProductDetailModel()
    
    private var myView: ProductDetailViewInput! {
        self.view as? ProductDetailViewInput
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        guard let item = model.items else {return}
        myView.setupUI(item, titleIngridient: model.titleIngridient)
    }
    
    // MARK: - Lifecycle
    override func loadView() {
        let view: ProductDetailView = ProductDetailView()
        view.controller = self
        self.view = view
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard Reachability.isInternetAvailable else {
            showErrorAlert(message: "Проверьте интеренет соединение")
            self.navigationController?.popViewController(animated: true)
            return
        }
    }
}

extension ProductDetailController: ProductDetailViewOutput {
    func onTapDelete() {
        guard let id = model.items?.id else {return}
        ManagerProduct.shared.removeItem(id: id)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "update"), object: nil)
        self.navigationController?.popViewController(animated: true)
    }
}
