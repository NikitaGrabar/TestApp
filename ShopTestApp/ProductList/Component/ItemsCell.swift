//
//  ItemsCell.swift
//  ShopTestApp
//
//  Created by Nikita Grabar on 17.10.23.
//

import Foundation
import UIKit

class IconImageView: UIImageView {
    override var intrinsicContentSize: CGSize {
        return .init(width: 80, height: 80)
    }
}


class ItemsCell: UITableViewCell {

    let iconImageView: IconImageView = {
        let iv = IconImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage()
        return iv
    }()

    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.darkText
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.numberOfLines = 0
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.darkText
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let stackViewHorizont = UIStackView(arrangedSubviews: [iconImageView, nameLabel, UIView()])
        addSubview(stackViewHorizont)
        stackViewHorizont.translatesAutoresizingMaskIntoConstraints = false
        stackViewHorizont.spacing = 12

        stackViewHorizont.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackViewHorizont.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackViewHorizont.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        stackViewHorizont.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true

        stackViewHorizont.isLayoutMarginsRelativeArrangement = true
        stackViewHorizont.layoutMargins = .init(top: 12, left: 16, bottom: 12, right: 16)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

