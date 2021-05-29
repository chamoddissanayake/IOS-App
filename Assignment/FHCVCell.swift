//
//  FHCVCell.swift
//  Assignment
//
//  Created by user173744 on 5/17/21.
//  Copyright © 2021 it18120844. All rights reserved.
//

import UIKit

extension UIImageView {
    func downloadFrom3(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
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
    func downloadFrom3(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadFrom3(from: url, contentMode: mode)
    }
}


class FHCVCell: UICollectionViewCell {
    @IBOutlet weak var fhcvImageView: UIImageView!
    @IBOutlet weak var fhcvTitle: UILabel!
    @IBOutlet weak var fhcvPrice: UILabel!
    @IBOutlet weak var fhcvAddToCart: UIButton!
    
       func setup(with firstItem: FirstItem){
               
                fhcvTitle.text = firstItem.title
                fhcvPrice.text = firstItem.price
                fhcvImageView.downloadFrom3(from:firstItem.image)
               
           }
    

    
}
