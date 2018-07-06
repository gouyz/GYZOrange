//
//  ORUserfriendsCell.swift
//  Orange
//
//  Created by gouyz on 2018/7/6.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class ORUserfriendsCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(userHeaderView)
        addSubview(nameLab)
        
        userHeaderView.snp.makeConstraints { (make) in
            make.top.equalTo(kMargin)
            make.centerX.equalTo(self)
            make.size.equalTo(CGSize.init(width: 60, height: 60))
        }
        nameLab.snp.makeConstraints { (make) in
            make.left.equalTo(5)
            make.right.equalTo(-5)
            make.top.equalTo(userHeaderView.snp.bottom)
            make.bottom.equalTo(-kMargin)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 图片
    lazy var userHeaderView : UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage.init(named: "icon_header_default")
        imgView.cornerRadius = 30
        
        
        return imgView
    }()
    
    /// 姓名
    lazy var nameLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kBlackFontColor
        lab.font = k15Font
        lab.textAlignment = .center
        lab.text = "Lily"
        
        return lab
    }()
}
