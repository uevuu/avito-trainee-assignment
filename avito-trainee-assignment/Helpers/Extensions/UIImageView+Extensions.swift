//
//  UIImageView+Extensions.swift
//  avito-trainee-assignment
//
//  Created by Nikita Marin on 30.08.2023.
//

import UIKit

extension UIImageView {
    private static let imageCache = NSCache<NSString, UIImage>()
    
    func loadImage(_ urlString: String) {
        image = nil
        if let imageFromCache = UIImageView.imageCache.object(forKey: urlString as NSString) {
            image = imageFromCache
            return
        }

        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(
            url: url,
            cachePolicy: .returnCacheDataElseLoad
        )
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, let newImage = UIImage(data: data) else { return }
            UIImageView.imageCache.setObject(newImage, forKey: urlString as NSString)
            DispatchQueue.main.async {
                self.image = newImage
            }
        }.resume()
    }
}
