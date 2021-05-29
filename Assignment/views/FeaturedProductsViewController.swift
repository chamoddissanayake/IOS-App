//
//  FeaturedProductsViewController.swift
//  Assignment
//
//  Created by user163815 on 5/5/21.
//  Copyright © 2021 it18120844. All rights reserved.
//

import UIKit

struct Product2: Decodable{
    let title: String
    let price: String
    let image: String
}



class FeaturedProductsViewController: UIViewController, UICollectionViewDelegate {
    
     var screenTitle:String = ""
    
//    , UICollectionViewFlowLayout

    @IBOutlet weak var productCollectionView: UICollectionView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet var collection:UICollectionView!
    
    var products = [Product2]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = screenTitle
       productCollectionView.dataSource = self
       productCollectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
        var url = URL(string: "http://13.235.27.22:5000/products/featured")
        
        if(self.title == "All Featured Products"){
            url = URL(string: "http://13.235.27.22:5000/products/featured")
        }else if (self.title == "All New Products"){
            url = URL(string: "http://13.235.27.22:5000/products/new")
        }

       
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil{
                do{
                    self.products = try JSONDecoder().decode([Product2].self, from: data!)
                }catch{
                    print("Parse Error")
                }
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }.resume()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSingleView" {
            if let detailVC = segue.destination as? SinglePageViewController {
                if let paths = collectionView?.indexPathsForSelectedItems {
                    let row = paths[0].row
                    detailVC.productTitle1 = self.products[row].title
                    detailVC.productPrice1 = self.products[row].price
                    detailVC.productImage1 = self.products[row].image
                    detailVC.productDescription1 = "This is the new version"
                }
            }
        }
    }
}








extension FeaturedProductsViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
   
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as! ProductCollectionViewCell
        cell.setup(with: products[indexPath.row])
        return cell
    }
}

extension FeaturedProductsViewController: UICollectionViewDelegateFlowLayout{
//    @IBOutlet var collection:UICollectionView!
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {


        let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout
        let space: CGFloat = (flowLayout?.minimumInteritemSpacing ?? 0.0) + (flowLayout?.sectionInset.left ?? 0.0) + (flowLayout?.sectionInset.right ?? 0.0)
        let size:CGFloat = (collectionView.frame.size.width - space) / 2.0
        return CGSize(width: size, height: size*1.5)

//        return CGSize(width: 170, height: 250)
    }
}

