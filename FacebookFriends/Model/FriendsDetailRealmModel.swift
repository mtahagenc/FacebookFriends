//
//  FriendsDetailRealmModel.swift
//  FacebookFriends
//
//  Created by Muhammet Taha Genç on 28.02.2020.
//  Copyright © 2020 Muhammet Taha Genç. All rights reserved.
//

import Foundation
import RealmSwift


class FriendObject : Object {

    // This is the realm data model that we want to use in our app.
    @objc dynamic var id : String = ""
    @objc dynamic var isActive : Bool = false
    @objc dynamic var picture : String = ""
    @objc dynamic var age : Int = 0
    @objc dynamic var eyeColor : String = ""
    @objc dynamic var name : String = ""
    @objc dynamic var gender : String = ""
    @objc dynamic var company : String = ""
    @objc dynamic var email : String = ""
    @objc dynamic var phone : String = ""
    @objc dynamic var address : String = ""
    @objc dynamic var about : String = ""
    @objc dynamic var registered : String = ""
    @objc dynamic var home : HomeObject? = HomeObject()
    var favorite_friends = List<FavoriteFriendsObject>()
    
}
//Results<FriendObject>
class HomeObject : Object {
    @objc dynamic var latitude : Double = 0.0
    @objc dynamic var longitude : Double = 0.0
}

class FavoriteFriendsObject : Object {
    @objc dynamic var id : String = ""
    @objc dynamic var name : String = ""
}
