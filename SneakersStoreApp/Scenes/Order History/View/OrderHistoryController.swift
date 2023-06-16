//
//  OrderHistoryController.swift
//  SneakersStoreApp
//
//  Created by Meyram on 09.06.2023.
//

import UIKit
import SnapKit

class OrderHistoryController: UIViewController {
    
    let orders = [OrderModel(id: "NewBalance", date: "25.06.2023", price: "$250", quantity: 1, imageURLs: "NewBalance"),
                  OrderModel(id: "Nike gray", date: "25.06.2023", price: "$250", quantity: 1, imageURLs: "Nike gray"),
                  OrderModel(id: "Nike brown", date: "25.06.2023", price: "$250", quantity: 1, imageURLs: "Nike brown")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "TxtFieldBackgroundColor")
        setupUI()
    }
    
    private let ordersTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(named: "TxtFieldBackgroundColor")
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        return tableView
    }()
    
    func setupUI() {
        ordersTableView.delegate = self
        ordersTableView.dataSource = self
        
        view.addSubview(ordersTableView)
        ordersTableView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalToSuperview().offset(104)
            make.height.equalTo(740)
        }
        
    }
    
}

extension OrderHistoryController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else {
            fatalError("TableView could not dequeue a CustomCell in ProfileViewController")
        }
        
        let order = self.orders[indexPath.row]
        cell.configure(order: order)
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 116
    }
}
