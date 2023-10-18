//
//  ProductListView.swift
//  ShopTestApp
//
//  Created by Nikita Grabar on 18.10.23.
//

import Foundation
import UIKit

protocol ProductListViewInput: AnyObject {
    func setupView()
    func reloadData()
    func setupTableView()
}

protocol ProductListViewOutput: AnyObject {
    func nuberOfRowsInTable() -> Int
    func cellDataAt(_ indexPath: IndexPath) -> MenuItem
    func didSelectRowAt(_ indexPaht: IndexPath)
}

class ProductListView: UIView {
    
    let tableView = UITableView()
    
    weak var controller: ProductListViewOutput!
}

extension ProductListView: ProductListViewInput {
    func setupTableView() {
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.bounces = false
        tableView.alwaysBounceVertical = false
        tableView.showsVerticalScrollIndicator = false
        self.addSubview(tableView)
        tableView.fillSuperview()
    }
    
    func setupView() {
    }
    
    func reloadData() {
        self.tableView.reloadData()
    }
}

extension ProductListView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return controller.nuberOfRowsInTable()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ItemsCell(style: .default, reuseIdentifier: "cellId")
        let menuItem = controller.cellDataAt(indexPath)
        cell.selectionStyle = .none
        cell.iconImageView.image = menuItem.icon
        cell.nameLabel.text = menuItem.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        controller.didSelectRowAt(indexPath)
    }
}
