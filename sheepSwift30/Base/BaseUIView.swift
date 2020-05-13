//
//  BaseUIView.swift
//  sheepSwift30
//
//  Created by macbook pro on 2020/5/9.
//  Copyright © 2020 sheep. All rights reserved.
//

import UIKit

class BaseUIView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initViews()
    }
    
    init() {
        super.init(frame: UIScreen.main.bounds)
    }
    
    //初始化 view
    func initViews(){
        EZLog(message: "initViews..")
    }

}
