//
//  ChatRequestViewController.swift
//  Chat
//
//  Created by nil on 19.05.2021.
//

import UIKit


class ChatRequestViewController: UIViewController {
    
    let containerView = UIView()
    
    let imageView = UIImageView(image: #imageLiteral(resourceName: "human10"), contentMode: .scaleAspectFill)
    let nameLabel = UILabel(text: "Petr Big", font: .systemFont(ofSize: 20, weight: .light))
    let aboutMeLabel = UILabel(text: "You have the best men in the world", font: .systemFont(ofSize: 16, weight: .light))
    let acceptButton = UIButton(title: "Accept", titleColor: .white, backgroundColor: .black, font: .laoSangamMN20(), isShadow: false, cornerRadius: 10)
    let denyButton = UIButton(title: "Deny", titleColor: #colorLiteral(red: 0.8352941176, green: 0.2, blue: 0.2, alpha: 1), backgroundColor: .mainWhite(), font: .laoSangamMN20(), isShadow: false, cornerRadius: 10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupConstraints()
        customizeElement()
    }
    private func customizeElement() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        aboutMeLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .mainWhite()
        containerView.layer.cornerRadius = 30
        
        denyButton.layer.borderWidth = 1.2
        denyButton.layer.borderColor = #colorLiteral(red: 0.8352941176, green: 0.2, blue: 0.2, alpha: 1)
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.acceptButton.applyGradients(cornerRadius: 10)
    }
}
extension ChatRequestViewController {
    
    private func setupConstraints() {
        view.addSubview(imageView)
        view.addSubview(containerView)

        containerView.addSubview(nameLabel)
        containerView.addSubview(aboutMeLabel)
        let buttonsStacView = UIStackView(arrangedSubviews: [acceptButton, denyButton], axis: .horizontal, spacing: 7)
        buttonsStacView.translatesAutoresizingMaskIntoConstraints = false
        buttonsStacView.distribution = .fillEqually
       containerView.addSubview(buttonsStacView)

      
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: containerView.topAnchor, constant: 30)
        ])
        
        NSLayoutConstraint.activate([
            containerView.bottomAnchor .constraint(equalTo: view.bottomAnchor),
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
            buttonsStacView.topAnchor.constraint(equalTo: aboutMeLabel.bottomAnchor, constant: 24),
            buttonsStacView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 24),
            buttonsStacView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
            buttonsStacView.heightAnchor.constraint(equalToConstant: 56)
              ])
    }
}

//MARK: - SWIFT UI

import SwiftUI

struct ChatRequestVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
        
    }
    struct ContainerView: UIViewControllerRepresentable {
        let ChatRequestVC = ChatRequestViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<ChatRequestVCProvider.ContainerView>) -> ChatRequestViewController {
            return ChatRequestVC
        }
        func updateUIViewController(_ uiViewController: ChatRequestVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<ChatRequestVCProvider.ContainerView>) {
            
        }
        
    }
    
}
