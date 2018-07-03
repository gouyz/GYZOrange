//
//  LHSQuickLoginVC.swift
//  LazyHuiUser
//  快捷登录
//  Created by gouyz on 2018/4/9.
//  Copyright © 2018年 jh. All rights reserved.
//

import UIKit
import MBProgressHUD

class LHSQuickLoginVC: GYZBaseVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navBarBgAlpha = 0
        setupUI()
        
        bgImgView.isUserInteractionEnabled = true
        let defaultAccount = userDefaults.object(forKey: "defaultAccount")
        if defaultAccount != nil {
            phoneTxtFiled.text = defaultAccount as! String?
        }
        let content: String = "注册登录即同意《用户使用协议》"
        let contentAttr : NSMutableAttributedString = NSMutableAttributedString(string: content)
        contentAttr.addAttribute(NSAttributedStringKey.foregroundColor, value: kYellowFontColor, range: NSMakeRange(7, content.count - 7))
        ruleLab.attributedText = contentAttr
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /// 创建UI
    fileprivate func setupUI(){
        
        view.addSubview(bgImgView)
        bgImgView.addSubview(bgView)
        bgView.addSubview(phoneTxtFiled)
        bgView.addSubview(lineView)
        bgView.addSubview(codeTxtFiled)
        bgView.addSubview(codeBtn)
        bgView.addSubview(lineView1)
        bgView.addSubview(loginBtn)
        bgView.addSubview(lineView3)
        bgView.addSubview(desLab)
        bgView.addSubview(lineView4)
        
        bgImgView.addSubview(qqImgView)
        bgImgView.addSubview(weChatImgView)
        bgImgView.addSubview(sinaImgView)
        bgImgView.addSubview(ruleLab)
        
        bgImgView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
        bgView.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.centerY.equalTo(bgImgView.snp.centerY)
            make.height.equalTo(260)
        }
        phoneTxtFiled.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.equalTo(kTitleHeight)
            make.height.equalTo(kTitleHeight)
        }
        lineView.snp.makeConstraints { (make) in
            make.left.right.equalTo(phoneTxtFiled)
            make.top.equalTo(phoneTxtFiled.snp.bottom)
            make.height.equalTo(klineWidth)
        }
        codeTxtFiled.snp.makeConstraints { (make) in
            make.left.height.equalTo(phoneTxtFiled)
            make.top.equalTo(lineView.snp.bottom)
            make.right.equalTo(codeBtn.snp.left).offset(-5)
        }
        lineView1.snp.makeConstraints { (make) in
            make.left.right.equalTo(codeTxtFiled)
            make.top.equalTo(codeTxtFiled.snp.bottom)
            make.height.equalTo(lineView)
        }
        codeBtn.snp.makeConstraints { (make) in
            make.right.equalTo(phoneTxtFiled)
            make.centerY.equalTo(codeTxtFiled)
            make.width.equalTo(90)
            make.height.equalTo(30)
        }
        loginBtn.snp.makeConstraints { (make) in
            make.left.right.equalTo(phoneTxtFiled)
            make.top.equalTo(lineView1.snp.bottom).offset(30)
            make.height.equalTo(40)
        }
        desLab.snp.makeConstraints { (make) in
            make.centerX.bottom.equalTo(bgView)
            make.width.equalTo(90)
            make.height.equalTo(20)
        }
        lineView3.snp.makeConstraints { (make) in
            make.left.height.equalTo(lineView)
            make.centerY.equalTo(desLab)
            make.right.equalTo(desLab.snp.left)
        }
        lineView4.snp.makeConstraints { (make) in
            make.left.equalTo(desLab.snp.right)
            make.right.height.equalTo(lineView)
            make.centerY.equalTo(desLab)
        }
        
        qqImgView.snp.makeConstraints { (make) in
            make.right.equalTo(weChatImgView.snp.left).offset(-20)
            make.top.size.equalTo(weChatImgView)
        }
        weChatImgView.snp.makeConstraints { (make) in
            make.centerX.equalTo(bgImgView)
            make.top.equalTo(bgView.snp.bottom).offset(30)
            make.size.equalTo(CGSize.init(width: 60, height: 60))
        }
        sinaImgView.snp.makeConstraints { (make) in
            make.left.equalTo(weChatImgView.snp.right).offset(20)
            make.top.size.equalTo(weChatImgView)
        }
        
        ruleLab.snp.makeConstraints { (make) in
            make.centerX.equalTo(bgImgView)
            make.top.equalTo(qqImgView.snp.bottom).offset(kMargin)
            make.height.equalTo(30)
            make.width.equalTo(200)
        }
    }
    
    lazy var bgImgView: UIImageView = UIImageView.init(image: UIImage.init(named: "icon_login_bg"))
    /// 手机号
    lazy var phoneTxtFiled : UITextField = {
        
        let textFiled = UITextField()
        textFiled.font = k15Font
        textFiled.textColor = kBlackFontColor
        textFiled.keyboardType = .numberPad
        textFiled.clearButtonMode = .whileEditing
//        textFiled.placeholder = "请输入手机号码"
        //字体颜色
        textFiled.attributedPlaceholder = NSAttributedString.init(string: "请输入手机号码", attributes: [NSAttributedStringKey.foregroundColor : kWhiteColor])
        
        return textFiled
    }()
    
    /// 分割线
    fileprivate lazy var lineView : UIView = {
        let line = UIView()
        line.backgroundColor = kWhiteColor
        return line
    }()
    /// 验证码
    lazy var codeTxtFiled : UITextField = {
        
        let textFiled = UITextField()
        textFiled.font = k15Font
        textFiled.textColor = kBlackFontColor
        textFiled.keyboardType = .numberPad
        textFiled.clearButtonMode = .whileEditing
//        textFiled.placeholder = "请输入验证码"
        //字体颜色
        textFiled.attributedPlaceholder = NSAttributedString.init(string: "请输入验证码", attributes: [NSAttributedStringKey.foregroundColor : kWhiteColor])
        
        return textFiled
    }()
    
    /// 分割线2
    fileprivate lazy var lineView1 : UIView = {
        let line = UIView()
        line.backgroundColor = kWhiteColor
        return line
    }()
    fileprivate lazy var bgView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.RGBAColor(0, g: 0, b: 0, a: 0.2)
        view.cornerRadius = kCornerRadius
        
        return view
    }()
    /// 获取验证码按钮
    fileprivate lazy var codeBtn : UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.setTitle("发送验证码", for: .normal)
        btn.setTitleColor(kWhiteColor, for: .normal)
        btn.titleLabel?.font = k13Font
        btn.titleLabel?.textAlignment = .center
        btn.borderColor = kWhiteColor
        btn.borderWidth = klineWidth
        btn.addTarget(self, action: #selector(clickedCodeBtn), for: .touchUpInside)
        
        btn.cornerRadius = kCornerRadius
        
        return btn
    }()
    
    /// 登录按钮
    fileprivate lazy var loginBtn : UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.backgroundColor = kBtnClickBGColor
        btn.setTitle("立即登录", for: .normal)
        btn.setTitleColor(kWhiteColor, for: .normal)
        btn.titleLabel?.font = k15Font
        
        btn.addTarget(self, action: #selector(clickedLoginBtn), for: .touchUpInside)
        btn.cornerRadius = 20
        return btn
    }()
    
    /// 分割线
    fileprivate lazy var lineView3 : UIView = {
        let line = UIView()
        line.backgroundColor = kWhiteColor
        return line
    }()
    ///
    lazy var desLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kWhiteColor
        lab.font = k13Font
        lab.text = "其他登录方式"
        lab.textAlignment = .center
        
        return lab
    }()
    /// 分割线
    fileprivate lazy var lineView4 : UIView = {
        let line = UIView()
        line.backgroundColor = kWhiteColor
        return line
    }()
    /// QQ
    lazy var qqImgView: UIImageView = {
        let imgView = UIImageView.init(image: UIImage.init(named: "icon_login_qq"))
        imgView.tag = 101
        imgView.addOnClickListener(target: self, action: #selector(onThirdLoginClicked(sender:)))
        
        return imgView
    }()
    /// 微信
    lazy var weChatImgView: UIImageView = {
        let imgView = UIImageView.init(image: UIImage.init(named: "icon_login_wechat"))
        imgView.tag = 102
        imgView.addOnClickListener(target: self, action: #selector(onThirdLoginClicked(sender:)))
        
        return imgView
    }()
    /// 新浪
    lazy var sinaImgView: UIImageView = {
        let imgView = UIImageView.init(image: UIImage.init(named: "icon_login_sina"))
        imgView.tag = 103
        imgView.addOnClickListener(target: self, action: #selector(onThirdLoginClicked(sender:)))
        
        return imgView
    }()
    
    /// 注册协议
    lazy var ruleLab : UILabel = {
        let lab = UILabel()
        lab.font = k13Font
        lab.textColor = kWhiteColor
        
        return lab
    }()
    
    /// 登录
    @objc func clickedLoginBtn(){
        
        KeyWindow.rootViewController = GYZMainTabBarVC()
        
//        hiddenKeyBoard()
//
//        if !validPhoneNO() {
//            return
//        }
//        if codeTxtFiled.text!.isEmpty {
//            MBProgressHUD.showAutoDismissHUD(message: "请输入验证码")
//            return
//        }
        
//        requestLogin()
    }
    
    
    /// 获取验证码
    @objc func clickedCodeBtn(){
        hiddenKeyBoard()
        
        codeBtn.startSMSWithDuration(duration: 60)
//        if validPhoneNO() {
//            requestCode()
//        }
    }
    /// 隐藏键盘
    func hiddenKeyBoard(){
        phoneTxtFiled.resignFirstResponder()
        codeTxtFiled.resignFirstResponder()
    }
    /// 判断手机号是否有效
    ///
    /// - Returns:
    func validPhoneNO() -> Bool{
        
        if phoneTxtFiled.text!.isEmpty {
            MBProgressHUD.showAutoDismissHUD(message: "请输入手机号")
            return false
        }
        if phoneTxtFiled.text!.isMobileNumber(){
            return true
        }else{
            MBProgressHUD.showAutoDismissHUD(message: "请输入正确的手机号")
            return false
        }
        
    }
    
    /// 登录
    func requestLogin(){
        
        if !GYZTool.checkNetWork() {
            return
        }
        
        weak var weakSelf = self
        createHUD(message: "登录中...")
        
        GYZNetWork.requestNetwork("dealer/login.do", parameters: ["mobile":phoneTxtFiled.text!,"code": codeTxtFiled.text!],  success: { (response) in
            
            weakSelf?.hud?.hide(animated: true)
            GYZLog(response)
            if response["code"].intValue == kQuestSuccessTag{//请求成功
                
                userDefaults.set(weakSelf?.phoneTxtFiled.text!, forKey: "defaultAccount")//记录登录的账号
                userDefaults.set(true, forKey: kIsLoginTagKey)//是否登录标识
                
                guard let data = response["data"].dictionaryObject else { return }
                ///保存用户信息
                GYZTool.saveUserInfo(userModel: LHSUserInfoModel.init(dict: data))
                
                ///极光推送设置别名
                //                JPUSHService.setTags(nil, alias: data["id"].stringValue, fetchCompletionHandle: { (code, tags, alias) in
                //
                //                    NSLog("code:\(code)")
                //                })
                KeyWindow.rootViewController = GYZMainTabBarVC()
            }else{
                MBProgressHUD.showAutoDismissHUD(message: response["message"].stringValue)
            }
            
        }, failture: { (error) in
            weakSelf?.hud?.hide(animated: true)
            GYZLog(error)
        })
    }
    ///获取验证码
    func requestCode(){
        
        if !(networkManager?.isReachable)! {
            MBProgressHUD.showCustomTimeHUD(message: kNoNetWork, time: 3.0)
            return
        }
        
        weak var weakSelf = self
        createHUD(message: "获取中...")
        
        GYZNetWork.requestNetwork("pur/sendMsg.do", parameters: ["phoneNumber":phoneTxtFiled.text!],  success: { (response) in
            
            weakSelf?.hud?.hide(animated: true)
            GYZLog(response)
            if response["code"].intValue == kQuestSuccessTag{//请求成功
                weakSelf?.codeBtn.startSMSWithDuration(duration: 60)
                
            }else{
                MBProgressHUD.showAutoDismissHUD(message: response["message"].stringValue)
            }
            
        }, failture: { (error) in
            weakSelf?.hud?.hide(animated: true)
            GYZLog(error)
        })
    }
    
    /// 第三方登录
    @objc func onThirdLoginClicked(sender: UITapGestureRecognizer){
        let phoneVC = ORBindPhoneVC()
        navigationController?.pushViewController(phoneVC, animated: true)
    }
}

