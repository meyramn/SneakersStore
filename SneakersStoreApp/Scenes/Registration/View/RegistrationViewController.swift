//
//  RegistrationViewController.swift
//  SneakersStoreApp
//
//  Created by Meyram on 30.05.2023.
//

import UIKit
import SnapKit

class RegistrationViewController: UIViewController {
   
    lazy var usernameField: UITextField = {
        let field = UITextField(frame: CGRect(x: 16, y: 140, width: 358, height: 48))
        field.placeholder = "Username"
        field.backgroundColor = UIColor(named: "TxtFieldBackgroundColor")
        field.layer.cornerRadius = 4
        field.addPadding(.left(16))
        return field
    }()
    
    lazy var passwordField: UITextField = {
        let field = UITextField(frame: CGRect(x: 16, y: 204, width: 358, height: 48))
        field.placeholder = "Password"
        field.backgroundColor = UIColor(named: "TxtFieldBackgroundColor")
        field.layer.cornerRadius = 4
        field.addPadding(.left(16))
        return field
    }()
    
    lazy var repeatedPasswordField: UITextField = {
        let repPassword = UITextField(frame: CGRect(x: 16, y: 268, width: 358, height: 48))
        repPassword.placeholder = "Repeated Password"
        repPassword.backgroundColor = UIColor(named: "TxtFieldBackgroundColor")
        repPassword.addPadding(.left(16))
        return repPassword
    }()
    
    lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        button.layer.cornerRadius = 28
        button.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        setupNavBar()
    }
    
    func setupNavBar() {
        title = "New User"
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    
    func setupUI() {
        // NSLayoutConstraints for every UI element
        
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
        
        view.addSubview(signUpButton)
        signUpButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(54)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-16)
        }
    }
    
    @objc func signUpButtonTapped() {
        let signedUp = TabbarController()
        signedUp.modalPresentationStyle = .fullScreen
        present(signedUp, animated: true)
    }
    
    
}
