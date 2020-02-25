//
//  ViewController.swift
//  FacebookFriends
//
//  Created by Muhammet Taha Genç on 25.02.2020.
//  Copyright © 2020 Muhammet Taha Genç. All rights reserved.
//

import UIKit

class LoginPageViewController: UIViewController {

    var FriendsArray : [Friend]? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        userNameTextField.text = "zdah4"
        passwordTextField.text = "hebele"
        blurEffect()
        
    }
    
        @IBOutlet weak var userNameTextField: UITextField!
        
        @IBOutlet weak var passwordTextField: UITextField!
        
        @IBOutlet weak var backgroundImage: UIImageView!
        
        @IBAction func loginBtnPressed(_ sender: UIButton) {
            if userNameTextField.text == "" || passwordTextField.text == "" {
                alert()
                print("Empty")
            } else {
                
                login(url: "https://api.myjson.com/bins/zdah4")
                print("notEmpty")
            }
            
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let destinationVC = segue.destination as! FriendsTableViewController
            destinationVC.friendsArray = FriendsArray
        }
    
    func alert() {
        let alert = UIAlertController(title: "Empty username or password!", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok", style: .default) { (action) in
            //what will happen when the user clicks the ADD Item button on our UIAlert
            print("Succes")
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    func blurEffect() {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = backgroundImage.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        backgroundImage.addSubview(blurEffectView)
    }    
    func login (url:String) {
        WebServices().get(url) { (type, model: [Friend]?) in
            switch type {
            case .Succeed :
                self.FriendsArray = model
                self.performSegue(withIdentifier: "login", sender: self)
            case .Failed : print("Error Failed")
            case .FailedDecode : print("Error FailedDecode")
            default : break
            }
        }
    }

}

