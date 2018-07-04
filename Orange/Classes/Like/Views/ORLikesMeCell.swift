//
//  ORLikesMeCell.swift
//  Orange
//  喜欢我的cell
//  Created by gouyz on 2018/7/4.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class ORLikesMeCell: UITableViewCell {

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
        contentView.addSubview(photoImgView)
        
        userHeaderView.snp.makeConstraints { (make) in
            make.left.equalTo(kMargin)
            make.centerY.equalTo(contentLab)
            make.size.equalTo(CGSize.init(width: 60, height: 60))
        }
        contentLab.snp.makeConstraints { (make) in
            make.left.equalTo(userHeaderView.snp.right).offset(kMargin)
            make.right.equalTo(photoImgView.snp.left).offset(-kMargin)
            make.height.greaterThanOrEqualTo(70)
            make.centerY.equalTo(contentView)
            make.bottom.equalTo(-kMargin)
        }
        photoImgView.snp.makeConstraints { (make) in
            make.right.equalTo(-kMargin)
            make.centerY.size.equalTo(userHeaderView)
        }
        
    }
    /// 图片
    lazy var userHeaderView : UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage.init(named: "icon_header_default")
        imgView.cornerRadius = 30
        
        
        return imgView
    }()
    
    /// 内容
    lazy var contentLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kBlackFontColor
        lab.font = k15Font
        lab.numberOfLines = 0
        lab.text = "不忘初心 赞了我"
        
        return lab
    }()
    
    lazy var photoImgView: UIImageView = UIImageView.init(image: UIImage.init(named: "icon_likes_default"))
}
