//
//  TimerController.swift
//  sheepSwift30
//
//  Created by macbook pro on 2020/5/6.
//  Copyright © 2020 sheep. All rights reserved.
//
import UIKit

class TimerController: BaseViewController {

    lazy var timerView : TimerView = {
        let timer = TimerView.create(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 200))
        timer?.center = self.view.center
        timer?.delegate = self
        return timer!
     }()
    
    let contentTextView : UITextView = {
        
        let text = UITextView(frame: CGRect(x: 0, y: ScreenHeight - 200, width: ScreenWidth, height: 200))
        text.font = UIFont.systemFont(ofSize: 15)
        
        func addContetn(con: String){
            if let o = text.text {
                text.text = o + "\n" + con
            }else{
                text.text = con
            }
        }
        return text
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        self.title = "Timer"
        self.view.addSubview(timerView)
        self.view.addSubview(contentTextView)
    }
    
}

extension TimerController:TimerViewDelegate {
    //每次暂停时调用
    func timerView(didStoped view: TimerView, time: ETime) {
        self.contentTextView.text += view.timeString+"\n"
    }
    //复位定时器是调用
    func timerView(didReset view: TimerView, times: [ETime]) {
        self.contentTextView.text += "复位\n"
    }
    //开启定时器时调用
    func timerView(didStarted view: TimerView) {
        self.contentTextView.text += "定时器开启\n"
    }
}
