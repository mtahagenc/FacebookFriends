//
//  FriendsTableViewController.swift
//  FacebookFriends
//
//  Created by Muhammet Taha Genç on 25.02.2020.
//  Copyright © 2020 Muhammet Taha Genç. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {

    var friendsArray : [Friend]? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friendsArray!.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell") as! FriendTableViewCell
        cell.nameLabel.text = friendsArray![indexPath.row].name
        cell.emailLabel.text = friendsArray![indexPath.row].email
        let https = "https" + friendsArray![indexPath.row].picture!.dropFirst(4)
        cell.imageView?.setImageWithKF(https)
        cell.imageView?.clipsToBounds = true
        cell.imageView?.contentMode = .scaleAspectFill
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(friendsArray![indexPath.row].picture!)


    }
    
    
}