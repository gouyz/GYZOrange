//
//  ORSearchContentHeaderView.swift
//  Orange
//  搜索内容header
//  Created by gouyz on 2018/7/6.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class ORSearchContentHeaderView: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = kWhiteColor
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        
        addSubview(lineView)
        addSubview(lineView1)
        addSubview(contentLab)
        
        lineView.snp.makeConstraints { (make) in
            make.left.centerY.equalTo(self)
            make.right.equalTo(contentLab.snp.left)
            make.height.equalTo(klineWidth)
        }
        contentLab.snp.makeConstraints { (make) in
            make.center.height.equalTo(self)
            make.width.equalTo(150)
           
        }
        lineView1.snp.makeConstraints { (make) in
            make.right.centerY.equalTo(self)
            make.left.equalTo(contentLab.snp.right)
            make.height.equalTo(lineView)
        }
    }
    
    lazy var lineView: UIView = {
        let line = UIView()
        line.backgroundColor = kGrayLineColor
        
        return line
    }()
    
    /// 内容
    lazy var contentLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kYellowFontColor
        lab.font = k15Font
        lab.textAlignment = .center
        lab.text = "共1000条内容"
        
        return lab
    }()
    
    lazy var lineView1: UIView = {
        let line = UIView()
        line.backgroundColor = kGrayLineColor
        
        return line
    }()
}
