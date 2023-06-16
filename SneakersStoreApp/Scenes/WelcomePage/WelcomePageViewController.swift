//
//  WelcomePageViewController.swift
//  SneakersStoreApp
//
//  Created by Meyram on 30.05.2023.
//

import UIKit
import SnapKit

class WelcomePageViewController: UIViewController {
  
    lazy var backgroundImage: UIImageView = {
        let background = UIImageView()
        background.image = UIImage(named: "Image")
        return background
    }()
    
    lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to the biggest sneakers store app"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 28
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        button.addTarget(self, action: #selector(signUpButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var haveAccountButton: UIButton = {
        let button = UIButton()
        button.setTitle("I already have an account", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        button.addTarget(self, action: #selector(haveAnAccountButtonPressed), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupUI()
    }
    
    func setupUI() {
        view.addSubview(backgroundImage)
        
        backgroundImage.snp.makeConstraints { make in 
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(560)
            make.bottom.equalToSuperview().offset(-284)
        }
        view.addSubview(welcomeLabel)
        
        welcomeLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(68)
            make.bottom.equalToSuperview().offset(-198)
        }
        view.addSubview(signUpButton)
        
        signUpButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(54)
            make.bottom.equalToSuperview().offset(-120)
        }
        
        view.addSubview(haveAccountButton)
        
        haveAccountButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(54)
            make.bottom.equalToSuperview().offset(-58)
        }
        
        
    }

    @objc func signUpButtonPressed() {
        print("NavigationController is", navigationController)
        navigationController?.pushViewController(RegistrationViewController(), animated: true)
    }
    
    @objc func haveAnAccountButtonPressed() {
        navigationController?.pushViewController(AuthorizationViewController(), animated: true)
    }
    
}



