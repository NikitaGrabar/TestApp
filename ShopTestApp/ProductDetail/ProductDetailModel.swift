//
//  ProductDetailModel.swift
//  ShopTestApp
//
//  Created by Nikita Grabar on 18.10.23.
//

import Foundation

protocol ProductDetailModelProtocol {
    var titleIngridient: String {get set}
    var items: MenuItem? {get set}
}

class ProductDetailModel: ProductDetailModelProtocol {
    var titleIngridient: String = "Ингридиенты"
    var items: MenuItem?
}
