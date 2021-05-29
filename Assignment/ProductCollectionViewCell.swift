//
//  ProductCollectionViewCell.swift
//  Assignment
//
//  Created by user163815 on 5/15/21.
//  Copyright © 2021 it18120844. All rights reserved.
//

import UIKit

extension UIImageView {
    func downloadFrom(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloadFrom(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadFrom(from: url, contentMode: mode)
    }
}

class ProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var addToCartBtn: UIButton!
    
    func setup(with product: Product2){
        
        titleLbl.text = product.title
        priceLbl.text = product.price
        productImageView.downloadFrom(from:product.image)
        
    }
    

}

