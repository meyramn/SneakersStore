//
//  WelcomePageViewController.swift
//  SneakersStoreApp
//
//  Created by Meyram on 30.05.2023.
//

import UIKit

class WelcomePageViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupWelcomeBackground()
        setupWelcomeLabel()
        setupAuthButtons()
    }
    
    func setupWelcomeBackground() {
        let backgroundImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 390, height: 560))
        backgroundImage.image = UIImage(named: "Image")
        view.addSubview(backgroundImage)
    }
    
    func setupWelcomeLabel() {
        let welcomeLabel = UILabel(frame: CGRect(x: 16, y: 578 , width: 358, height: 68))
        welcomeLabel.text = "Welcome to the biggest sneakers store app"
        welcomeLabel.textColor = .black
        welcomeLabel.textAlignment = .center
        welcomeLabel.font = UIFont.boldSystemFont(ofSize: 28)
        welcomeLabel.numberOfLines = 0
        view.addSubview(welcomeLabel)
    }
    
    func setupAuthButtons() {
        
        let signUpButton = UIButton(frame: CGRect(x: 15, y: 670, width: 358, height: 54))
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.setTitleColor(.white, for: .normal)
        signUpButton.backgroundColor = .black
        signUpButton.layer.cornerRadius = 28
        signUpButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        signUpButton.addTarget(self, action: #selector(signUpButtonPressed), for: .touchUpInside)
        view.addSubview(signUpButton)
        
        let haveAnAccountButton = UIButton(frame: CGRect(x: 16, y: 732, width: 358, height: 54))
        haveAnAccountButton.setTitle("I already have an account", for: .normal)
        haveAnAccountButton.setTitleColor(.black, for: .normal)
        haveAnAccountButton.backgroundColor = .white
        haveAnAccountButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        haveAnAccountButton.addTarget(self, action: #selector(haveAnAccountButtonPressed), for: .touchUpInside)
        view.addSubview(haveAnAccountButton)
    }
    
    @objc func signUpButtonPressed() {
        
        return
    }
    
    @objc func haveAnAccountButtonPressed() {
        return
    }
}
