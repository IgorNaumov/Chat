//
//  LoginViewController.swift
//  Chat
//
//  Created by nil on 11.05.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    
    import SwiftUI
    
    struct LoginVCProvider: PreviewProvider {
        static var previews: some View {
            ContainerView().edgesIgnoringSafeArea(.all)
            
        }
        struct ContainerView: UIViewControllerRepresentable {
            let LoginUpVC = LoginViewController()
            
            func makeUIViewController(context: UIViewControllerRepresentableContext<LoginVCProvider.ContainerView>) -> LoginViewController {
                return LoginUpVC
            }
            func updateUIViewController(_ uiViewController: LoginVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<LoginVCProvider.ContainerView>) {
                
            }
            
        }
        
    }
}
