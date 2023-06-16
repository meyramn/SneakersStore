//
//  PrrofileAccountInfo.swift
//  SneakersStoreApp
//
//  Created by Meyram on 09.06.2023.
//

import UIKit
import SnapKit

class AccountInfoController: UIViewController {
    
    lazy var usernameField: UITextField = {
        let field = UITextField()
        field.placeholder = "Username"
        field.backgroundColor = UIColor(named: "TxtFieldBackgroundColor")
        field.layer.cornerRadius = 4
        field.addPadding(.left(16))
        return field
    }()
    
    lazy var passwordField: UITextField = {
        let field = UITextField()
        field.placeholder = "Password"
        field.backgroundColor = UIColor(named: "TxtFieldBackgroundColor")
        field.layer.cornerRadius = 4
        field.addPadding(.left(16))
        return field
    }()
    
    lazy var repeatedPasswordField: UITextField = {
        let field = UITextField()
        field.placeholder = "Repeat Password"
        field.backgroundColor = UIColor(named: "TxtFieldBackgroundColor")
        field.layer.cornerRadius = 4
        field.addPadding(.left(16))
        return field
    }()
    
    lazy var saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save changes", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        button.layer.cornerRadius = 28
        //button.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavBar()
        setupUI()
    }
    
    func setupNavBar() {
        title = "Account Information"
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    func setupUI() {
        
        view.addSubview(usernameField)
        usernameField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(48)
            make.top.equalToSuperview().offset(140)
        }
        
        view.addSubview(passwordField)
        passwordField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(48)
            make.top.equalToSuperview().offset(204)
        }
        
        view.addSubview(repeatedPasswordField)
        repeatedPasswordField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(48)
            make.top.equalToSuperview().offset(268)
        }
        
        view.addSubview(saveButton)
        saveButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(54)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-16)
        }
            
    }
}
