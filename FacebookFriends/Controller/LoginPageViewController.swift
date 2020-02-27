//
//  ViewController.swift
//  FacebookFriends
//
//  Created by Muhammet Taha Genç on 25.02.2020.
//  Copyright © 2020 Muhammet Taha Genç. All rights reserved.
//

import UIKit

class LoginPageViewController: UIViewController {

    //MARK: - Variables and Constants
    var FriendsArray : [Friend]? = nil
    let userNames = ["9nd54","v542w","17pcy0","gbf48","zdah4"]
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        blurEffect()
        self.hideKeyboardWhenTappedAround()
    }
    
    //MARK: - IBOutlets and Actions
        @IBOutlet weak var userNameTextField: UITextField!
        
        @IBOutlet weak var passwordTextField: UITextField!
        
        @IBOutlet weak var backgroundImage: UIImageView!
        
        @IBAction func loginBtnPressed(_ sender: UIButton) {
            
            if userNameTextField.text == "" || passwordTextField.text == "" {
                //Checking if username or password is empty
                alert(alertTitle: "Empty username or password!", actionTitle: "Ok")
            } else {
                getData(url: "https://api.myjson.com/bins/\(userNameTextField.text!)")
            }
        }
    
    //MARK: - Navigation Preparation Functions
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            //Before the segue gets triggered, some preparations needs to be done.
            let destinationVC = segue.destination as! FriendsTableViewController
            
            //Sending the to the destination view controller aka FriendsTableViewController
            destinationVC.friendsArray = FriendsArray
            
        }
    
    //MARK: - Functions
    func alert(alertTitle:String, actionTitle:String ) {
        //Will be triggered when the username or password is empty
        
        let alert = UIAlertController(title: alertTitle, message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: actionTitle, style: .default) { (action) in
            //The action when Ok button pressed will be here
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    func blurEffect() {
        //This function is created for aesthetic purposes. It supposed blur the launch screen background image.
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = backgroundImage.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        backgroundImage.addSubview(blurEffectView)
    }    
    func getData (url:String) {
        //This public function is created  in webservices swift file.
        
        //When the url is given, the function takes the url and use it for fetching the data. There are 3 main cases created with enum.
        WebServices().get(url) { (type, model: [Friend]?) in
            switch type {
            case .Succeed :
                self.FriendsArray = model
                self.performSegue(withIdentifier: "login", sender: self)
            case .Failed : print("Error Failed")
                self.alert(alertTitle: "Check the Internet Connection", actionTitle: "Ok")
            case .FailedDecode : print("Error FailedDecode")
                self.alert(alertTitle: "Check Username or Password", actionTitle: "Ok")
            default : break
            }
        }
    }

}

