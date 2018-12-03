//
//  ViewController.swift
//  ModalImage
//
//  Created by sofia.rozhina@gmail.com on 11/25/2018.
//  Copyright (c) 2018 sofia.rozhina@gmail.com. All rights reserved.
//

import UIKit
import ModalImage

class ImagesViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet weak var closeButtonHeight: NSLayoutConstraint!
    
    private let images: [UIImage] = { Array(1...10).compactMap { UIImage(named: "kitten\($0)") } }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupCloseButton()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
    }
    
    private func setupCloseButton() {
        closeButtonHeight.constant = navigationController == nil ? 30 : 0
    }
    
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

extension ImagesViewController: UITableViewDataSource, UITableViewDelegate {
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
        if navigationController != nil {
            showFullScreenImage(from: imageView)
        } else {
            showFullScreenImage(from: imageView, animationDuration: 0.5, backgroundColor: .darkGray, backgroundAlpha: 1)
        }
    }
}
