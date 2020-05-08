//
//  SPNaviController.swift
//  sheepSwift30
//
//  Created by macbook pro on 2020/5/6.
//  Copyright © 2020 sheep. All rights reserved.
//
import UIKit

class SPNaviController: BaseNaviController {

    var isBackButtonShow = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    

}
extension SPNaviController : UINavigationControllerDelegate{
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if !isBackButtonShow {
            
        }
    }
    
}
