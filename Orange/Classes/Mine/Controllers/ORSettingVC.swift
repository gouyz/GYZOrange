//
//  ORSettingVC.swift
//  Orange
//  设置
//  Created by gouyz on 2018/7/5.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit
import MBProgressHUD

private let settingCell = "settingCell"

class ORSettingVC: GYZBaseVC {
    
    let titleArr : [String] = ["账号和安全","我的二维码","商家入驻","通知","清除缓存"]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "设置"
        
        view.addSubview(loginOutBtn)
        
        loginOutBtn.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(view)
            make.height.equalTo(kBottomTabbarHeight)
        }
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(view)
            make.bottom.equalTo(loginOutBtn.snp.top)
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
        
        table.register(GYZCommonArrowCell.self, forCellReuseIdentifier: settingCell)
        
        
        return table
    }()
    /// 退出当前账号
    lazy var loginOutBtn : UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.backgroundColor = kBtnClickBGColor
        btn.titleLabel?.font = k15Font
        btn.setTitleColor(kWhiteColor, for: .normal)
        btn.setTitle("退出我的账号", for: .normal)
        btn.addTarget(self, action: #selector(clickedLoginOutBtn), for: .touchUpInside)
        
        return btn
    }()
    
    ///退出当前账号
    @objc func clickedLoginOutBtn(){
        
        weak var weakSelf = self
        GYZAlertViewTools.alertViewTools.showAlert(title: "提示", message: "确定要退出登录？", cancleTitle: "取消", viewController: self, buttonTitles: "退出") { (index) in
            
            if index != cancelIndex{
                weakSelf?.loginOut()
            }
        }
        
    }
    
    ///退出当前账号
    func loginOut(){
        GYZTool.removeUserInfo()
        
        KeyWindow.rootViewController = GYZBaseNavigationVC(rootViewController: LHSQuickLoginVC())
    }
}

extension ORSettingVC : UITableViewDelegate,UITableViewDataSource{
    /// MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return titleArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: settingCell) as! GYZCommonArrowCell
        
        cell.nameLab.text = titleArr[indexPath.row]
        if indexPath.row == titleArr.count - 1{
            cell.rightIconView.isHidden = true
            cell.contentLab.text = "264MB"
        }else{
            cell.rightIconView.isHidden = false
            cell.contentLab.text = ""
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:// 账号安全
            let accountVC = ORMyAccountSafeVC()
            navigationController?.pushViewController(accountVC, animated: true)
        case 1://二维码
            let qrcodeVC = ORMyQrcodeVC()
            navigationController?.pushViewController(qrcodeVC, animated: true)
        case 2://商家入驻
            let businessVC = ORMyBusinessVC()
            navigationController?.pushViewController(businessVC, animated: true)
        case 3://通知
            let notifyVC = ORSettingNotifyVC()
            navigationController?.pushViewController(notifyVC, animated: true)
        case 4://清除缓存
            MBProgressHUD.showAutoDismissHUD(message: "清理完成")
        default:
            break
        }
    }
    ///MARK : UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return kTitleHeight
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.00001
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.00001
        
    }
}
