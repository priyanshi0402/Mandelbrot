//
//  AutoZoomInViewController.swift
//  Mandelbrot
//
//  Created by Priyanshi Bhikadiya 2 on 21/12/23.
//

import UIKit

class AutoZoomInViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupAutoScroll()
    }

}

// MARK: - Private methods

extension AutoZoomInViewController {
    
    private func setupAutoScroll() {
        let images = MandelbrotManager.shared.getImagesFromGif() 
        imageView.animationImages = images
        imageView.animationDuration = Double(images.count) * 0.1 // Adjust the duration as needed
        imageView.startAnimating()
    }
}
