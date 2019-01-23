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
                                    background: Background = Background(),
                                    useNavbar: Bool = true,
                                    useTabbar: Bool = true) {
        showImage(from: imageView,
                  animationDuration: animationDuration,
                  background: background,
                  useNavbar: useNavbar,
                  useTabbar: useTabbar)
    }
    
    public func showFullScreenImageWithBlur(from imageView: UIImageView,
                                            animationDuration: Double = 0.25,
                                            backgroundColor: UIColor,
                                            backgroundAlpha: CGFloat) {
        showImage(from: imageView,
                  animationDuration: animationDuration,
                  background: Background(color: backgroundColor,
                                         alpha: backgroundAlpha,
                                         blur: true),
                  useNavbar: false,
                  useTabbar: false)
    }
    
    private func showImage(from imageView: UIImageView,
                           animationDuration: Double = 0.25,
                           background: Background = Background(),
                           useNavbar: Bool = true,
                           useTabbar: Bool = true) {
        guard let modalImageVC = ModalImageViewController.build(with: imageView,
                                                                animationDuration: animationDuration,
                                                                background: background,
                                                                useNavbar: useNavbar,
                                                                useTabbar: useTabbar) else { return }
        modalImageVC.modalPresentationStyle = .overFullScreen
        modalImageVC.delegate = self
        
        present(modalImageVC, animated: false)
    }
}
