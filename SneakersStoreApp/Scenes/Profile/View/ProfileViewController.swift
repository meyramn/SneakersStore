//
//  ProfileViewController.swift
//  SneakersStoreApp
//
//  Created by Meyram on 01.06.2023.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController {

    let listOfItems = ["Account Information", "Order History", "Shoe Size"]
    
    lazy var signOutButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Out", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        button.layer.cornerRadius = 28
        //signOutButton.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControl.Event#>
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "TxtFieldBackgroundColor")
        setupNavBar()
        setupUI()
    }
    
    private let profileTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.separatorStyle = .none
        tableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: ProfileTableViewCell.identifier)
        return tableView
    }()
    
    private let extraLinksTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.register(ExtraLinksTableViewCell.self, forCellReuseIdentifier: ExtraLinksTableViewCell.identifier)
        return tableView
    }()
    
    func setupNavBar() {
        title = "Profile"
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    func setupUI() {
        view.addSubview(signOutButton)
        
        signOutButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(54)
            make.bottom.equalToSuperview().offset(-23)
        }
        
        view.addSubview(profileTableView)
        
        profileTableView.delegate = self
        profileTableView.dataSource = self
        
        profileTableView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-458)
            make.top.equalToSuperview().offset(114)
        }
        
    }
}

//TODO: Add extra links tableView

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listOfItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.identifier, for: indexPath) as? ProfileTableViewCell else {
            fatalError("TableView could not dequeue a ProfileTableViewCell in ProfileViewController")
        }
        
        cell.textLabel?.text = listOfItems[indexPath.row]
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 68
    }
}
