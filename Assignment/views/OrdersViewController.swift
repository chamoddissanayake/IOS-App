//
//  OrdersViewController.swift
//  Assignment
//
//  Created by user173744 on 5/17/21.
//  Copyright © 2021 it18120844. All rights reserved.
//

import UIKit

struct MyOrders: Decodable{
    let title: String
    let price: String
    let image: String
    let orderedDate: String
}

class OrdersViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    var myOrders = [MyOrders]()
       
    @IBOutlet weak var orderCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

            let url = URL(string: "http://13.235.27.22:5000/orders")
            
            URLSession.shared.dataTask(with: url!) { (data, response, error) in
                if error == nil{
                    do{
                        self.myOrders = try JSONDecoder().decode([MyOrders].self, from: data!)
                    }catch{
                        print("Parse Error")
                    }
                    DispatchQueue.main.async {
                        self.orderCollectionView.reloadData()
                    }
                }
            }.resume()
           // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myOrders.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OrdersCollectionViewCell", for: indexPath) as! OrdersCollectionViewCell
//        cell.orderImageView.image = myOrders[indexPath.row].image
//        cell.orderTitle.text = myOrders[indexPath.row].title
//        cell.orderPrice.text = myOrders[indexPath.row].price
//        cell.orderDate.text = myOrders[indexPath.row].orderedDate
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OrdersCollectionViewCell", for: indexPath) as! OrdersCollectionViewCell
        cell.setup(with: myOrders[indexPath.row])
        
        return cell
    }
    
    
    
   
    

   

}
