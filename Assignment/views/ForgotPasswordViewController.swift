//
//  ForgotPasswordViewController.swift
//  Assignment
//
//  Created by user163815 on 5/4/21.
//  Copyright © 2021 it18120844. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var btn_send_reset_link: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        btn_send_reset_link.layer.cornerRadius = 25
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
