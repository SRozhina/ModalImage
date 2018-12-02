//
//  ViewController.swift
//  ModalImage
//
//  Created by sofia.rozhina@gmail.com on 11/25/2018.
//  Copyright (c) 2018 sofia.rozhina@gmail.com. All rights reserved.
//

import UIKit
import ModalImage

class NavbarViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    private let images: [UIImage] = { Array(1...10).compactMap { UIImage(named: "kitten\($0)") } }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
    }
}

extension NavbarViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ImageCell.self),
                                                 for: indexPath) as! ImageCell
        let image = images[indexPath.row]
        cell.setImage(image)
        cell.setTappedAction(imageTappedAction)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let currentImage = images[indexPath.row]
        return tableView.frame.width / currentImage.cropRatio
    }
    
    func imageTappedAction(imageView: UIImageView) {
        showFullScreenImage(from: imageView)
    }
}

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

extension UIImage {
    var cropRatio: CGFloat { return self.size.width / self.size.height }
}


