//
//  ExtraLinksTableViewCell.swift
//  SneakersStoreApp
//
//  Created by Meyram on 16.06.2023.
//

import UIKit

class ExtraLinksTableViewCell: UITableViewCell {
    
    static let identifier = "ExtraLinksTableViewCell"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    private let symbolVector: UIImageView = {
        let symbol = UIImageView()
        symbol.image = UIImage(named: "vector")
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
    
    private func setupUI() {
        
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(symbolVector)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        symbolVector.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -113),
            titleLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -15),
            
            symbolVector.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            symbolVector.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -21),
            symbolVector.widthAnchor.constraint(equalToConstant: 16),
            symbolVector.heightAnchor.constraint(equalToConstant: 16)
        ])
    }
}
