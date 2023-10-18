//
//  ProductDetailView.swift
//  ShopTestApp
//
//  Created by Nikita Grabar on 18.10.23.
//

import Foundation
import UIKit

protocol ProductDetailViewInput: AnyObject {
    func setupUI(_ item: MenuItem, titleIngridient: String)
}

protocol ProductDetailViewOutput: AnyObject {
    func onTapDelete()
}

class ProductDetailView: UIView {
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.image = UIImage()
        return iv
    }()
    
    let title: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.darkText
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    let titleIngridient: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.darkText
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.numberOfLines = 0
        return label
    }()
    
    let descrtiption: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.darkGray
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        label.numberOfLines = 0
        return label
    }()
    
    let deleteBtn: UIButton = {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        btn.setTitle("Удалить рецепт", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .red
        btn.layer.cornerRadius = 15
        btn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return btn
    }()
    
    weak var controller: ProductDetailViewOutput!
    
    @objc func buttonAction() {
        controller.onTapDelete()
    }
}

extension ProductDetailView: ProductDetailViewInput {
    func setupUI(_ item: MenuItem, titleIngridient: String) {
        
        imageView.image = item.icon
        self.titleIngridient.text = titleIngridient
        title.text = item.title
        descrtiption.text = item.description
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            imageView.leftAnchor.constraint(equalTo: self.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: self.rightAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 250)
        ])
        
        self.title.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(title)
        NSLayoutConstraint.activate([
            self.title.topAnchor.constraint(equalTo: imageView.bottomAnchor,constant: 5),
            self.title.leftAnchor.constraint(equalTo: imageView.leftAnchor,constant: 16),
            self.title.rightAnchor.constraint(equalTo: imageView.rightAnchor,constant: -16),
        ])
        
       
        
        self.titleIngridient.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.titleIngridient)
        NSLayoutConstraint.activate([
            self.titleIngridient.topAnchor.constraint(equalTo: self.title.bottomAnchor,constant: 10),
            self.titleIngridient.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 16),
            self.titleIngridient.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -16),
            self.titleIngridient.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        let stackIngridient = UIStackView()
        stackIngridient.frame.size.width = 100
        stackIngridient.axis = .vertical
        stackIngridient.distribution  = .fillProportionally
        stackIngridient.spacing = 5
        item.ingridient.forEach { ingridient in
            let horizontStack = UIStackView()
            let label = UILabel()
            label.text = "\(ingridient.key) - \(ingridient.value)"
            label.textAlignment = .left
            label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
            horizontStack.addArrangedSubview(label)
            
            stackIngridient.addArrangedSubview(horizontStack)
        }
        
        stackIngridient.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stackIngridient)
        NSLayoutConstraint.activate([
            stackIngridient.topAnchor.constraint(equalTo: self.titleIngridient.bottomAnchor,constant: 5),
            stackIngridient.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 20),
            stackIngridient.heightAnchor.constraint(equalToConstant: CGFloat(item.ingridient.count * 20))
        ])
        
        self.descrtiption.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(descrtiption)
        NSLayoutConstraint.activate([
            self.descrtiption.topAnchor.constraint(equalTo: stackIngridient.bottomAnchor,constant: 10),
            self.descrtiption.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 16),
            self.descrtiption.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -16)
        ])
        
        deleteBtn.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(deleteBtn)
        NSLayoutConstraint.activate([
            deleteBtn.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor,constant: 5),
            deleteBtn.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 16),
            deleteBtn.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -16),
            deleteBtn.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

