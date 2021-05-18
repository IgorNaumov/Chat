//
//  SelfConfiguringCell.swift
//  Chat
//
//  Created by nil on 18.05.2021.
//

import Foundation


protocol SelfConfiguringCell {
    static var reuseId: String { get }
    func configure(with value: Mchat)
}
