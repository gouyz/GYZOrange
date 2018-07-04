//
//  ORHomeCell.swift
//  Orange
//
//  Created by gouyz on 2018/7/4.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class ORHomeCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = kBackgroundColor
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        
        contentView.addSubview(bgView)
        bgView.backgroundColor = kWhiteColor
        
        bgView.addSubview(userImgView)
        bgView.addSubview(nameLab)
        bgView.addSubview(addressTagImgView)
        bgView.addSubview(addressLab)
        bgView.addSubview(moreImgView)
        
        bgView.addSubview(videoImgView)
        videoImgView.addSubview(playImgView)
        videoImgView.addSubview(videoTagImgView)
        
        bgView.addSubview(photosImgView)
        
        bgView.addSubview(likesView)
        bgView.addSubview(commentView)
        bgView.addSubview(sharedView)
        
        bgView.addSubview(desLab)
        bgView.addSubview(timeLab)
        
        bgView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(contentView)
            make.top.equalTo(kMargin)
        }
        
        userImgView.snp.makeConstraints { (make) in
            make.left.equalTo(kMargin)
            make.top.equalTo(kMargin)
            make.size.equalTo(CGSize.init(width: 30, height: 30))
        }
        nameLab.snp.makeConstraints { (make) in
            make.left.equalTo(userImgView.snp.right).offset(5)
            make.top.equalTo(userImgView)
            make.right.equalTo(moreImgView.snp.left).offset(-kMargin)
            make.height.equalTo(15)
        }
        addressTagImgView.snp.makeConstraints { (make) in
            make.left.equalTo(nameLab)
            make.centerY.equalTo(addressLab)
            make.size.equalTo(CGSize.init(width: 9, height: 12))
        }
        addressLab.snp.makeConstraints { (make) in
            make.left.equalTo(addressTagImgView.snp.right).offset(5)
            make.top.equalTo(nameLab.snp.bottom)
            make.right.height.equalTo(nameLab)
        }
        moreImgView.snp.makeConstraints { (make) in
            make.right.equalTo(-kMargin)
            make.centerY.equalTo(userImgView)
            make.size.equalTo(CGSize.init(width: 20, height: 5))
        }
        videoImgView.snp.makeConstraints { (make) in
            make.left.right.equalTo(bgView)
            make.top.equalTo(userImgView.snp.bottom).offset(kMargin)
            make.height.equalTo(kScreenWidth)
        }
        photosImgView.snp.makeConstraints { (make) in
            make.left.right.equalTo(bgView)
            make.top.equalTo(userImgView.snp.bottom).offset(kMargin)
            make.height.equalTo(kScreenWidth)
        }
        
        playImgView.snp.makeConstraints { (make) in
            make.center.equalTo(videoImgView)
            make.size.equalTo(CGSize.init(width: kTitleHeight, height: kTitleHeight))
        }
        videoTagImgView.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.bottom.equalTo(-15)
            make.size.equalTo(CGSize.init(width: 24, height: 24))
        }
        sharedView.snp.makeConstraints { (make) in
            make.right.equalTo(-5)
            make.bottom.equalTo(desLab.snp.top).offset(-5)
            make.height.equalTo(34)
            make.width.equalTo(30)
        }
        commentView.snp.makeConstraints { (make) in
            make.right.width.height.equalTo(sharedView)
            make.bottom.equalTo(sharedView.snp.top).offset(-kMargin)
        }
        likesView.snp.makeConstraints { (make) in
            make.right.width.height.equalTo(sharedView)
            make.bottom.equalTo(commentView.snp.top).offset(-kMargin)
        }
        desLab.snp.makeConstraints { (make) in
            make.left.equalTo(kMargin)
            make.top.equalTo(videoImgView.snp.bottom).offset(5)
            make.right.equalTo(-kMargin)
        }
        timeLab.snp.makeConstraints { (make) in
            make.left.right.equalTo(desLab)
            make.top.equalTo(desLab.snp.bottom)
            make.height.equalTo(20)
            make.bottom.equalTo(-kMargin)
        }
        
    }
    
    lazy var bgView : UIView = UIView()
    
    /// 用户头像图片
    lazy var userImgView : UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage.init(named: "icon_header_default")
        imgView.cornerRadius = 15
        
        return imgView
    }()
    /// 用户名称
    lazy var nameLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kBlackFontColor
        lab.font = k13Font
        lab.text = "爱凤梨"
        
        return lab
    }()
    
    /// 地址标记
    lazy var addressTagImgView : UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage.init(named: "icon_address_tag")
        
        return imgView
    }()
    /// 地址
    lazy var addressLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kHeightGaryFontColor
        lab.font = k12Font
        lab.text = "常州.南大街"
        
        return lab
    }()
    /// 更多
    lazy var moreImgView: UIImageView = UIImageView.init(image: UIImage.init(named: "icon_more_black"))
    
    /// 图片
    lazy var videoImgView : UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage.init(named: "icon_home_default")
        
        return imgView
    }()
    
    ///
    lazy var photosImgView: ZCycleView = {
        let adsView = ZCycleView()
        adsView.isAutomatic = false
        adsView.setImagesGroup([#imageLiteral(resourceName: "icon_home_default"),#imageLiteral(resourceName: "icon_home_default"),#imageLiteral(resourceName: "icon_home_default")])
        adsView.pageControlAlignment = .center
        adsView.pageControlIndictirColor = kWhiteColor
        adsView.pageControlCurrentIndictirColor = kYellowFontColor
        adsView.scrollDirection = .horizontal
        
        return adsView
    }()
    /// 描述
    lazy var desLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kHeightGaryFontColor
        lab.font = k13Font
        lab.numberOfLines = 0
        lab.text = "春日的阳光春日的阳光春日的阳光春日的阳光春日的阳光春日的阳光"
        
        return lab
    }()
    
    /// 时间
    lazy var timeLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kHeightGaryFontColor
        lab.font = k13Font
        lab.text = "30分钟前"
        
        return lab
    }()
    /// 评论
    lazy var commentView: GYZImgAndTxtBtnView = {
        
        let view = GYZImgAndTxtBtnView()
        view.menuImg.image = UIImage.init(named: "icon_conment_white")
        view.menuTitle.text = "266"
        view.menuTitle.textColor = kWhiteColor
        
        return view
        
    }()
    /// 喜欢
    lazy var likesView: GYZImgAndTxtBtnView = {
        
        let view = GYZImgAndTxtBtnView()
        view.menuImg.image = UIImage.init(named: "icon_heart_white")
        view.menuTitle.text = "1K+"
        view.menuTitle.textColor = kWhiteColor
        
        return view
        
    }()
    /// 分享
    lazy var sharedView: GYZImgAndTxtBtnView = {
        
        let view = GYZImgAndTxtBtnView()
        view.menuImg.image = UIImage.init(named: "icon_transmit_white")
        view.menuTitle.text = "676"
        view.menuTitle.textColor = kWhiteColor
        
        return view
        
    }()
    
    /// 声音标记
    lazy var videoTagImgView : UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage.init(named: "icon_laba_white")
        
        return imgView
    }()
    /// 播放图片
    lazy var playImgView : UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage.init(named: "icon_video_play")
        
        return imgView
    }()

}
