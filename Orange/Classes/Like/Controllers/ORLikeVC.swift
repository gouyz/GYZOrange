//
//  ORLikeVC.swift
//  Orange
//  LIKES
//  Created by gouyz on 2018/7/2.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class ORLikeVC: GYZBaseVC {
    
    var titleArr : [String] = ["我喜欢的","喜欢我的"]
    
    var stateValue : [String] = ["1","2"]
    var scrollPageView: ScrollPageView?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "LIKES"
        
        setScrollView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    ///设置控制器
    func setChildVcs() -> [UIViewController] {
        
        let myLikeVC = ORMyLikesVC()
        
        let likeMeVC = ORLikesMeVC()
        
        return [myLikeVC,likeMeVC]
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
}
