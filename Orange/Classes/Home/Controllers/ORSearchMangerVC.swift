//
//  ORSearchMangerVC.swift
//  Orange
//  搜索
//  Created by gouyz on 2018/7/6.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit
import MBProgressHUD

class ORSearchMangerVC: GYZBaseVC,UISearchBarDelegate {

    var titleArr : [String] = ["搜索用户","搜索内容"]
    
    var stateValue : [String] = ["1","2"]
    var scrollPageView: ScrollPageView?
    
    var searchContent: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setScrollView()
        searchBar.text = searchContent
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupUI(){
        
        /// 解决iOS11中UISearchBar高度变大
        if #available(iOS 11.0, *) {
            let titleView: UIView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth - 120, height: kTitleHeight))
            
            searchBar.frame = titleView.bounds
            titleView.addSubview(searchBar)
            navigationItem.titleView = titleView
        }else{
            navigationItem.titleView = searchBar
        }
        
        let btn = UIButton(type: .custom)
        btn.setTitle("取消", for: .normal)
        btn.titleLabel?.font = k14Font
        btn.setTitleColor(kBlackFontColor, for: .normal)
        btn.frame = CGRect.init(x: 0, y: 0, width: kTitleHeight, height: kTitleHeight)
        btn.addTarget(self, action: #selector(cancleSearchClick), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: btn)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "icon_scan_code")?.withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(clickedScanBtn))
    }
    
    /// 搜索框
    lazy var searchBar : UISearchBar = {
        let search = UISearchBar()
        
        search.placeholder = "输入您要搜索的内容"
        search.delegate = self
        //显示输入光标
        search.tintColor = kBlackFontColor
        // 不显示背景，系统自带的背景色无效，自定义的有效
        search.searchBarStyle = .minimal
        //弹出键盘
        //        search.becomeFirstResponder()
        
        return search
    }()
    
    ///设置控制器
    func setChildVcs() -> [UIViewController] {
        
        let userVC = ORSearchUserVC()
        
        let contentVC = ORSearchContentVC()
        
        return [userVC,contentVC]
    }
    
    /// 设置scrollView
    func setScrollView(){
        // 这个是必要的设置
        automaticallyAdjustsScrollViewInsets = false
        
        var style = SegmentStyle()
        // 滚动条
        style.showLine = false
        style.titleBigScale = 1.0
        style.scrollTitle = false
        // 颜色渐变
        style.gradualChangeTitleColor = true
        // 滚动条颜色
        style.scrollLineColor = kYellowFontColor
        style.normalTitleColor = kBlackFontColor
        style.selectedTitleColor = kYellowFontColor
        /// 显示角标
        style.showBadge = false
        
        
        scrollPageView = ScrollPageView.init(frame: CGRect.init(x: 0, y: kTitleAndStateHeight, width: kScreenWidth, height: kScreenHeight - kTitleAndStateHeight), segmentStyle: style, titles: titleArr, childVcs: setChildVcs(), parentViewController: self)
        view.addSubview(scrollPageView!)
    }
    
    /// 取消搜索
    @objc func cancleSearchClick(){
        searchBar.resignFirstResponder()
        
        self.dismiss(animated: false, completion: nil)
    }
    
    /// 扫描
    @objc func clickedScanBtn(){
        
    }
    
    ///mark - UISearchBarDelegate
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.resignFirstResponder()
        
        searchContent = searchBar.text!
        if searchContent.isEmpty {
            MBProgressHUD.showAutoDismissHUD(message: "请输入搜索内容")
            return
        }
    }
}
