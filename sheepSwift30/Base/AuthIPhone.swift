//
//  AuthIPhone.swift
//  sheepSwift30
//
//  Created by macbook pro on 2020/5/8.
//  Copyright © 2020 sheep. All rights reserved.
//

import UIKit
import Photos

class AuthIPhone: NSObject {

}

extension PHPhotoLibrary {
    static func authorizeToAlbum(completion:@escaping (Bool)->Void) {
        if PHPhotoLibrary.authorizationStatus() == .denied {
            //拒绝授权
            completion(false)
        } else if PHPhotoLibrary.authorizationStatus() == .authorized {
            //已授权
            completion(true)
        } else if PHPhotoLibrary.authorizationStatus() == .notDetermined{
            //请求授权
            PHPhotoLibrary.requestAuthorization({ (status) in
                if status == .authorized {
                    completion(true)
                } else {
                    completion(false)
                }
            })
        }
    }
}
