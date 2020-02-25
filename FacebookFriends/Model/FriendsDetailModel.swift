//
//  FriendsDetailModel.swift
//  FacebookFriends
//
//  Created by Muhammet Taha Genç on 25.02.2020.
//  Copyright © 2020 Muhammet Taha Genç. All rights reserved.
//

import Foundation

public struct Friend : Decodable {
    let id : String?
    let isActive : Bool?
    let picture : String?
    let age : Int?
    let eyeColor : String?
    let name : String?
    let gender : String?
    let company : String?
    let email : String?
    let phone : String?
    let address : String?
    let about : String?
    let registered : String?
    let home : Home?
    let favorite_friends : [FavoriteFriends?]
}

public struct Home : Decodable {
    let latitude : Double?
    let longitude : Double?
}

public struct FavoriteFriends : Decodable {
    let id : String?
    let name : String?
}
