//
//  Bundle-Decodable.swift
//  Chat
//
//  Created by nil on 12.05.2021.
//

import UIKit


extension Bundle {
    func decode<T: Decodable>(_ type: T.Type, from file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed \(file) in boundle")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed load \(file) from boundle")
        }
        let decoder = JSONDecoder()
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from to boundle")
        }
        return loaded
    }
}
