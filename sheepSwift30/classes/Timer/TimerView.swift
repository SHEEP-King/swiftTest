//
//  TimerView.swift
//  sheepSwift30
//
//  Created by macbook pro on 2020/5/9.
//  Copyright © 2020 sheep. All rights reserved.
//

import UIKit

typealias ETime = (hour:Int, minute: Int, second: Int)

class TimerView: BaseUIView {
    
    private static let nibName = "TimerView"
    
    var delegate:TimerViewDelegate?
    
    @IBOutlet weak var hourLabel: UILabel!
    
    @IBOutlet weak var minLabel: UILabel!
    
    @IBOutlet weak var secLabel: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var resetButton: UIButton!
    
    var timeString: String {
        get{
            return  String(format: "%d:%02d:%02d",hour, minute, second)
        }
    }
    private var minute: Int = 0
    private var hour: Int = 0
    private var second: Int = 0
    
    private var starting : Bool = false

    
    var times: [ETime] = []
    
    private var time : ETime {
        get{
            return (self.hour,self.minute,self.second)
        }
    }
    
    private let interval = 1
    
    private var timer: Timer?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    func setupViews() {
        //
    }
    
    //开始/暂停button
    @IBAction func startButtonClicked(_ sender: UIButton) {
        if starting {
            //如果再进行中--则执行暂停功能(连续暂停)记录时间
            self.times.append(self.time)
            if let del = self.delegate {
                del.timerView(didStoped: self, time: time)
            }
        }else{
            //如果是复位状态，则执行开始计时功能
            starting = true
            self.timer = Timer.scheduledTimer(timeInterval: TimeInterval(self.interval), target: self, selector: #selector(timerSchedule), userInfo: nil, repeats: true)
        }
       
    }
    //复位button
    @IBAction func resetButtonClicked(_ sender: UIButton) {
        //复位-
        resetTimes()
        refreshTime()
    }
    
}

protocol TimerViewDelegate : AnyObject{
    
    //开始计时
    func timerView(didStarted view: TimerView) -> Void
    //记录此时秒表时间，不停止计时
    func timerView(didStoped view: TimerView,  time: ETime) -> Void
    //停止并重置计时器
    func timerView(didReset view: TimerView, times: [ETime]) -> Void
    //错误信息
    func timerView(failured view :TimerView, msg: String) -> Void;
    
}



extension TimerViewDelegate{
    func timerView(didStarted view: TimerView) -> Void{
        EZLog(message: "started")
    }
    func timerView(didReset view: TimerView, times: [ETime]) {
        EZLog(message: "reset")
    }
    func timerView(didStoped view: TimerView, time: ETime) {
        EZLog(message: "stoped")
    }
    //错误信息
    func timerView(failured view :TimerView, msg: String) {
        EZLog(message: "failured:"+msg)
    }

}

//Functions
extension TimerView {
    
    class func create(frame: CGRect) -> TimerView? {
        if let timerView = Bundle.main.loadNibNamed(self.nibName, owner: nil, options: nil)?.first as? TimerView {
            timerView.frame = frame
            return timerView
        }
        return nil
    }
    
    @objc func timerSchedule(timer: Timer){
        EZLog(message: Date())
        self.second += self.interval
        if self.second / 60 == 1 {
            self.second = 0
            self.minute += 1
            if self.minute / 60 == 1 {
                self.minute = 0
                self.hour += 1
                if self.hour == 100 {
                    resetTimes()
                }
            }
        }
        refreshTime()
    }
    
    
    func refreshTime(){
        self.hourLabel.text = String(format: "%02d", self.hour)
        self.minLabel.text = String(format: "%02d", self.minute)
        self.secLabel.text = String(format: "%02d", self.second)
    }
    
    func resetTimes() -> Void {
        starting = false
        self.timer?.invalidate()
        
        self.second = 0
        self.minute = 0
        self.hour = 0
        self.times.removeAll()
    }
    

}
