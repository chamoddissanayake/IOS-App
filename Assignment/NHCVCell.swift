

import UIKit


extension UIImageView {
    func downloadFrom4(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
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
    func downloadFrom4(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadFrom4(from: url, contentMode: mode)
    }
}
class NHCVCell: UICollectionViewCell {
 
    @IBOutlet weak var newProdImageView: UIImageView!
    @IBOutlet weak var newProdTitle: UILabel!
    @IBOutlet weak var newProdPrice: UILabel!
    
    
    func setup(with secondItem: SecondItem){
//        newProdImageView
        newProdTitle.text = secondItem.title
        newProdPrice.text = secondItem.price
        newProdImageView.downloadFrom4(from:secondItem.image)
    }
    
}
