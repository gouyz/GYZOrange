//
//  ORMyLikesConmentCell.swift
//  Orange
//  我喜欢的 评论cell
//  Created by gouyz on 2018/7/6.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class ORMyLikesConmentCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = kWhiteColor
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        
        contentView.addSubview(userHeaderView)
        contentView.addSubview(contentLab)
        
        userHeaderView.snp.makeConstraints { (make) in
            make.left.equalTo(kMargin)
            make.centerY.equalTo(contentLab)
            make.size.equalTo(CGSize.init(width: 30, height: 30))
        }
        contentLab.snp.makeConstraints { (make) in
            make.left.equalTo(userHeaderView.snp.right).offset(kMargin)
            make.right.equalTo(-kMargin)
            make.height.greaterThanOrEqualTo(40)
            make.centerY.equalTo(contentView)
            make.bottom.equalTo(-kMargin)
        }
        
    }
    /// 图片
    lazy var userHeaderView : UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage.init(named: "icon_header_default")
        imgView.cornerRadius = 15
        
        
        return imgView
    }()
    
    /// 内容
    lazy var contentLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kHeightGaryFontColor
        lab.font = k13Font
        lab.numberOfLines = 0
        lab.text = "暖暖 照片好好看，笔芯"
        
        return lab
    }()

}
