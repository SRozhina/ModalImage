//
//  ModalImageDelegate.swift
//  ModalImage
//
//  Created by Sofia on 25/11/2018.
//

import UIKit

public protocol ModalImageDelegate: class {
    var tabBarImage: UIImage? { get }
    var navBarImage: UIImage? { get }
}

extension ModalImageDelegate where Self: UIViewController {
    public var tabBarImage: UIImage? {
        return tabBarController?.tabBar.layer.screenShot
    }
    
    public var navBarImage: UIImage? {
        return UIDevice.current.userInterfaceIdiom != .pad
            ? navigationController?.navigationBar.layer.screenShot
            : nil
    }
}
