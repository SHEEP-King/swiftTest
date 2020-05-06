//
//  Functions.swift
//  sheepSwift30
//
//  Created by macbook pro on 2019/9/26.
//  Copyright © 2019 sheep. All rights reserved.
//

import Foundation
class Functions: NSObject {
    
    var name : String
    var des : String?
    var img : String?
    
    init(name:String,des:String,img:String) {
        self.name = name
        self.des = des
        self.img = img
    }
    
    
    func functions() -> Array<Functions> {
        return [
             Functions(name: "UITableView", des: "table functions", img: ""),
             Functions(name: "StopWatch", des: "StopWatch functions", img: "")
        ]
    }
    
}
