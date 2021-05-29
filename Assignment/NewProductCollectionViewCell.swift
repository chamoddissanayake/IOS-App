//
//  NewProductCollectionViewCell.swift
//  Assignment
//

import UIKit

class NewProductCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var newProductImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var addToCartBtn: UIButton!


    func setup(with newProduct: NewProduct){
          newProductImageView.image = newProduct.image
          titleLbl.text = newProduct.title
          priceLbl.text = newProduct.price
          
      }
    
}
