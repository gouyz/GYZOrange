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

        self.title = "登 录"
        
        setupUI()
        
        let defaultAccount = userDefaults.object(forKey: "defaultAccount")
        if defaultAccount != nil {
            phoneInputView.textFiled.text = defaultAccount as! String?
        }
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
        bgView.addSubview(lineView1)
        view.addSubview(loginBtn)
        view.addSubview(registerBtn)
        
        
        phoneInputView.snp.makeConstraints { (make) in
            make.top.equalTo(kTitleAndStateHeight)
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
            make.bottom.equalTo(lineView1.snp.top)
        }
        lineView1.snp.makeConstraints { (make) in
            make.left.right.equalTo(lineView)
            make.bottom.equalTo(bgView)
            make.height.equalTo(lineView)
        }
        codeBtn.snp.makeConstraints { (make) in
            make.centerY.equalTo(bgView)
            make.right.equalTo(bgView).offset(-kMargin)
            make.size.equalTo(CGSize.init(width: 100, height: 30))
        }
        
        loginBtn.snp.makeConstraints { (make) in
            make.top.equalTo(bgView.snp.bottom).offset(kTitleHeight)
            make.left.equalTo(view).offset(20)
            make.right.equalTo(view).offset(-20)
            make.height.equalTo(kUIButtonHeight)
        }
        registerBtn.snp.makeConstraints { (make) in
            make.right.equalTo(loginBtn)
            make.top.equalTo(loginBtn.snp.bottom).offset(kMargin)
            make.size.equalTo(CGSize.init(width: 80, height: 30))
        }
        
    }
    /// 手机号
    fileprivate lazy var phoneInputView : LHSLoginInputView = LHSLoginInputView(iconName: "icon_login_phone", placeHolder: "请输入手机号码", isPhone: true)
    
    /// 分割线
    fileprivate lazy var lineView : UIView = {
        let line = UIView()
        line.backgroundColor = kGrayLineColor
        return line
    }()
    /// 验证码
    fileprivate lazy var codeInputView : LHSLoginInputView = LHSLoginInputView(iconName: "icon_code", placeHolder: "请输入验证码", isPhone: true)
    
    /// 分割线2
    fileprivate lazy var lineView1 : UIView = {
        let line = UIView()
        line.backgroundColor = kGrayLineColor
        return line
    }()
    fileprivate lazy var bgView: UIView = {
        let view = UIView()
        view.backgroundColor = kWhiteColor
        return view
    }()
    /// 获取验证码按钮
    fileprivate lazy var codeBtn : UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.setTitle("发送验证码", for: .normal)
        btn.setTitleColor(kWhiteColor, for: .normal)
        btn.titleLabel?.font = k14Font
        btn.titleLabel?.textAlignment = .center
        btn.backgroundColor = kBtnClickBGColor
        btn.addTarget(self, action: #selector(clickedCodeBtn), for: .touchUpInside)
        
        btn.cornerRadius = kCornerRadius
        
        return btn
    }()
    
    /// 登录按钮
    fileprivate lazy var loginBtn : UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.backgroundColor = kBtnClickBGColor
        btn.setTitle("登  录", for: .normal)
        btn.setTitleColor(kWhiteColor, for: .normal)
        btn.titleLabel?.font = k15Font
        
        btn.addTarget(self, action: #selector(clickedLoginBtn), for: .touchUpInside)
        btn.cornerRadius = kCornerRadius
        return btn
    }()
    /// 注册按钮
    fileprivate lazy var registerBtn : UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.setTitle("立即注册", for: .normal)
        btn.setTitleColor(kGreenFontColor, for: .normal)
        btn.titleLabel?.font = k15Font
        
        btn.addTarget(self, action: #selector(clickedRegisterBtn), for: .touchUpInside)
        return btn
    }()
    /// 开启懒社
    @objc func clickedLoginBtn(){
        
        hiddenKeyBoard()
        
        if !validPhoneNO() {
            return
        }
        if codeInputView.textFiled.text!.isEmpty {
            MBProgressHUD.showAutoDismissHUD(message: "请输入验证码")
            return
        }
        
        requestLogin()
    }
    
    /// 注册
    @objc func clickedRegisterBtn(){
        let vc = PWRegisterVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    /// 获取验证码
    @objc func clickedCodeBtn(){
        hiddenKeyBoard()
        
        if validPhoneNO() {
            requestCode()
        }
    }
    /// 隐藏键盘
    func hiddenKeyBoard(){
        phoneInputView.textFiled.resignFirstResponder()
        codeInputView.textFiled.resignFirstResponder()
    }
    /// 判断手机号是否有效
    ///
    /// - Returns:
    func validPhoneNO() -> Bool{
        
        if phoneInputView.textFiled.text!.isEmpty {
            MBProgressHUD.showAutoDismissHUD(message: "请输入手机号")
            return false
        }
        if phoneInputView.textFiled.text!.isMobileNumber(){
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
        
        GYZNetWork.requestNetwork("dealer/login.do", parameters: ["mobile":phoneInputView.textFiled.text!,"code": codeInputView.textFiled.text!],  success: { (response) in
            
            weakSelf?.hud?.hide(animated: true)
            GYZLog(response)
            if response["code"].intValue == kQuestSuccessTag{//请求成功
                
                userDefaults.set(self.phoneInputView.textFiled.text!, forKey: "defaultAccount")//记录登录的账号
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
        
        GYZNetWork.requestNetwork("pur/sendMsg.do", parameters: ["phoneNumber":phoneInputView.textFiled.text!],  success: { (response) in
            
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
}

