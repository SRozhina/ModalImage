//
//  UIViewController+ModalImageDelegate.swift
//  ModalImage
//
//  Created by Sofia on 02/12/2018.
//

import UIKit

extension UIViewController: ModalImageDelegate {
    //TODO backgroundColor?
    public func showFullScreenImage(from imageView: UIImageView, animationDuration: Double = 0.25, backgroundAlpha: CGFloat = 0.6) {
        guard let modalImageVC = ModalImageViewController.build(with: imageView,
                                                                animationDuration: animationDuration,
                                                                blackLayerOpacity: backgroundAlpha) else { return }
        modalImageVC.modalPresentationStyle = .overFullScreen
        modalImageVC.delegate = self
        
        present(modalImageVC, animated: false)
    }
}
