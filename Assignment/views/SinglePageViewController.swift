
import UIKit


extension UIImageView {
    func downloadFrom5(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
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
    func downloadFrom5(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadFrom(from: url, contentMode: mode)
    }
}


class SinglePageViewController: UIViewController {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    

    
    var productImage1:String = ""
    var productTitle1:String = ""
    var productPrice1:String = ""
    var productDescription1:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.productTitle.text = productTitle1
        self.productPrice.text = productPrice1
        self.productDescription.text = productDescription1
        self.productImage.downloadFrom5(from:productImage1)
        
        
    }
    

   

}
