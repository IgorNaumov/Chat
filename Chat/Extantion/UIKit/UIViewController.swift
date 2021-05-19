//
//  UIViewController.swift
//  Chat
//
//  Created by nil on 19.05.2021.
//

import UIKit

extension UIViewController {
    
     func configure<T: SelfConfiguringCell, U: Hashable>(collectionView: UICollectionView, cellType: T.Type, with value: U, for indexPath: IndexPath) -> T {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseId, for: indexPath) as? T else {fatalError("Unable to dequeue \(cellType)") }
        cell.configure(with: value)
        return cell
    }
}
