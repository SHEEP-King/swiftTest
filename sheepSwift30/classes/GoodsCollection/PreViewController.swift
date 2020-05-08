//
//  PreViewController.swift
//  sheepSwift30
//
//  Created by macbook pro on 2020/5/7.
//  Copyright © 2020 sheep. All rights reserved.
//

import UIKit

class PreViewController: BaseViewController {
    
    private var good : Good?
    
    // 最大的缩放比例
    private let maxScale: CGFloat = 3.0
    // 最小的缩放比例
    private let minScale: CGFloat = 1.0
    // 当前的缩放比例
    private var scale: CGFloat = 1.0
    
    // 双击点的坐标
    private var touchPoint : (x : CGFloat,y: CGFloat) = (0.0,0.0)
    
    private var touchX: CGFloat = 0.0
    // 双击点的Y坐标
    private var touchY: CGFloat = 0.0
    
    private var isDoubleTapingForZoom: Bool = false
    
    //imageView
    lazy var imageView : UIImageView = {
        let p = UIImageView()
        p.contentMode = .scaleAspectFit
        //默认情况下false，UIIMageView不与用户交互，设置为true
        p.isUserInteractionEnabled = true;
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longPressEvent))
        p.addGestureRecognizer(longPress)
        
        return p
    }()

    lazy var scrollView : UIScrollView = {
        let view = UIScrollView()
        view.maximumZoomScale = self.maxScale
        view.minimumZoomScale = self.minScale
        view.backgroundColor = UIColor.white
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        
        view.isScrollEnabled = true
        view.bounces = true
        view.alwaysBounceHorizontal = true
        view.alwaysBounceVertical = true
        
        //解决Navi下，scrollView 向下偏移问题
        view.contentInsetAdjustmentBehavior = .never
        
        view.delegate = self
        
        //手势
        let tap =  UITapGestureRecognizer(target: self, action : #selector(singleTapEvent))
        tap.numberOfTapsRequired = 1
        
        view.addGestureRecognizer(tap)
        
        //双击
        let doubleTap =  UITapGestureRecognizer(target: self, action: #selector(doubleTapEvent))
        doubleTap.numberOfTapsRequired = 2
        view.addGestureRecognizer(doubleTap)
        
        return view
    }()
    
    
    init(good: Good) {
        super.init()
        self.good = good
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    

    func setupViews() -> Void {
        if let title = good?.name {
            self.title = title
        }
        if let image = good?.image {
            self.imageView.image = UIImage(named: image)
        }
        scrollView.frame = self.view.bounds
        self.view.addSubview(scrollView)
        imageView.frame = scrollView.frame
        self.scrollView.addSubview(imageView)
    }

}
//Mark - Functions
extension PreViewController {
    
    @objc func singleTapEvent(tap : UITapGestureRecognizer) -> Void {
        EZLog(message: "single tap ... ")
    }

    @objc func doubleTapEvent(tap : UITapGestureRecognizer) -> Void {
        EZLog(message: "double tap ... ")
        if scale > minScale {
            //恢复到1.0
            self.scrollView.setZoomScale(minScale, animated: true)
        }else{
            //放大到最大
            self.scrollView.setZoomScale(maxScale, animated: true)
        }
    }
    
    @objc func longPressEvent(sender : UILongPressGestureRecognizer){
        let alert = UIAlertController(title: good?.name, message: "保存图片？", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "保存", style: .default) { (UIAlertAction) in
            //保存操作
            EZLog(message: "保存图片\(String(describing: self.good?.name))")
        }
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func moveToCenter(touchPoint: CGPoint,nowPoint:CGPoint) -> Void {

    }
    

}

// MARK - delegate
extension PreViewController : UIScrollViewDelegate{
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        EZLog(message: "scrollViewDidZoom:\(scrollView.center)")
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
    
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        EZLog(message: "scrollViewDidEndZooming:\(scrollView.center)")
        self.scale = scale
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        EZLog(message: "scrollViewDidScroll:\(scrollView.center)")
    }

    
}
