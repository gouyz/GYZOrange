//
//  ORAccountCell.swift
//  Orange
//  账号和安全 账号绑定
//  Created by gouyz on 2018/7/5.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class ORAccountCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = kWhiteColor
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        contentView.addSubview(nameLab)
        contentView.addSubview(iconView)
        contentView.addSubview(bindBtn)
        contentView.addSubview(lineView)
        
        iconView.snp.makeConstraints { (make) in
            make.left.equalTo(kMargin)
            make.centerY.equalTo(contentView)
            make.height.equalTo(25)
            make.width.equalTo(25)
        }
        nameLab.snp.makeConstraints { (make) in
            make.left.equalTo(iconView.snp.right).offset(kMargin)
            make.top.equalTo(contentView)
            make.right.equalTo(bindBtn.snp.left).offset(-kMargin)
            make.bottom.equalTo(lineView.snp.top)
        }
        bindBtn.snp.makeConstraints { (make) in
            make.centerY.equalTo(contentView)
            make.right.equalTo(-kMargin)
            make.size.equalTo(CGSize.init(width: 60, height: 24))
        }
        lineView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(contentView)
            make.height.equalTo(klineWidth)
        }
    }
    
    /// 图标
    lazy var iconView: UIImageView = UIImageView.init(image: UIImage.init(named: "icon_account_wechat"))
    /// cell title
    lazy var nameLab : UILabel = {
        let lab = UILabel()
        lab.font = k15Font
        lab.textColor = kBlackFontColor
        
        return lab
    }()
    
    /// 绑定
    lazy var bindBtn : UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.backgroundColor = kBackgroundColor
        btn.titleLabel?.font = k12Font
        btn.setTitleColor(kBlackFontColor, for: .normal)
        btn.setTitle("绑定", for: .normal)
        btn.cornerRadius = 12
        
        return btn
    }()
    /// 分割线
    var lineView : UIView = {
        let line = UIView()
        line.backgroundColor = kGrayLineColor
        return line
    }()
}
