//
//  ORMyLikesDetailCell.swift
//  Orange
//  我喜欢的详情cell
//  Created by gouyz on 2018/7/6.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class ORMyLikesDetailCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = kWhiteColor
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        
        contentView.addSubview(userImgView)
        contentView.addSubview(nameLab)
        contentView.addSubview(addressTagImgView)
        contentView.addSubview(addressLab)
        contentView.addSubview(moreImgView)
        
        contentView.addSubview(videoImgView)
        videoImgView.addSubview(playImgView)
        videoImgView.addSubview(videoTagImgView)
        
        contentView.addSubview(photosImgView)
        
        contentView.addSubview(desLab)
        contentView.addSubview(timeLab)
        
        contentView.addSubview(likesView)
        contentView.addSubview(commentView)
        contentView.addSubview(sharedView)
        
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
            make.left.right.equalTo(contentView)
            make.top.equalTo(userImgView.snp.bottom).offset(kMargin)
            make.height.equalTo(kScreenWidth)
        }
        photosImgView.snp.makeConstraints { (make) in
            make.left.right.equalTo(contentView)
            make.top.equalTo(userImgView.snp.bottom).offset(kMargin)
            make.height.equalTo(kScreenWidth)
        }
        
        playImgView.snp.makeConstraints { (make) in
            make.center.equalTo(videoImgView)
            make.size.equalTo(CGSize.init(width: 60, height: 60))
        }
        videoTagImgView.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.bottom.equalTo(-15)
            make.size.equalTo(CGSize.init(width: 24, height: 24))
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
        }
        likesView.snp.makeConstraints { (make) in
            make.top.width.height.equalTo(commentView)
            make.right.equalTo(commentView.snp.left).offset(-30)
        }
        commentView.snp.makeConstraints { (make) in
            make.top.equalTo(timeLab.snp.bottom).offset(kMargin)
            make.centerX.equalTo(contentView)
            make.height.equalTo(34)
            make.width.equalTo(30)
            make.bottom.equalTo(-kMargin)
        }
        sharedView.snp.makeConstraints { (make) in
            make.top.width.height.equalTo(commentView)
            make.left.equalTo(commentView.snp.right).offset(30)
        }
        
    }
    
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
        view.menuImg.image = UIImage.init(named: "icon_conment_gray")
        view.menuTitle.text = "266"
        view.menuTitle.textColor = kHeightGaryFontColor
        
        return view
        
    }()
    /// 喜欢
    lazy var likesView: GYZImgAndTxtBtnView = {
        
        let view = GYZImgAndTxtBtnView()
        view.menuImg.image = UIImage.init(named: "icon_heart_red")
        view.menuTitle.text = "1K+"
        view.menuTitle.textColor = kHeightGaryFontColor
        
        return view
        
    }()
    /// 分享
    lazy var sharedView: GYZImgAndTxtBtnView = {
        
        let view = GYZImgAndTxtBtnView()
        view.menuImg.image = UIImage.init(named: "icon_transmit_gray")
        view.menuTitle.text = "676"
        view.menuTitle.textColor = kHeightGaryFontColor
        
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
