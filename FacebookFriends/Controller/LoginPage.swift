//
//  ViewController.swift
//  FacebookFriends
//
//  Created by Muhammet Taha Genç on 25.02.2020.
//  Copyright © 2020 Muhammet Taha Genç. All rights reserved.
//

import UIKit

class LoginPageViewController: UIViewController {

    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
                performSegue(withIdentifier: "login", sender: self)
                print("notEmpty")
            }
            
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let destinationVC = segue.destination as! FriendsTableViewController
            destinationVC.username = userNameTextField.text
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

}

