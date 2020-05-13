//
//  BaseController.swift
//  sheepSwift30
//
//  Created by macbook pro on 2019/9/26.
//  Copyright © 2019 sheep. All rights reserved.
//

import Foundation
import UIKit
class BaseViewController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        initViews()
    }
    
    //ViewDidLoad 时初始化 视图
    func initViews() -> Void {
        EZLog(message: "initViews")
    }
    
}
