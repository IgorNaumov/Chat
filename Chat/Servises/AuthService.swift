//
//  AuthService.swift
//  Chat
//
//  Created by nil on 20.05.2021.
//

import UIKit
import Firebase
import FirebaseAuth

class AuthService {

    static let shared = AuthService()
    private let auth = Auth.auth()
    
    func login(email: String?, password: String?, completion: @escaping (Result<User, Error>) -> Void) {
        auth.signIn(withEmail: email!, password: password!) { (result, error) in
            guard let result = result else {
                completion(.failure(error!))
                return
            }
            completion(.success(result.user))
        }
    }
    
    func register(email: String?, password:String?, confirmPassword: String?, completion: @escaping (Result<User, Error>) -> Void ) {
        auth.createUser(withEmail: email!, password: password!) {(result, error ) in
            guard let result = result else {
                completion(.failure(error!))
                return
            }
            completion(.success(result.user))
        }

    }
    
    
    }
