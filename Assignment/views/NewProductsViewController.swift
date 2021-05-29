//
//  NewProductsViewController.swift
//  Assignment
//


import UIKit

class NewProductsViewController: UIViewController,UICollectionViewDelegate {

    @IBOutlet weak var newProductCollectionView: UICollectionView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet var collection:UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newProductCollectionView.dataSource = self
        newProductCollectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }
    
    
  

}


extension NewProductsViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newProducts.count
    }
    
   
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewProductCollectionViewCell", for: indexPath) as! NewProductCollectionViewCell
        cell.setup(with: newProducts[indexPath.row])
        return cell
    }
}


extension NewProductsViewController: UICollectionViewDelegateFlowLayout{
//    @IBOutlet var collection:UICollectionView!
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {


        let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout
        let space: CGFloat = (flowLayout?.minimumInteritemSpacing ?? 0.0) + (flowLayout?.sectionInset.left ?? 0.0) + (flowLayout?.sectionInset.right ?? 0.0)
        let size:CGFloat = (collectionView.frame.size.width - space) / 2.0
        return CGSize(width: size, height: size*1.5)

//        return CGSize(width: 170, height: 250)
    }
}

