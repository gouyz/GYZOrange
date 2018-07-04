//
//  ORLikesMeVC.swift
//  Orange
//  喜欢我的
//  Created by gouyz on 2018/7/4.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

private let likesMeCell = "likesMeCell"

class ORLikesMeVC: GYZBaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            
            if #available(iOS 11.0, *) {
                make.edges.equalTo(0)
            }else{
                make.edges.equalTo(UIEdgeInsetsMake(0, 0, kTabBarHeight, 0))
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    lazy var tableView : UITableView = {
        let table = UITableView(frame: CGRect.zero, style: .grouped)
        table.dataSource = self
        table.delegate = self
        table.separatorColor = kGrayLineColor
        
        // 设置大概高度
        table.estimatedRowHeight = 80
        // 设置行高为自动适配
        table.rowHeight = UITableViewAutomaticDimension
        
        table.register(ORLikesMeCell.self, forCellReuseIdentifier: likesMeCell)
        
        return table
    }()
}

extension ORLikesMeVC: UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 16
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: likesMeCell) as! ORLikesMeCell
        
        if indexPath.row % 2 == 0 {
            cell.contentLab.text = "不忘初心 赞了我"
        }else{
            cell.contentLab.text = "不忘初心 评论了我的帖子：图片看起来不错哦，很有食欲的呢~~~~~~图片看起来不错哦，很有食欲的呢~~~~~~图片看起来不错哦，很有食欲的呢~~~~~~图片看起来不错哦，很有食欲的呢~~~~~~"
        }
        
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        return UIView()
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        return UIView()
    }
    ///MARK : UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.00001
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.00001
    }
}
