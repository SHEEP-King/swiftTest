//
//  GoodsCell.swift
//  sheepSwift30
//
//  Created by macbook pro on 2020/5/4.
//  Copyright © 2020 sheep. All rights reserved.
//

import Foundation
import UIKit
class GoodsCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    
    public static let cellIdentifier = "GoodsCell"
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //通过xib创建 会调用此方法，在此 对视图进行修改
        initialCell()
        EZLog(message: "awake from nib init")
    }
    
    func initialCell() {
        self.backgroundColor = UIColor.white
        self.imageView?.backgroundColor = UIColor.white
        self.imageView?.layer.cornerRadius = 5
        self.imageView?.clipsToBounds = true
        self.titleLable?.font = UIFont.boldSystemFont(ofSize: 23)
    }
    
    
    public class func reuseCell(view: UICollectionView,indexPath: IndexPath, good: Good) -> GoodsCell {
        let goodsCell = view.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! GoodsCell
        
        
        if let gname:String = good.name {
            goodsCell.titleLable?.text = gname
            
        }
        if let image : String = good.image {
           goodsCell.imageView?.image = UIImage(named: image)
        }

        return goodsCell
    }
    
    
}


class GoodsLayout: UICollectionViewFlowLayout,UICollectionViewDelegateFlowLayout {
    
    let H_ITEM_COUNTS : CGFloat = 2
    let V_ITEM_COUNTS :CGFloat = 4
    let ITEM_PADDING_IPHONE8_PLUS: CGFloat = 10.0
    
    override init() {
        super.init()
        setupLayout()
    }
    required convenience init?(coder: NSCoder) {
        self.init()
    }
    
    func setupLayout() -> Void {
        
        let padding = ITEM_PADDING_IPHONE8_PLUS * rate
        let width = (ScreenWidth - 2.0 * padding * H_ITEM_COUNTS)/H_ITEM_COUNTS
        let height = width * 1.4
        
        
        self.scrollDirection = .vertical
        self.itemSize = CGSize.init(width: width, height: height);
        self.minimumInteritemSpacing = padding;
        self.minimumLineSpacing = padding;
        self.sectionInset = UIEdgeInsets(top: padding*0.5, left: padding, bottom: padding*0.5, right: padding);
    }
    
    
    
    
}
