//
//  AuthorizationViewController.swift
//  SneakersStoreApp
//
//  Created by Meyram on 30.05.2023.
//

import UIKit

class AuthorizatiomViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupTopLabel()
        setupTextfileds()
        setupSignInButton()
    }
    
    func setupTopLabel() {
        let topLabel = UILabel(frame: CGRect(x: 130, y: 56, width: 130, height: 22))
        topLabel.text = "Welcome back!"
        topLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold) // check on figma
        topLabel.textAlignment = .center
        topLabel.textColor = .black
        view.addSubview(topLabel)
    }
    
    func setupTextfileds() {
        let usernameInput = UITextField(frame: CGRect(x: 16, y: 140, width: 358, height: 48))
        usernameInput.placeholder = "Username"
        usernameInput.backgroundColor = UIColor(named: "TxtFieldBackgroundColor")
        usernameInput.layer.cornerRadius = 4
        usernameInput.addPadding(.left(16))
        
        view.addSubview(usernameInput)
        
        let passwordInput = UITextField(frame: CGRect(x: 16, y: 204, width: 358, height: 48))
        passwordInput.placeholder = "Password"
        passwordInput.backgroundColor = UIColor(named: "TxtFieldBackgroundColor")
        passwordInput.layer.cornerRadius = 4
        passwordInput.addPadding(.left(16))
        
        view.addSubview(passwordInput)
    }
    
    func setupSignInButton() {
        let signInButton = UIButton(frame: CGRect(x: 15, y: 732, width: 358, height: 54))
        signInButton.setTitle("Sign Up", for: .normal)
        signInButton.backgroundColor = .black
        signInButton.setTitleColor(.white, for: .normal)
        signInButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        signInButton.layer.cornerRadius = 28
        signInButton.addTarget(self, action: #selector(signInButtonPressed), for: .touchUpInside)
        
        view.addSubview(signInButton)
    }
    
    @objc func signInButtonPressed() {
        return
    }
}
