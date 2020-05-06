//
//  GoodsTable.swift
//  sheepSwift30
//
//  Created by macbook pro on 2019/9/26.
//  Copyright © 2019 sheep. All rights reserved.
//

import UIKit
class GoodsCollectionController: UICollectionViewController {
    fileprivate let thumbnailSize:CGFloat = 70.0
    var goods = [Good]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initGoods()
        initViews()
    }
    
    func initViews() -> Void {
        self.title = "Goods"
        self.collectionView.backgroundColor = UIColor.gray

        self.collectionView.register(UINib(nibName: "GoodsCell", bundle: nil), forCellWithReuseIdentifier: GoodsCell.cellIdentifier)
    }
    
    func initGoods() -> Void {
        let g1 = Good(name: "java", detail: "java", image: "java.png")
        let g2 = Good(name: "swift", detail: "swift", image: "swift.png")
        let g3 = Good(name: "oc", detail: "oc", image: "oc.png")
        
        goods.append(g1)
        goods.append(g2)
        goods.append(g3)
    }
    
}

extension GoodsCollectionController {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return goods.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return GoodsCell.reuseCell(view: collectionView, indexPath: indexPath, good: goods[indexPath.item])
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        EZLog(message: "collection clicked item: \(indexPath.item)")
        
        let cell = collectionView.cellForItem(at: indexPath) as! GoodsCell
        
        showMessage(title: "item \(indexPath.item) clicked", content: cell.titleLable.text ?? "no title")
        
    }
    
    
    func showMessage(title: String, content: String) -> Void {
        let box = UIAlertController(title: title, message: content, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { (action) in
            EZLog(message: "alert action clicked OK button")
        }
        box.addAction(action)
        self.present(box, animated: true, completion: nil)
        
    }
    
}
  
