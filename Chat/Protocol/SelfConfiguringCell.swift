//
//  SelfConfiguringCell.swift
//  Chat
//
//  Created by nil on 18.05.2021.
//

import UIKit


protocol SelfConfiguringCell {
    static var reuseId: String { get }
    func configure<U: Hashable >(with value: U)
}
