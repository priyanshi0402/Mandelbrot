//
//  ManualZoomViewController.swift
//  Mandelbrot
//
//  Created by Priyanshi Bhikadiya 2 on 21/12/23.
//

import UIKit

class ManualZoomViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - Variables
    
    var images: [UIImage] = []
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
        
    }
    
}

// MARK: - Private Methods

extension ManualZoomViewController {
    
    private func setupView() {
        
        images = MandelbrotManager.shared.getImagesFromGif()
        self.imageView.image = images[currentIndex]
        
        let pinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(handlePinchGesture(_:)))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(pinchGestureRecognizer)
        
    }
    
    private func zoomIn() {
        
        currentIndex = (currentIndex + 1) % images.count
        if currentIndex <= images.count { /// check currentIndex and array count to avoid crash and infinite zoom
            imageView.image = images[currentIndex]
            imageView.transform = CGAffineTransform.identity
        }
        
    }
    
    private func zoomOut() {
        
        currentIndex = (currentIndex - 1) % images.count
        
        if currentIndex < 0 { /// check currentIndex and array count to avoid crash
            currentIndex = 0
        } else {
            imageView.image = images[currentIndex]
            imageView.transform = CGAffineTransform.identity
        }
        
    }
}

// MARK: - observal methods and actions

extension ManualZoomViewController {
    
    @objc func handlePinchGesture(_ gestureRecognizer: UIPinchGestureRecognizer) {
        
        guard gestureRecognizer.state == .changed else { return }
        
        let scale = gestureRecognizer.scale
        if scale > 1.0 {
            zoomIn()
            // Pinch out (zoom in)
            print("Pinch out")
        } else {
            self.zoomOut()
            // Pinch in (zoom out)
            print("Pinch in")
        }
        
    }
}
