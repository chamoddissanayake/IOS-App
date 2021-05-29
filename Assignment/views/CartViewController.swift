//

import UIKit

class CartViewController: UIViewController {

    
    @IBOutlet weak var cartImage: UIImageView!
    @IBOutlet weak var cartTitle: UILabel!
    @IBOutlet weak var cartQty: UILabel!
    @IBOutlet weak var cartPrice: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cartImage.image = #imageLiteral(resourceName: "iphone11")
        cartTitle.text = "Iphone X"
        cartQty.text = "2"
        cartPrice.text = "$1000"
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
