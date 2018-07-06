//
//  ORMyLikesDetailVC.swift
//  Orange
//
//  Created by gouyz on 2018/7/6.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

private let myLikesDetailCell = "myLikesDetailCell"
private let myLikesDetailConmentCell = "myLikesDetailConmentCell"

class ORMyLikesDetailVC: GYZBaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "小胖子"
        self.view.backgroundColor = kWhiteColor
        
        view.addSubview(bottomView)
        view.addSubview(tableView)
        bottomView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(view)
            make.height.equalTo(kBottomTabbarHeight)
        }
        tableView.snp.makeConstraints { (make) in
            make.left.right.equalTo(view)
            if #available(iOS 11.0, *) {
                make.top.equalTo(view)

            }else{
                make.top.equalTo(kTitleAndStateHeight)
            }
            make.bottom.equalTo(bottomView.snp.top)
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
        table.estimatedRowHeight = 60
        // 设置行高为自动适配
        table.rowHeight = UITableViewAutomaticDimension
        
        table.register(ORMyLikesConmentCell.self, forCellReuseIdentifier: myLikesDetailConmentCell)
        table.register(ORMyLikesDetailCell.self, forCellReuseIdentifier: myLikesDetailCell)
        
        return table
    }()
    
    // 评论View
    lazy var bottomView: GYZBottomSendView = GYZBottomSendView()
}

extension ORMyLikesDetailVC: UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        }
        return 16
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: myLikesDetailCell) as! ORMyLikesDetailCell
            
            cell.videoImgView.isHidden = true
            cell.photosImgView.isHidden = false
            
            cell.selectionStyle = .none
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: myLikesDetailConmentCell) as! ORMyLikesConmentCell
            
            cell.selectionStyle = .none
            return cell
        }
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
