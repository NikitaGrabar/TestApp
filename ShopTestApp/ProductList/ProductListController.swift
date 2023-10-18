//
//  ViewController.swift
//  ShopTestApp
//
//  Created by Nikita Grabar on 17.10.23.
//

import UIKit

class ProductListController: UIViewController {
    
    var model: ProductListModelProtocol = ProductListModel()
    
    private var myView: ProductListViewInput! {
        self.view as? ProductListViewInput
    }
    
    // MARK: - Lifecycle
    override func loadView() {
        let view: ProductListView = ProductListView()
        view.controller = self
        self.view = view
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myView.setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         NotificationCenter.default.addObserver(self, selector: #selector(updateUserData), name: Notification.Name("update"), object: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        model.menuItems = ManagerProduct.shared.menuItem
        myView.reloadData()
    }
    
    private func setupNavBar() {
        self.title = "Продукты"
        let addBtn = UIBarButtonItem(image: UIImage(systemName: "plus.app.fill")!, style: .plain, target: self, action: #selector(handleNavigationButton))
        self.navigationItem.rightBarButtonItem = addBtn
    }
    
    @objc func updateUserData() {
        model.menuItems = ManagerProduct.shared.menuItem
        myView.reloadData()
    }
    
    @objc private func handleNavigationButton() {
        showErrorAlert(message: "Прошу прощения,это еще не готово")
    }
    
}

extension ProductListController: ProductListViewOutput {
    func nuberOfRowsInTable() -> Int {
        return model.menuItems.count
    }
    
    func cellDataAt(_ indexPath: IndexPath) -> MenuItem {
        return model.menuItems[indexPath.row]
    }
    
    func didSelectRowAt(_ indexPaht: IndexPath) {
        let item = model.menuItems[indexPaht.row]
        let vc = ProductDetailController()
        vc.model.items = item
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


