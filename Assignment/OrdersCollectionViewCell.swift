//
//  OrdersCollectionViewCell.swift
//  Assignment
//
//  Created by user173744 on 5/17/21.
//  Copyright © 2021 it18120844. All rights reserved.
//

import UIKit

extension UIImageView {
    func downloadFrom1(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
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
    func downloadFrom1(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadFrom(from: url, contentMode: mode)
    }
}


class OrdersCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var orderImageView: UIImageView!
    @IBOutlet weak var orderTitle: UILabel!
    @IBOutlet weak var orderPrice: UILabel!
    @IBOutlet weak var orderDate: UILabel!
    
    func setup(with myProduct: MyOrders){
        
        orderTitle.text = myProduct.title
        orderPrice.text = myProduct.price
        orderDate.text = myProduct.orderedDate
        orderImageView.downloadFrom1(from:myProduct.image)
        
    }
}
