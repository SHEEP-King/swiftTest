//
//  Good.swift
//  sheepSwift30
//
//  Created by macbook pro on 2020/5/4.
//  Copyright © 2020 sheep. All rights reserved.
//

import UIKit

class Good: NSObject {

    var name: String? = "Good"
    var detail: String? = "detail"
    var image: String? = "imageUrl"
    
    init(name: String, detail: String, image: String) {
        self.name = name
        self.detail = detail
        self.image = image
    }
    
}
