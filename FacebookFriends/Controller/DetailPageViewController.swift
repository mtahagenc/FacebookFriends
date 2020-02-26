//
//  DetailPageViewController.swift
//  FacebookFriends
//
//  Created by Muhammet Taha Genç on 25.02.2020.
//  Copyright © 2020 Muhammet Taha Genç. All rights reserved.
//

import UIKit

class DetailPageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return friendsArray![indexRow!].favorite_friends.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteFriends")
        if indexPath.row == 0 {
            cell?.textLabel?.text = "Favorite Friends"
//            cell?.backgroundColor = .systemBlue
//            cell?.textLabel?.textAlignment = .center
            return cell!
        } else {
            cell?.textLabel?.text = friendsArray![indexRow!].favorite_friends[indexPath.row]?.name
            return cell!
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 30
        } else {
            return 20
        }
    }


    var indexRow: Int? = nil
    var friendsArray: [Friend]? = nil
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        details(indexRow!)
    }
    
    //MARK: -IBOutlets, Actions
    
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var eyeColorLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var adressLabel: UILabel!
    @IBOutlet weak var aboutTextView: UITextView!
    @IBOutlet weak var favoriteFriends: UITableView!
    
    @IBAction func goTOMapBtn(_ sender: Any) {
        performSegue(withIdentifier: "showMap", sender: self)
    }
    func details (_ rowInt: Int) {
        let friend = friendsArray![rowInt]
        
        if friend.picture != nil {
            let https = "https" + friend.picture!.dropFirst(4)
            profilePicture.setImageWithKF(https)
        }
        
        nameLabel.text = friend.name ?? "No Name"
        
        companyNameLabel.text = "Company: \(friend.company ?? "No Company Name")"
        
        phoneNumberLabel.text = "Phone : \(friend.phone ?? "No Phone Number")"
        
        eyeColorLabel.text = "Eye Color: \(friend.eyeColor ?? "No Data")"
        
        emailLabel.text = "eMail: \(friend.email ?? "No eMail Info")"
        
        adressLabel.text = "Address: \(friend.address ?? "No Address Info")"
        
        aboutTextView.text = "About: \(friend.about ?? "No Info")"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! MapViewController
        destinationVC.friendsArray = friendsArray
        destinationVC.indexRow = indexRow
    }
    
}
