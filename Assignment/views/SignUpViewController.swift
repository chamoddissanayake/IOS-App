//
//  SignUpViewController.swift
//  Assignment
//
//  Created by user163815 on 5/4/21.
//  Copyright © 2021 it18120844. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var txt_fullname: UITextField!
    @IBOutlet weak var txt_email: UITextField!
    @IBOutlet weak var txt_password: UITextField!
    @IBOutlet weak var txt_con_password: UITextField!
    
    @IBOutlet weak var btn_sign_up: UIButton!
    
    @IBOutlet weak var btn_eye_password: UIButton!
    
    @IBOutlet weak var btn_eye_re_password: UIButton!
    
     var isHidden = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btn_sign_up.layer.cornerRadius = 25
        btn_eye_password.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        btn_eye_re_password.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func eye_password_pressed(_ sender: UIButton) {
        set_password_eye()
    }
    
    @IBAction func eye_repassword_pressed(_ sender: UIButton) {
        set_password_eye()
    }
    
    func set_password_eye(){
        if (isHidden == true){
                          btn_eye_password.setImage(UIImage(systemName: "eye"), for: .normal)
                           btn_eye_re_password.setImage(UIImage(systemName: "eye"), for: .normal)
                           txt_password.isSecureTextEntry = false
                           txt_con_password.isSecureTextEntry = false
                          isHidden = false
               }else{
                          btn_eye_password.setImage(UIImage(systemName: "eye.slash"), for: .normal)
                           btn_eye_re_password.setImage(UIImage(systemName: "eye.slash"), for: .normal)
                           txt_password.isSecureTextEntry = true
                           txt_con_password.isSecureTextEntry = true
                          isHidden = true
               }
    }
    
    
    struct TempJsonUser: Encodable, Decodable{
        let username: String
        let password: String
        let email: String
    }

    
    @IBAction func signUpPressed(_ sender: UIButton) {
        if (txt_password.text == "" || txt_email.text == "" || txt_fullname.text == "" || txt_con_password.text == ""){
            var dialogMessage = UIAlertController(title: "Error", message: "Please fill all fields", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            })
            dialogMessage.addAction(ok)
            self.present(dialogMessage, animated: true, completion: nil)
        }else if( txt_con_password.text != txt_password.text){
            var dialogMessage = UIAlertController(title: "Error", message: "Password  and confirm password does not match", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            })
            dialogMessage.addAction(ok)
            self.present(dialogMessage, animated: true, completion: nil)
        }else{
            
            let url = URL(string: "http://13.235.27.22:5000/users/")
                        guard let requestUrl = url else { fatalError() }
                        var request = URLRequest(url: requestUrl)
                        request.httpMethod = "POST"
                        // Set HTTP Request Header
                        request.setValue("application/json", forHTTPHeaderField: "Accept")
                        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            let newUserItem = TempJsonUser(username: txt_fullname.text!, password: txt_password.text!, email: txt_email.text!)
                        var jsonData:Data;
                        do{
                            jsonData = try JSONEncoder().encode(newUserItem)
                            print(jsonData)
                        }catch let jsonErr{
                            return
                        }
                        
                       
                        request.httpBody = jsonData
                            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in

                                if let error = error {
                                    print("Error took place \(error)")
                                    DispatchQueue.main.async {
                                        // UI work here

                                    }
                                    return
                                }
                                if let httpResponse = response as? HTTPURLResponse {
                                    
                                    
                                    if (httpResponse.statusCode == 200){
                                        DispatchQueue.main.async {
                                            // UI work here
                                            var dialogMessage = UIAlertController(title: "Success", message: "Your account created successfuly. Please Login now.", preferredStyle: .alert)
                                            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                                            })
                                            dialogMessage.addAction(ok)
                                            self.present(dialogMessage, animated: true, completion: nil)
                                        }
                                    }else{
                                        DispatchQueue.main.async {
                                            var dialogMessage = UIAlertController(title: "Error", message: "User already exists.", preferredStyle: .alert)
                                            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                                                                                                               })
                                            dialogMessage.addAction(ok)
                                            self.present(dialogMessage, animated: true, completion: nil)// UI work here
                                        }
                                    }
                                    
                                    
                                }
                        }
                        task.resume()
                       
            
            
        }
    }
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


extension SignUpViewController{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

