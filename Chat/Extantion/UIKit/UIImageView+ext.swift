//
//  UIImageView+ext.swift
//  Chat
//
//  Created by nil on 11.05.2021.
//

import UIKit

extension UIImageView {
    convenience init(image: UIImage?, contentMode: UIView.ContentMode){
        self.init()
        
        self.image = image
        self.contentMode = contentMode
    }
}

