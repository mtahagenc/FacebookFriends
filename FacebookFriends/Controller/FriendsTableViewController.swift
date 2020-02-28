//
//  FriendsTableViewController.swift
//  FacebookFriends
//
//  Created by Muhammet Taha Genç on 25.02.2020.
//  Copyright © 2020 Muhammet Taha Genç. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController, sendDataProtocol {
    
    
    //MARK: - Protocol Functions
    func getIndexPath() -> IndexPath {
        let indexPath = tableView.indexPathForSelectedRow
            return indexPath!
    }
    
    
    
    // MARK: - Variables and Constants
    var friendsArray : [Friend]? = nil
    
    
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsArray!.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell") as! FriendTableViewCell
        // We are creating the cell
        
        cell.nameLabel.text = friendsArray![indexPath.row].name
        cell.emailLabel.text = friendsArray![indexPath.row].email
        //We are changing the name and email label of the cell
        
        let https = "https" + friendsArray![indexPath.row].picture!.dropFirst(4)
        //The url that we recieved from the json is not with https so we are adding https instead of http.
        
        cell.profileImage.setImageWithKF(https)
        //Cell's profile image is changed here.
        
        if friendsArray![indexPath.row].isActive == true {
            //Checking if the user active or not.
            
            cell.isActive.tintColor = .green
            //When the user active
        } else {
            cell.isActive.tintColor = .red
            //When the user is not active
        }
        
        return cell
    }
    
    //MARK: - Navigation Functions
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! DetailPageViewController
            destinationVC.delegate = self
            destinationVC.friendsArray = friendsArray
    }
    

    @IBAction func barButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
}
