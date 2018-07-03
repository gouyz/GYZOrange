//
//  ORBindPhoneVC.swift
//  Orange
//  绑定手机号
//  Created by gouyz on 2018/7/3.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class ORBindPhoneVC: GYZBaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "绑定手机号"
        setupUI()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /// 创建UI
    fileprivate func setupUI(){
        
        view.addSubview(phoneInputView)
        view.addSubview(lineView)
        view.addSubview(bgView)
        bgView.addSubview(codeInputView)
        bgView.addSubview(codeBtn)
        view.addSubview(okBtn)
        
        
        phoneInputView.snp.makeConstraints { (make) in
            
            make.top.equalTo(kTitleAndStateHeight * 2)
            make.left.right.equalTo(view)
            make.height.equalTo(kBottomTabbarHeight)
        }
        lineView.snp.makeConstraints { (make) in
            make.left.right.equalTo(view)
            make.top.equalTo(phoneInputView.snp.bottom)
            make.height.equalTo(klineWidth)
        }
        bgView.snp.makeConstraints { (make) in
            make.top.equalTo(lineView.snp.bottom)
            make.left.right.equalTo(phoneInputView)
            make.height.equalTo(phoneInputView)
        }
        codeInputView.snp.makeConstraints { (make) in
            make.top.equalTo(bgView)
            make.left.equalTo(bgView)
            make.right.equalTo(codeBtn.snp.left).offset(-kMargin)
            make.bottom.equalTo(bgView)
        }
        codeBtn.snp.makeConstraints { (make) in
            make.centerY.equalTo(bgView)
            make.right.equalTo(bgView).offset(-kMargin)
            make.size.equalTo(CGSize.init(width: 90, height: 30))
        }
        okBtn.snp.makeConstraints { (make) in
            make.top.equalTo(bgView.snp.bottom).offset(kTitleHeight)
            make.left.equalTo(view).offset(20)
            make.right.equalTo(view).offset(-20)
            make.height.equalTo(kUIButtonHeight)
        }
        
    }
    /// 手机号
    fileprivate lazy var phoneInputView : LHSLoginInputView = LHSLoginInputView(iconName: "icon_phone", placeHolder: "请输入手机号码", isPhone: true)
    
    /// 分割线
    fileprivate lazy var lineView : UIView = {
        let line = UIView()
        line.backgroundColor = kGrayLineColor
        return line
    }()
    /// 验证码
    fileprivate lazy var codeInputView : LHSLoginInputView = LHSLoginInputView(iconName: "icon_code", placeHolder: "请输入验证码", isPhone: true)
    
    fileprivate lazy var bgView: UIView = {
        let view = UIView()
        view.backgroundColor = kWhiteColor
        return view
    }()
    /// 获取验证码按钮
    fileprivate lazy var codeBtn : UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.setTitle("发送验证码", for: .normal)
        btn.setTitleColor(kHeightGaryFontColor, for: .normal)
        btn.titleLabel?.font = k13Font
        btn.titleLabel?.textAlignment = .center
        btn.backgroundColor = kWhiteColor
        btn.addTarget(self, action: #selector(clickedCodeBtn), for: .touchUpInside)
        
        btn.cornerRadius = kCornerRadius
        btn.borderColor = kHeightGaryFontColor
        btn.borderWidth = klineWidth
        
        return btn
    }()
    
    /// 确定按钮
    fileprivate lazy var okBtn : UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.backgroundColor = kBtnClickBGColor
        btn.setTitle("确 定", for: .normal)
        btn.setTitleColor(kWhiteColor, for: .normal)
        btn.titleLabel?.font = k15Font
        
        btn.addTarget(self, action: #selector(clickedOKBtn), for: .touchUpInside)
        btn.cornerRadius = 22
        return btn
    }()
    
    /// 确定
    @objc func clickedOKBtn(){
        
    }
    /// 获取验证码
    @objc func clickedCodeBtn(){
//        hiddenKeyBoard()
        
        codeBtn.startSMSWithDuration(duration: 60)
        //        if validPhoneNO() {
        //            requestCode()
        //        }
    }
}
