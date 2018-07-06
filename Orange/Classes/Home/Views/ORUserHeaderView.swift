//
//  ORUserHeaderView.swift
//  Orange
//  搜索用户 header
//  Created by gouyz on 2018/7/6.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class ORUserHeaderView: UITableViewHeaderFooterView {

    override init(reuseIdentifier: String?){
        
        super.init(reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = kWhiteColor
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        
        contentView.addSubview(lineView)
        contentView.addSubview(lineView1)
        contentView.addSubview(contentLab)
        
        lineView.snp.makeConstraints { (make) in
            make.left.centerY.equalTo(contentView)
            make.right.equalTo(contentLab.snp.left)
            make.height.equalTo(klineWidth)
        }
        contentLab.snp.makeConstraints { (make) in
            make.center.height.equalTo(contentView)
            make.width.equalTo(150)
            
        }
        lineView1.snp.makeConstraints { (make) in
            make.right.centerY.equalTo(contentView)
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
        
        return lab
    }()
    
    lazy var lineView1: UIView = {
        let line = UIView()
        line.backgroundColor = kGrayLineColor
        
        return line
    }()
}
