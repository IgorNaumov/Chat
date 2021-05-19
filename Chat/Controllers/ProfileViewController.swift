//
//  ProfileViewController.swift
//  Chat
//
//  Created by nil on 19.05.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let containerView = UIView()
    
    let imageView = UIImageView(image: #imageLiteral(resourceName: "human10"), contentMode: .scaleAspectFill)
    let nameLabel = UILabel(text: "Petr Big", font: .systemFont(ofSize: 20, weight: .light))
    let aboutMeLabel = UILabel(text: "You have the best men in the world", font: .systemFont(ofSize: 16, weight: .light))
    let myTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        constomizeElements()
        view.backgroundColor = .white
        
    }
    private func constomizeElements() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutMeLabel.translatesAutoresizingMaskIntoConstraints = false
        myTextField.translatesAutoresizingMaskIntoConstraints = false
        aboutMeLabel.numberOfLines = 0
        containerView.backgroundColor = .mainWhite()
        containerView.layer.cornerRadius = 30
        myTextField.borderStyle = .line
    }
    
}

extension ProfileViewController {
    
   private func setupConstraints() {
    view.addSubview(imageView)
    view.addSubview(containerView)
    containerView.addSubview(nameLabel)
    containerView.addSubview(aboutMeLabel)
    containerView.addSubview(myTextField)
    NSLayoutConstraint.activate([
        imageView.topAnchor.constraint(equalTo: view.topAnchor),
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        imageView.bottomAnchor.constraint(equalTo: containerView.topAnchor, constant: 30)
    
    ])
    
    NSLayoutConstraint.activate([
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        containerView.heightAnchor.constraint(equalToConstant: 206)
    
    ])
    NSLayoutConstraint.activate([
        nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 35),
        nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 24),
        nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24)
      
    
    ])
    
    NSLayoutConstraint.activate([
        aboutMeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
        aboutMeLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 24),
        aboutMeLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24)
          ])
    NSLayoutConstraint.activate([
        myTextField.topAnchor.constraint(equalTo: aboutMeLabel.bottomAnchor, constant: 8),
        myTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 24),
        myTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
        myTextField.heightAnchor.constraint(equalToConstant: 48)
          ])
    }
}





//MARK: - SWIFT UI

import SwiftUI

struct ProfileViewCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
        
    }
    struct ContainerView: UIViewControllerRepresentable {
        let profileVC = ProfileViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<ProfileViewCProvider.ContainerView>) -> ProfileViewController {
            return profileVC
        }
        func updateUIViewController(_ uiViewController: ProfileViewCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<ProfileViewCProvider.ContainerView>) {
            
        }
        
    }
    
}
