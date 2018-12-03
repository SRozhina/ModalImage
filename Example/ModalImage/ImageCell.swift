//
//  ImageCell.swift
//  ModalImage_Example
//
//  Created by Sofia on 03/12/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

class ImageCell: UITableViewCell {
    @IBOutlet private weak var cellImageView: UIImageView!
    private var imageTapAction: ((UIImageView) -> Void)?
    
    func setImage(_ image: UIImage) {
        cellImageView.image = image
    }
    
    func setTappedAction(_ action: @escaping (UIImageView) -> Void) {
        self.imageTapAction = action
        let imageTap = UITapGestureRecognizer(target: self, action: #selector(openImageAction))
        cellImageView.addGestureRecognizer(imageTap)
    }
    
    @objc
    private func openImageAction() {
        imageTapAction?(cellImageView)
    }
}
