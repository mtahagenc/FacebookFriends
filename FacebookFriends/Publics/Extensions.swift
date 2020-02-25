//
//  Extensions.swift
//  FacebookFriends
//
//  Created by Muhammet Taha Genç on 25.02.2020.
//  Copyright © 2020 Muhammet Taha Genç. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

extension Int {
    static let Succeed = 1
    static let Failed = 2
    static let FailedDecode = 3
}

extension UIImageView {
//    func load(urlString: String) {
//        let https = "https" + urlString.dropFirst(4)
//        let url = URL(string: https)
//        self.image!.kf.setImage(with: url)
//    }
    
    @objc func setImageWithKF(_ url : String?) {
//        self.image = UIImage()
        if let imageUrl = url {
            if let urls = URL(string : imageUrl) {
                if imageUrl != "" {
                    let resource = ImageResource(downloadURL: urls, cacheKey: imageUrl)
                    DispatchQueue.main.async {
                        self.kf.setImage(with: resource ,options:[.loadDiskFileSynchronously,.transition(ImageTransition.fade(0.5))])
                        //                    self.kf.cancelDownloadTask()
                    }
                } else {
                    self.image = UIImage()
                }
            } else {
                self.image = UIImage()
            }
        } else {
            self.image = UIImage()
        }
    }
    
}


