//
//  BaseTabController.swift
//  sheepSwift30
//
//  Created by macbook pro on 2019/9/26.
//  Copyright © 2019 sheep. All rights reserved.
//

import Foundation
import UIKit

class BaseTabController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func initView() -> Void {
        EZLog(message: "initView")
    }
}
