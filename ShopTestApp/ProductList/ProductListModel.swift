//
//  ProductListModel.swift
//  ShopTestApp
//
//  Created by Nikita Grabar on 18.10.23.
//

import Foundation
import UIKit

struct MenuItem {
    let id: String
    let icon: UIImage
    let title: String
    let ingridient: [String: String]
    let description: String
}

protocol ProductListModelProtocol {
    var menuItems: [MenuItem] {get set}
}

class ProductListModel: ProductListModelProtocol {
    var menuItems: [MenuItem] = []
}

