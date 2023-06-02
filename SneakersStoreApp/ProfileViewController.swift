//
//  ProfileViewController.swift
//  SneakersStoreApp
//
//  Created by Meyram on 01.06.2023.
//

import UIKit

class ProfileViewController: UIViewController {

    let listOfItems = ["Account Information", "Order History", "Shoe Size"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "TxtFieldBackgroundColor")
        setupProfileLabel()
        setupProfileSignOutButton()
        setupTableView()
    }
    
    func setupProfileLabel() {
        let topLabel = UILabel(frame: CGRect(x: 155, y: 56, width: 70, height: 22))
        topLabel.text = "Profile"
        topLabel.textAlignment = .center
        topLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        topLabel.textColor = .black
        view.addSubview(topLabel)
    }
    
    func setupProfileSignOutButton() {
        let signOutButton = UIButton(frame: CGRect(x: 15, y: 693, width: 358, height: 54))
        signOutButton.setTitle("Sign Out", for: .normal)
        signOutButton.backgroundColor = .black
        signOutButton.setTitleColor(.white, for: .normal)
        signOutButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        signOutButton.layer.cornerRadius = 28
        //signOutButton.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
        view.addSubview(signOutButton)
    }
    
    private let profileTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.allowsSelection = true
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        return tableView
    }()
    
    func setupTableView() {
        view.addSubview(profileTableView)
        
        profileTableView.delegate = self
        profileTableView.dataSource = self
        
        profileTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 114),
            profileTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listOfItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else {
            fatalError("TableView could not dequeue a CustomCell in ProfileViewController")
        }
        
        cell.textLabel?.text = listOfItems[indexPath.row]
        
        
        
        return cell
    }
    
    //Spacing and height
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let cellSpacing = CGFloat(16)
//        let cellHeight = CGFloat(52)
//
//        return cellSpacing + cellHeight
//    }
}
