//
//  CustomTableViewCell.swift
//  SneakersStoreApp
//
//  Created by Meyram on 02.06.2023.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    static let identifier = "CustomTableViewCell"
    
    private let myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .label
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.text = "error"
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 12, weight: .thin)
        label.text = "error"
        return label
    }()
    
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.text = "error"
        return label
    }()
    
    let container: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 4
        return view
    }()
    
    let symbolChevron: UIImageView = {
        let symbol = UIImageView()
        symbol.image = UIImage(named: "chevron.right")
        symbol.tintColor = .gray
        symbol.contentMode = .scaleAspectFit
        return symbol
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(order: OrderModel) {
        self.myImageView.image = UIImage(named: order.imageURLs)
        self.titleLabel.text = order.id
        self.dateLabel.text = order.date
        self.infoLabel.text = order.price
    }
    
    private func setupUI() {
        contentView.backgroundColor = UIColor(named: "TxtFieldBackgroundColor")
        self.contentView.addSubview(container)
        
        container.addSubview(myImageView)
        container.addSubview(titleLabel)
        container.addSubview(dateLabel)
        container.addSubview(infoLabel)
        container.addSubview(symbolChevron)
        
        container.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        symbolChevron.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            container.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            container.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            container.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8),
            
            myImageView.topAnchor.constraint(equalTo: container.topAnchor),
            myImageView.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            myImageView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            myImageView.widthAnchor.constraint(equalToConstant: 120),
            
            titleLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: myImageView.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -60),
            
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            dateLabel.leadingAnchor.constraint(equalTo: myImageView.trailingAnchor, constant: 10),
            dateLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -60),
            
            infoLabel.topAnchor.constraint(greaterThanOrEqualTo: dateLabel.bottomAnchor, constant: 12),
            infoLabel.leadingAnchor.constraint(equalTo: myImageView.trailingAnchor, constant: 10),
            infoLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -94),
            infoLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -16),
            
            symbolChevron.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            symbolChevron.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
            symbolChevron.widthAnchor.constraint(equalToConstant: 9),
            symbolChevron.heightAnchor.constraint(equalToConstant: 14)
        ])
    }
}
