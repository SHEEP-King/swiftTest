//
//  ViewController.swift
//  sheepSwift30
//
//  Created by macbook pro on 2019/9/26.
//  Copyright © 2019 sheep. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    private var functions : [Functions]?
    
    private let identifier = "funtionCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initDatas()
        setupViews()
        
    }

    func initDatas() -> Void {
        functions = [
          Functions(name: "UITableView", des: "UITableView", img: "UITableView"),
          Functions(name: "StopView", des: "StopView", img: "StopView"),
          Functions(name: "GoodsAsOldPhones", des: "GoodsAsOldPhones", img: "goods"),
          Functions(name: "GoodsAsOldPhones", des: "GoodsAsOldPhones", img: "goods"),
          Functions(name: "GoodsAsOldPhones", des: "GoodsAsOldPhones", img: "goods"),
          Functions(name: "GoodsAsOldPhones", des: "GoodsAsOldPhones", img: "goods")
        ]
    }
    
    func setupViews() -> Void {
        self.title = "Functions"
    }

}


// delegate and dataSource
extension ViewController{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return functions?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: identifier)
        }
        guard let functions = functions else { return cell!}
        
        cell?.textLabel?.text = functions[indexPath.row].name
        cell?.detailTextLabel?.text = functions[indexPath.row].des
        cell?.imageView?.image = UIImage(named: functions[indexPath.row].img!)
        
        return cell!
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        EZLog(message: "clicked row: \(indexPath.row)")
        
        switch indexPath.row {
        case 0:
            self.navigationController?.show(GoodsCollectionController.init(collectionViewLayout: GoodsLayout()), sender: nil)
        default:
            EZLog(message: "click cell default")
        }
        
        
    }
    
    
}
