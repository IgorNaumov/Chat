//
//  SignUpViewController.swift
//  Chat
//
//  Created by nil on 11.05.2021.
//

import UIKit


class SignUpViewController: UIViewController {
    
    let welcomeLabel = UILabel(text: "Good to see you!", font: .avenir26())
    
    
    let emailLabel = UILabel(text: "Email")
    let passwordLabel = UILabel(text: "Password")
    let confirmPasswordLabel = UILabel(text: "Confirm Password")
    let alreadyOnboardLabel = UILabel(text: "Already onboard?")
    
    let emailTextField = OneLineTextField(font: .avenir20())
    let passwordTextField = OneLineTextField(font: .avenir20())
    let confirmPasswordTextField = OneLineTextField(font: .avenir20())
    
    
    let signUpButton = UIButton(title: "Sign Up", titleColor: .white, backgroundColor: .buttonDark(), cornerRadius: 4)
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.buttonRed(), for: .normal)
        button.titleLabel?.font = .avenir20()
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupConstraints()
        signUpButton.addTarget(self, action: #selector(signUpTapped), for: .touchUpInside)
    }
    @objc private func signUpTapped() {
        print(#function)
        AuthService.shared.register(email: emailTextField.text, password: passwordTextField.text, confirmPassword: confirmPasswordTextField.text) { (result) in
            switch result {
            
            case .success(let user):
                self.showAlert(with: "Успешно", and: "Вы зарегистрированы")
            case .failure(let error):
                self.showAlert(with: "Nope", and: error.localizedDescription)
            }
        }
    }
}

extension SignUpViewController {
    private func setupConstraints() {
        let emailStackView = UIStackView(arrangedSubviews: [emailLabel, emailTextField], axis: .vertical, spacing: 0)
        let passwordStackView = UIStackView(arrangedSubviews: [passwordLabel, passwordTextField], axis: .vertical, spacing: 0)
        let confirmPasswordStackView = UIStackView(arrangedSubviews: [confirmPasswordLabel, confirmPasswordTextField], axis: .vertical, spacing: 0)
        
        signUpButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        let stackView = UIStackView(arrangedSubviews: [
            emailStackView,
            passwordStackView,
            confirmPasswordStackView,
            signUpButton
        ], axis: .vertical, spacing: 40)
        
        loginButton.contentHorizontalAlignment = .leading
        let bottomStackView = UIStackView(arrangedSubviews: [
            alreadyOnboardLabel,
            loginButton
        ], axis: .horizontal, spacing: 10)
        bottomStackView.alignment = .firstBaseline
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(welcomeLabel)
        view.addSubview(stackView)
        view.addSubview(bottomStackView)
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor,constant: 100),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
            
        ])
        NSLayoutConstraint.activate([
            bottomStackView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 60),
            bottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            bottomStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
    }
}

import SwiftUI

struct SignVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
        
    }
    struct ContainerView: UIViewControllerRepresentable {
        let SignUpVC = SignUpViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<SignVCProvider.ContainerView>) -> SignUpViewController {
            return SignUpVC
        }
        func updateUIViewController(_ uiViewController: SignVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<SignVCProvider.ContainerView>) {
            
        }
        
    }
    
}
extension UIViewController {
    func showAlert(with title: String, and message: String) {
        let allertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        allertController.addAction(okAction)
        present(allertController, animated: true, completion: nil)
    }
    
}
