//
//  UIViewController+ModalImageDelegate.swift
//  ModalImage
//
//  Created by Sofia on 02/12/2018.
//

import UIKit

extension UIViewController: ModalImageDelegate {
    public func showFullScreenImage(from imageView: UIImageView,
                                    animationDuration: Double = 0.25,
                                    backgroundColor: UIColor = .black,
                                    backgroundAlpha: CGFloat = 0.6,
                                    useNavbar: Bool = true,
                                    useTabbar: Bool = true) {
        guard let modalImageVC = ModalImageViewController.build(with: imageView,
                                                                animationDuration: animationDuration,
                                                                backgroundColor: backgroundColor,
                                                                blackLayerOpacity: backgroundAlpha,
                                                                useNavbar: useNavbar,
                                                                useTabbar: useTabbar) else { return }
        modalImageVC.modalPresentationStyle = .overFullScreen
        modalImageVC.delegate = self
        
        present(modalImageVC, animated: false)
    }
}
