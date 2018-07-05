//
//  ORMyAccountSafeVC.swift
//  Orange
//  账号和安全
//  Created by gouyz on 2018/7/5.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

private let accountSafeInfoCell = "accountSafeInfoCell"
private let accountSafeSecondCell = "accountSafeSecondCell"
private let accountSafeThirdCell = "accountSafeThirdCell"
private let accountSafeHeader = "accountSafeHeader"

class ORMyAccountSafeVC: GYZBaseVC {
    
    let titleArr : [String] = ["允许通过手机号找到我","允许未关注者发私聊给我","允许未关注者@我"]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "账号和安全"
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /// 懒加载UITableView
    lazy var tableView : UITableView = {
        let table = UITableView(frame: CGRect.zero, style: .grouped)
        table.dataSource = self
        table.delegate = self
        table.separatorStyle = .none
        
        table.register(GYZCommonInfoCell.self, forCellReuseIdentifier: accountSafeInfoCell)
        table.register(GYZCommonSwitchCell.self, forCellReuseIdentifier: accountSafeSecondCell)
        table.register(ORAccountCell.self, forCellReuseIdentifier: accountSafeThirdCell)
        
        table.register(LHSGeneralHeaderView.self, forHeaderFooterViewReuseIdentifier: accountSafeHeader)
        
        
        return table
    }()
}

extension ORMyAccountSafeVC : UITableViewDelegate,UITableViewDataSource{
    /// MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        }
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: accountSafeInfoCell) as! GYZCommonInfoCell
            
            cell.titleLab.text = "手机号"
            cell.contentLab.text = "138****1234"
            
            cell.selectionStyle = .none
            return cell
        }else if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: accountSafeSecondCell) as! GYZCommonSwitchCell
            
            cell.nameLab.text = titleArr[indexPath.row]
            
            cell.selectionStyle = .none
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: accountSafeThirdCell) as! ORAccountCell
            
            if indexPath.row == 0{
                cell.nameLab.text = "微信账号"
                cell.iconView.image = UIImage.init(named: "icon_account_wechat")
            }else if indexPath.row == 1{
                cell.nameLab.text = "腾讯QQ"
                cell.iconView.image = UIImage.init(named: "icon_account_qq")
            }else{
                cell.nameLab.text = "新浪微博"
                cell.iconView.image = UIImage.init(named: "icon_account_sina")
            }
            
          
            cell.selectionStyle = .none
            return cell
        }
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 0 {
            return UIView()
        }
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: accountSafeHeader) as! LHSGeneralHeaderView
        
        if section == 1 {
            headerView.nameLab.text = "隐私"
        }else{
            headerView.nameLab.text = "社交账号绑定"
        }
        
        return headerView
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    ///MARK : UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return kTitleHeight
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0.00001
        }
        return 54
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.00001
        
    }
}
