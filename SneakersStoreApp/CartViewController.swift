//
//  CartViewController.swift
//  SneakersStoreApp
//
//  Created by Meyram on 01.06.2023.
//

import UIKit

class CartViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
   
    let cartProducts = ["Dolce", "Off-white", "Nike brown", "Nike gray", "NewBalance"]
    var cartCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "TxtFieldBackgroundColor")
        setupNavBar()
//        setupCartLabel()
        setupCartCollectionView()
        setupConfirmButton()
    }
    
    func setupNavBar() {
        title = "Cart"
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    func setupCartLabel() {
        let topLabel = UILabel(frame: CGRect(x: 177, y: 56, width: 36, height: 22))
        topLabel.text = "Cart"
        topLabel.textAlignment = .center
        topLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        topLabel.textColor = .black
        view.addSubview(topLabel)
    }
    
    func setupConfirmButton() {
        let confirmButton = UIButton(frame: CGRect(x: 15, y: 693, width: 358, height: 54))
        confirmButton.setTitle("Confirm Order", for: .normal)
        confirmButton.backgroundColor = .black
        confirmButton.setTitleColor(.white, for: .normal)
        confirmButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        confirmButton.layer.cornerRadius = 28
        //confirmButton.addTarget(self, action: #selector(signInButtonPressed), for: .touchUpInside)
        
        view.addSubview(confirmButton)
    }
    
    func setupCartCollectionView() {
        
        let layout = UICollectionViewFlowLayout()
        
        cartCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout) // it was frame: .zero - from tutorial or CGRect(x: 0, y: 0, width: 4, height: 0)
        view.addSubview(cartCollectionView)
        
        cartCollectionView.dataSource = self
        cartCollectionView.delegate = self
        
        cartCollectionView.register(CustomCartCell.self, forCellWithReuseIdentifier: "cell") // xui znaet chto eto
        
        setupCartCellConstraints()
    }
    
    func setupCartCellConstraints() {
        cartCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cartCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            cartCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cartCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            cartCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16),
        ])
    
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cartProducts.count
    }
    // cell instance and etc
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCartCell
        cell.productImageView.image = UIImage(named: cartProducts[indexPath.row])
        cell.productNameLabel.text = cartProducts[indexPath.row]
        return cell
    }
    
    // size of item
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 390, height: 160)
    }
    
    // nazhatie
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("zhmal)))")
    }
    
    
}

class CustomCartCell: UICollectionViewCell {
    
    let productImageView = UIImageView()
    let productNameLabel = UILabel()
    let itemAmountButton = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(productImageView)
        addSubview(productNameLabel)
        addSubview(itemAmountButton)
        
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        productNameLabel.translatesAutoresizingMaskIntoConstraints = false
        itemAmountButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            productImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            productImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -234),
            productImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            productNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 21),
            productNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 172),
            productNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18),
            productNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -121),
            
            itemAmountButton.topAnchor.constraint(equalTo: topAnchor, constant: 103),
            itemAmountButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 172),
            itemAmountButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -52),
            itemAmountButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -21)
        ])
        
        
        //productImageView.image = UIImage(named: "Dolce")
        
        productNameLabel.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        productNameLabel.textAlignment = .left
        //productNameLabel.text = "Dolce & Gabbana"
        
        itemAmountButton.setTitle("Buy", for: .normal)
        itemAmountButton.backgroundColor = .black
        itemAmountButton.setTitleColor(.white, for: .normal)
        itemAmountButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        itemAmountButton.layer.cornerRadius = 18
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
}


