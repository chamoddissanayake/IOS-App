//
//  Product.swift
//  Assignment
//
//  Created by user163815 on 5/11/21.
//  Copyright © 2021 it18120844. All rights reserved.
//

import UIKit

struct Product {
    let title: String
    let description: String
    let price: String
    let image:UIImage
    
//    init?(json: [String: Any]) {
//        guard let name = json["name"] as? String,
//            let title = json["title"] as? String,
//            let description = json["description"] as? String,
//            let price = json["price"] as? String,
//            let image = json["image"] as? String
//        else {
//            return nil
//        }
//
//        var products: Set<Product> = []
//        for string in productsJSON {
//            guard let meal = Meal(rawValue: string) else {
//                return nil
//            }
//
//            meals.insert(meal)
//        }
//
//        self.name = name
//        self.coordinates = (latitude, longitude)
//        self.meals = meals
//    }
//
//
    
    
}

let products: [Product] = [
    Product(title: "Iphone X1", description: "New Iphone", price: "$1000", image: #imageLiteral(resourceName: "iphone11")),
    Product(title: "Iphone X2", description: "New Iphone", price: "$2000", image: #imageLiteral(resourceName: "iphone11")),
    Product(title: "Iphone X3", description: "New Iphone", price: "$3000", image: #imageLiteral(resourceName: "iphone11")),
    Product(title: "Iphone X4", description: "New Iphone", price: "$4000", image: #imageLiteral(resourceName: "iphone11")),
    Product(title: "Iphone X5", description: "New Iphone", price: "$5000", image: #imageLiteral(resourceName: "iphone11")),
    Product(title: "Iphone X6", description: "New Iphone", price: "$6000", image: #imageLiteral(resourceName: "iphone11")),
    Product(title: "Iphone X7", description: "New Iphone", price: "$7000", image: #imageLiteral(resourceName: "iphone11")),
    Product(title: "Iphone X8", description: "New Iphone", price: "$8000", image: #imageLiteral(resourceName: "iphone11")),
    Product(title: "Iphone X9", description: "New Iphone", price: "$9000", image: #imageLiteral(resourceName: "iphone11"))
    
]







