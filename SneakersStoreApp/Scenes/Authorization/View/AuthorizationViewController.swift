//
//  AuthorizationViewController.swift
//  SneakersStoreApp
//
//  Created by Meyram on 30.05.2023.
//

import UIKit
import SnapKit

class AuthorizationViewController: UIViewController {
    
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
    
    lazy var signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        button.layer.cornerRadius = 28
        button.addTarget(self, action: #selector(signInButtonPressed), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupUI()
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
        
        view.addSubview(signInButton)
        
        signInButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(54)
            make.bottom.equalToSuperview().offset(-58)
        }
    }
    
    @objc func signInButtonPressed() {
        return
    }
}
