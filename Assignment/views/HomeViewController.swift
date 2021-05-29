//
//  HomeViewController.swift
//  Assignment
//
//  Created by user163815 on 5/9/21.
//  Copyright © 2021 it18120844. All rights reserved.
//

import UIKit

struct FirstItem:Decodable{
    let title: String
    let price: String
    let image: String
}

struct SecondItem:Decodable{
    let title: String
    let price: String
    let image: String
}

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    
    var FirstItemArr = [FirstItem]()
    var SecondItemArr = [SecondItem]()
    
    @IBOutlet weak var cv1: UICollectionView!
    @IBOutlet weak var cv2: UICollectionView!
    
    override func viewDidLoad() {
     super.viewDidLoad()
     
        cv1.delegate = self
        cv1.dataSource = self
        
        cv2.delegate = self
        cv2.dataSource = self
        
        let url = URL(string: "http://13.235.27.22:5000/products/featured")
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil{
                do{
                    self.FirstItemArr = try JSONDecoder().decode([FirstItem].self, from: data!)
                }catch{
                    print("Parse Error")
                }
                DispatchQueue.main.async {
                    self.cv1.reloadData()
                }
            }
        }.resume()
        
        let url2 = URL(string: "http://13.235.27.22:5000/products/new")
        
        URLSession.shared.dataTask(with: url2!) { (data, response, error) in
            if error == nil{
                do{
                    self.SecondItemArr = try JSONDecoder().decode([SecondItem].self, from: data!)
                }catch{
                    print("Parse Error")
                }
                DispatchQueue.main.async {
                    
                    self.cv2.reloadData()
                }
            }
        }.resume()
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.cv1{
            return FirstItemArr.count;
        }else{
            return SecondItemArr.count;
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.cv1{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FHCVCell", for: indexPath) as! FHCVCell
            cell.setup(with: FirstItemArr[indexPath.row])
                return cell
        }else{
            print("hhhh")
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NHCVCell", for: indexPath) as! NHCVCell
                       cell.setup(with: SecondItemArr[indexPath.row])
                           return cell
        }
       
    
    }
    
    
    
    

    @IBOutlet weak var btnViewAllFeatured: UIButton!
    @IBOutlet weak var btnViewAllNew: UIButton!
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let btn_temp : UIButton = sender as! UIButton
        
        switch btn_temp {
            case btnViewAllFeatured:
                let vc = segue.destination as? FeaturedProductsViewController
                vc?.screenTitle = "All Featured Products"
            case btnViewAllNew:
                let vc = segue.destination as? FeaturedProductsViewController
                vc?.screenTitle = "All New Products"
            default:
                let vc = segue.destination as? FeaturedProductsViewController
                vc?.screenTitle = "All New Products"
    }
        
    }
    

}
