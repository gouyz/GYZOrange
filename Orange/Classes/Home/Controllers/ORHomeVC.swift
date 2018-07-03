//
//  ORHomeVC.swift
//  Orange
//  首页
//  Created by gouyz on 2018/7/2.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

private let homeCell = "homeCell"

class ORHomeVC: GYZBaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.titleView = UIImageView.init(image: UIImage.init(named: "icon_home_title"))
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "icon_search_gray")?.withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(clickedSearchBtn))
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "icon_message_gray")?.withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(clickedMessageBtn))
        
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
        
        // 设置大概高度
        table.estimatedRowHeight = 100
        // 设置行高为自动适配
        table.rowHeight = UITableViewAutomaticDimension
        
        table.register(GYZCommonInfoCell.self, forCellReuseIdentifier: homeCell)
//        table.register(PWOrderDetailGoodsCell.self, forCellReuseIdentifier: orderDetailGoodsCell)
        
        return table
    }()

    /// 搜索
    @objc func clickedSearchBtn(){
        
    }
    /// 消息
    @objc func clickedMessageBtn(){
        
    }
}

extension ORHomeVC: UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: homeCell) as! GYZCommonInfoCell
        
        
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
