//
//  ViewController.swift
//  FacebookFriends
//
//  Created by Muhammet Taha Genç on 25.02.2020.
//  Copyright © 2020 Muhammet Taha Genç. All rights reserved.
//

import UIKit
import RealmSwift

class LoginPageViewController: UIViewController {

    //MARK: - Variables and Constants
    var friendsArray : [Friend]? = nil

    let realm = try! Realm()
    lazy var friends: Results<FriendObject> = { self.realm.objects(FriendObject.self) }()
    
    
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
            destinationVC.friendsArray = friendsArray
            
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
                self.friendsArray = model
                self.performSegue(withIdentifier: "login", sender: self)
            case .Failed : print("Error Failed")
                self.alert(alertTitle: "Check the Internet Connection", actionTitle: "Ok")
            case .FailedDecode : print("Error FailedDecode")
                self.alert(alertTitle: "Check Username or Password", actionTitle: "Ok")
            default : break
            }
        }
    }
    
    func populateDefaultCategories() {
        
        //I managed to save the objects to local via realm but when I try to login with another user, the files from the previous user still remain and I could not figure it out. I tried to delete the realm file for when new user logged in with below function that commented out but I couldn't figure it out due to lack of time so I decided no to use the Realm. My app still works offline before the logging in is complete.
        
      if friends.count == 0 { // 1
        try! realm.write() { // 2
          for friend in friendsArray! { // 4
            let newFriend = FriendObject()
            newFriend.about = friend.about!
            newFriend.address = friend.address!
            newFriend.age = friend.age!
            newFriend.company = friend.company!
            newFriend.email = friend.email!
            newFriend.eyeColor = friend.eyeColor!
            newFriend.gender = friend.gender!
            newFriend.id = friend.id!
            newFriend.isActive = friend.isActive!
            newFriend.name = friend.name!
            newFriend.phone = friend.phone!
            newFriend.picture = friend.picture!
            newFriend.registered = friend.registered!
            newFriend.home!.latitude = friend.home!.latitude!
            newFriend.home!.longitude = friend.home!.longitude!
            newFriend.favorite_friends = List<FavoriteFriendsObject>()
            
            for i in 0..<friend.favorite_friends.count{
                let object:FavoriteFriendsObject = FavoriteFriendsObject()
                object.id = friend.favorite_friends[i]!.id!
                object.name = friend.favorite_friends[i]!.name!
                newFriend.favorite_friends.append(object)
            }

            realm.add(newFriend)
          }
        }

        friends = realm.objects(FriendObject.self) // 5
      }
    }

}
