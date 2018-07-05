//
//  ORMyQrcodeVC.swift
//  Orange
//  我的二维码
//  Created by gouyz on 2018/7/5.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class ORMyQrcodeVC: GYZBaseVC {
    
    /// 生成二维码内容
    let qrCodeConment: String = "测试一下"
    let qrcodeWidth: CGFloat = kScreenWidth - 80

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "我的二维码"
        self.view.backgroundColor = kWhiteColor
        
        setUpUI()
        logoImgView.image = qrCodeConment.generateQRCode(size: qrcodeWidth, logo: UIImage.init(named: "icon_header_default"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpUI(){
        
        view.addSubview(bgView)
        bgView.addSubview(userImgView)
        bgView.addSubview(nameLab)
        bgView.addSubview(logoImgView)
        
        bgView.snp.makeConstraints { (make) in
            make.top.equalTo(kTitleAndStateHeight + kTitleHeight)
            make.left.equalTo(30)
            make.right.equalTo(-30)
            make.height.equalTo(qrcodeWidth + kMargin * 3 + kTitleHeight)
        }
        
        userImgView.snp.makeConstraints { (make) in
            make.left.equalTo(kMargin)
            make.top.equalTo(kMargin)
            make.size.equalTo(CGSize.init(width: kTitleHeight, height: kTitleHeight))
        }
        nameLab.snp.makeConstraints { (make) in
            make.left.equalTo(userImgView.snp.right).offset(kMargin)
            make.top.height.equalTo(userImgView)
            make.right.equalTo(-kMargin)
        }
        
        logoImgView.snp.makeConstraints { (make) in
            make.left.equalTo(kMargin)
            make.right.equalTo(-kMargin)
            make.bottom.equalTo(-kMargin)
            make.top.equalTo(userImgView.snp.bottom).offset(kMargin)
        }
    }
    
    lazy var bgView: UIView = {
        
        let view = UIView()
        view.borderColor = kYellowFontColor
        view.borderWidth = klineWidth
        
        return view
    }()
    
    lazy var userImgView : UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage.init(named: "icon_header_default")
        imgView.cornerRadius = 22
        
        return imgView
    }()
    /// 姓名
    lazy var nameLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kBlackFontColor
        lab.font = k15Font
        lab.text = "小胖子"
        
        return lab
    }()
    /// 生成二维码logo
    lazy var logoImgView: UIImageView = UIImageView()
}
