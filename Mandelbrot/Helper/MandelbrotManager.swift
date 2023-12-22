//
//  Mandelbrot.swift
//  Mandelbrot
//
//  Created by Priyanshi Bhikadiya 2 on 21/12/23.
//

import Foundation
import UIKit

class MandelbrotManager {
    
    static var shared = MandelbrotManager()
    
    func getImagesFromGif() -> [UIImage] {
        if let gifURL = Bundle.main.url(forResource: "Mandelbrot_sequence", withExtension: "gif") {
            let imageSource = CGImageSourceCreateWithURL(gifURL as CFURL, nil)
            
            if let imageSource = imageSource {
                let frameCount = CGImageSourceGetCount(imageSource)
                
                var images: [UIImage] = []
                
                for i in 0..<frameCount {
                    if let cgImage = CGImageSourceCreateImageAtIndex(imageSource, i, nil) {
                        let uiImage = UIImage(cgImage: cgImage)
                        images.append(uiImage)
                    }
                }
                return images
                
            }
        }
        
        return []
        
    }
    
}
