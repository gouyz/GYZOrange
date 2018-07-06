//
//  ORSearchUserVC.swift
//  Orange
//  搜索用户
//  Created by gouyz on 2018/7/6.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

private let searchUserCell = "searchUserCell"
private let searchUserFriendsCell = "searchUserFriendsCell"
private let searchUserHeader = "searchUserHeader"

class ORSearchUserVC: GYZBaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            
            make.edges.equalTo(0)
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
        table.separatorStyle = .none
        
        
        table.register(ORSearchUserFriendsCell.self, forCellReuseIdentifier: searchUserFriendsCell)
        table.register(ORSearchUserCell.self, forCellReuseIdentifier: searchUserCell)
        table.register(ORUserHeaderView.self, forHeaderFooterViewReuseIdentifier: searchUserHeader)
        
        return table
    }()
    
    /// 朋友主页
    func goFriendVC(){
        let friendVC = ORFriendVC()
        navigationController?.pushViewController(friendVC, animated: true)
    }
}

extension ORSearchUserVC: UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        }
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: searchUserFriendsCell) as! ORSearchUserFriendsCell
            
            cell.selectionStyle = .none
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: searchUserCell) as! ORSearchUserCell
            
            cell.selectionStyle = .none
            return cell
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: searchUserHeader) as! ORUserHeaderView
        
        if section == 0 {
            headerView.contentLab.text = "可能认识的人"
        }else{
            headerView.contentLab.text = "共1000条结果"
        }
        return headerView
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 1 {
            goFriendVC()
        }
    }
    ///MARK : UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 {
            return 80
        }
        
        return 110
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return kTitleHeight
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.00001
    }
}
