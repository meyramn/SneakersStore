//
//  ProfileTableViewCell.swift
//  SneakersStoreApp
//
//  Created by Meyram on 14.06.2023.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    static let identifier = "ProfileTableViewCell"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 17, weight: .regular)

        return label
    }()
    
    private let symbolChevron: UIImageView = {
        let symbol = UIImageView()
        symbol.image = UIImage(named: "chevron.right")
        symbol.tintColor = .gray
        symbol.contentMode = .scaleAspectFit
        return symbol
    }()
    
    private let container: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 4
        return view
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.backgroundColor = UIColor(named: "TxtFieldBackgroundColor")
        self.contentView.addSubview(container)
        
        container.addSubview(titleLabel)
        container.addSubview(symbolChevron)
        
        container.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        symbolChevron.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            container.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            container.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            container.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8),
            
            titleLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -94),
            
            symbolChevron.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            symbolChevron.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
            symbolChevron.widthAnchor.constraint(equalToConstant: 8),
            symbolChevron.heightAnchor.constraint(equalToConstant: 15)
        ])
    }
}
