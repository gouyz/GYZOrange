//
//  GYZMainTabBarVC.swift
//  baking
//  底部导航控制器
//  Created by gouyz on 2017/3/23.
//  Copyright © 2017年 gouyz. All rights reserved.
//

import UIKit

class GYZMainTabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setUp()
    }
    
    func setUp(){
        tabBar.tintColor = kNavBarColor
        
        addViewController(ORHomeVC(), title: "", normalImgName: "icon_home")
        addViewController(ORPublishVC(), title: "", normalImgName: "icon_publish")
        addViewController(ORLikeVC(), title: "", normalImgName: "icon_likes")
        addViewController(ORMineVC(), title: "", normalImgName: "icon_mine")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 添加子控件
    fileprivate func addViewController(_ childController: UIViewController, title: String,normalImgName: String) {
        let nav = GYZBaseNavigationVC(rootViewController:childController)
        addChildViewController(nav)
        childController.tabBarItem.title = title
        childController.tabBarItem.imageInsets = UIEdgeInsets.init(top: 5, left: 0, bottom: -5, right: 0)
        // 设置 tabbarItem 选中状态的图片(不被系统默认渲染,显示图像原始颜色)
        childController.tabBarItem.image = UIImage(named: normalImgName)?.withRenderingMode(.alwaysOriginal)
        childController.tabBarItem.selectedImage = UIImage(named: normalImgName + "_selected")?.withRenderingMode(.alwaysOriginal)
    }
}

