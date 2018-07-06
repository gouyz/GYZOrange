//
//  ORSearchUserCell.swift
//  Orange
//  搜索用户 cell
//  Created by gouyz on 2018/7/6.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class ORSearchUserCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = kWhiteColor
        setupUI()
        addBtn.set(image: UIImage.init(named: "icon_add_orange"), title: "加关注", titlePosition: .right, additionalSpacing: 5, state: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        
        contentView.addSubview(userHeaderView)
        contentView.addSubview(nameLab)
        contentView.addSubview(noteLab)
        contentView.addSubview(addBtn)
        contentView.addSubview(lineView)
        
        userHeaderView.snp.makeConstraints { (make) in
            make.left.equalTo(kMargin)
            make.centerY.equalTo(contentView)
            make.size.equalTo(CGSize.init(width: 60, height: 60))
        }
        nameLab.snp.makeConstraints { (make) in
            make.left.equalTo(userHeaderView.snp.right).offset(5)
            make.top.equalTo(userHeaderView)
            make.right.equalTo(addBtn.snp.left).offset(-kMargin)
            make.height.equalTo(30)
        }
        noteLab.snp.makeConstraints { (make) in
            make.left.right.equalTo(nameLab)
            make.top.equalTo(nameLab.snp.bottom)
            make.height.equalTo(20)
        }
        addBtn.snp.makeConstraints { (make) in
            make.right.equalTo(-kMargin)
            make.centerY.equalTo(userHeaderView)
            make.size.equalTo(CGSize.init(width: 80, height: 30))
        }
        lineView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(contentView)
            make.height.equalTo(klineWidth)
        }
    }
    /// 图片
    lazy var userHeaderView : UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage.init(named: "icon_header_default")
        imgView.cornerRadius = 30
        
        return imgView
    }()
    /// 名称
    lazy var nameLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kBlackFontColor
        lab.font = k15Font
        lab.text = "红心苹果"
        
        return lab
    }()
    
    /// 签名
    lazy var noteLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kHeightGaryFontColor
        lab.font = k13Font
        lab.text = "不忘初心，无畏西东"
        
        return lab
    }()
    /// 加关注
    lazy var addBtn : UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.backgroundColor = kWhiteColor
        btn.setTitleColor(kHeightGaryFontColor, for: .normal)
        btn.titleLabel?.font = k12Font
        btn.borderColor = kBtnClickBGColor
        btn.borderWidth = klineDoubleWidth
        
        btn.cornerRadius = 12
        return btn
    }()
    
    lazy var lineView: UIView = {
        let line = UIView()
        line.backgroundColor = kGrayLineColor
        
        return line
    }()
}
