//
//  CatalogViewController.swift
//  SneakersStoreApp
//
//  Created by Meyram on 01.06.2023.
//

import UIKit

class CatalogViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    let productCards = ["Dolce", "Off-white", "Nike brown", "Nike gray", "NewBalance"]
    
    var collectionView: UICollectionView!
    var viewModel = CatalogViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "TxtFieldBackgroundColor")
        setupNavBar()
        setupCatalogCollectionView()
        let products = viewModel.getProducts()
        
    }
    
    func setupNavBar() {
        title = "Catalog"
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    func setupCatalogCollectionView() {
        
        let collectionViewLayout = UICollectionViewFlowLayout()
        
        //Spacing between cells does not work!!!
//        collectionViewLayout.sectionInset = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
//        collectionViewLayout.minimumLineSpacing = 16
//        collectionViewLayout.minimumInteritemSpacing = 10
//        self.collectionView?.collectionViewLayout = collectionViewLayout
        
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 4, height: 0), collectionViewLayout: collectionViewLayout) // it was frame: .zero - from tutorial
        view.addSubview(collectionView)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(CustomCatalogCell.self, forCellWithReuseIdentifier: "cell") // xui znaet chto eto
        
        setupCVContstraints()
    }
    
    // here u put your constraints
    func setupCVContstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 98),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16)
        ])
    }
    // number of cells on screen
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productCards.count
    }
    
    // cell instance and etc
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCatalogCell
        cell.productImageView.image = UIImage(named: productCards[indexPath.row])
        cell.productNameLabel.text = productCards[indexPath.row]
        return cell
    }
    // size of a cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 174, height: 282)
    }
    // ne rabotaet???
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    // ne rabotaet???
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    // when cell is pressed - create extra page with full description of a product and a button
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(productCards[indexPath.row], "is tapped")
        
    }
    
}

class CustomCatalogCell: UICollectionViewCell {
    let productImageView = UIImageView()
    let productNameLabel = UILabel()
    let addToCartButton = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        addSubview(productImageView)
        addSubview(productNameLabel)
        addSubview(addToCartButton)
        
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        productNameLabel.translatesAutoresizingMaskIntoConstraints = false
        addToCartButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: topAnchor),
            productImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            productImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
            productImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -116),
            
            productNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 168),
            productNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            productNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
            productNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -96),
            
            addToCartButton.topAnchor.constraint(equalTo: topAnchor, constant: 234),
            addToCartButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            addToCartButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
            addToCartButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12)
        ])
        
        productImageView.layer.cornerRadius = 4
        productImageView.layer.masksToBounds = true
        
        productNameLabel.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        productNameLabel.textAlignment = .left
        
        addToCartButton.setTitle("Add to cart", for: .normal)
        addToCartButton.backgroundColor = .black
        addToCartButton.setTitleColor(.white, for: .normal)
        addToCartButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        addToCartButton.layer.cornerRadius = 18
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //what???
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    //to scroll back
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
}


