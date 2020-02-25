//
//  WebServices.swift
//  FacebookFriends
//
//  Created by Muhammet Taha Genç on 25.02.2020.
//  Copyright © 2020 Muhammet Taha Genç. All rights reserved.
//

import Foundation
import Alamofire

public class WebServices {
    public func get<T:Decodable> (_ url : String,_ completion : @escaping(Int,T?) -> Void) {
        Alamofire.request(url, method: .get).responseJSON {(response) in
            if response.result.isSuccess {
                do {
                    let model = try JSONDecoder().decode(T.self, from: response.data!)
                    // return the decodedModel
                    completion(.Succeed,model)
                } catch {
                    completion(.FailedDecode,nil)
                    print(error)
                    //print(String(data: data!, encoding: String.Encoding.utf8)!)
                }
            } else {
                print(response.result.error!)
                completion(.Failed, nil)
            }
        }
    }
}
