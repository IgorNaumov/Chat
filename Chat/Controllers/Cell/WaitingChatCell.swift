//
//  WaitingChatCell.swift
//  Chat
//
//  Created by nil on 18.05.2021.
//

import UIKit

class WaitingChatCell: UICollectionViewCell , SelfConfiguringCell{
    
    static var reuseId: String = "WaitingChatCell"
    
    let friendImageView = UIImageView()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        backgroundColor = .yellow
        self.layer.cornerRadius = 4
        self.clipsToBounds = true
        setupConnstraints()
    }
    func configure<U>(with value: U) where U : Hashable {
        guard let chat: Mchat = value as? Mchat else { return }
        friendImageView.image = UIImage(named: chat.userImageString)
    }
   
    private func setupConnstraints(){
        friendImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(friendImageView)
        
        NSLayoutConstraint.activate([
            friendImageView.topAnchor.constraint(equalTo: self.topAnchor),
            friendImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            friendImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            friendImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)

        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: - SWIFT UI

import SwiftUI

struct WaitingChatProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
        
    }
    struct ContainerView: UIViewControllerRepresentable {
        let tabBarVC = MainTabBarController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<WaitingChatProvider.ContainerView>) -> MainTabBarController {
            return tabBarVC
        }
        func updateUIViewController(_ uiViewController: WaitingChatProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<WaitingChatProvider.ContainerView>) {
            
        }
        
    }
    
}
