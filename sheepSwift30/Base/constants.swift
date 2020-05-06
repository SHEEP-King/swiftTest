//
//  constants.swift
//  sheepSwift30
//
//  Created by macbook pro on 2019/9/26.
//  Copyright © 2019 sheep. All rights reserved.
//

import Foundation
import UIKit

let kApplication = UIApplication.shared

let kAppDelegate = kApplication.delegate as! AppDelegate

let kAppWindow = kAppDelegate.window

let kRootController = kAppWindow?.rootViewController

let kUserDefaults = UserDefaults.standard

let kNotificationCenter = NotificationCenter.default

let ScreenSize = UIScreen.main.bounds.size

let ScreenWidth = UIScreen.main.bounds.width

let ScreenHeight = UIScreen.main.bounds.height

//以Iphone 8 为UI基础
let rate = ScreenWidth / 414.0

let kStatusBarHeight = UIApplication.shared.statusBarFrame.size.height

let kNavBarHeight : CGFloat = 44.0

let kTabBarHeight = UIApplication.shared.statusBarFrame.size.height >  20.0 ? 83 : 49

let kTopHeight = (kStatusBarHeight + kNavBarHeight)


//MARK: 自定义输出debug&release

func EZLog<N>(message:N,fileName:String = #file,methodName:String = #function,lineNumber:Int = #line){
#if DEBUG
    print("\(fileName as NSString)\n方法:\(methodName)\n行号:\(lineNumber)\n打印信息:\(message)")
#endif
}

