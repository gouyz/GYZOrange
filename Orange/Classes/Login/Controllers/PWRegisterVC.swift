//
//  PWRegisterVC.swift
//  pureworks
//  注册
//  Created by gouyz on 2018/6/12.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit
import MBProgressHUD

class PWRegisterVC: GYZBaseVC {

    /// 服务中心list
    var serviceCenterList: [PWServiceCenterModel] = [PWServiceCenterModel]()
    /// 服务中心名称list
    var serviceCenterNameList: [String] = [String]()
    /// 选择的服务中心
    var mSelectServiceCenter: PWServiceCenterModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "注 册"
        
        setupUI()
        
        requestServiceCenter()
        
        let content: String = "注册即表示同意《纯大大经销商合作协议》"
        let contentAttr : NSMutableAttributedString = NSMutableAttributedString(string: content)
        contentAttr.addAttribute(NSAttributedStringKey.foregroundColor, value: kGreenFontColor, range: NSMakeRange(7, content.count - 7))
        ruleLab.attributedText = contentAttr
        
        serviceView.addOnClickListener(target: self, action: #selector(onClickedServiceCenter))
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
        view.addSubview(serviceView)
        serviceView.addSubview(serviceDesLab)
        serviceView.addSubview(serviceNameLab)
        serviceView.addSubview(rightIconView)
        view.addSubview(lineView2)
        view.addSubview(tgView)
        tgView.addSubview(tgCodeLab)
        tgView.addSubview(tgCodeFiled)
        view.addSubview(loginBtn)
        
        view.addSubview(tagImgView)
        view.addSubview(ruleLab)
        
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
        serviceView.snp.makeConstraints { (make) in
            make.left.right.equalTo(phoneInputView)
            make.height.equalTo(phoneInputView)
            make.top.equalTo(lineView1.snp.bottom)
        }
        serviceDesLab.snp.makeConstraints { (make) in
            make.left.equalTo(kMargin)
            make.top.bottom.equalTo(serviceView)
            make.width.equalTo(80)
        }
        serviceNameLab.snp.makeConstraints { (make) in
            make.right.equalTo(rightIconView.snp.left).offset(-5)
            make.left.equalTo(serviceDesLab.snp.right)
            make.top.bottom.equalTo(serviceDesLab)
        }
        rightIconView.snp.makeConstraints { (make) in
            make.centerY.equalTo(serviceView)
            make.right.equalTo(-kMargin)
            make.size.equalTo(CGSize.init(width: 7, height: 14))
        }
        lineView2.snp.makeConstraints { (make) in
            make.left.right.height.equalTo(lineView)
            make.top.equalTo(serviceView.snp.bottom)
        }
        tgView.snp.makeConstraints { (make) in
            make.left.right.height.equalTo(phoneInputView)
            make.top.equalTo(lineView2.snp.bottom)
        }
        tgCodeLab.snp.makeConstraints { (make) in
            make.left.equalTo(kMargin)
            make.top.bottom.equalTo(tgView)
            make.width.equalTo(80)
        }
        tgCodeFiled.snp.makeConstraints { (make) in
            make.left.equalTo(tgCodeLab.snp.right)
            make.top.height.equalTo(tgCodeLab)
            make.right.equalTo(-kMargin)
        }
        loginBtn.snp.makeConstraints { (make) in
            make.top.equalTo(tgCodeLab.snp.bottom).offset(kTitleHeight)
            make.left.equalTo(view).offset(20)
            make.right.equalTo(view).offset(-20)
            make.height.equalTo(kUIButtonHeight)
        }
        tagImgView.snp.makeConstraints { (make) in
            make.left.equalTo(loginBtn)
            make.centerY.equalTo(ruleLab)
            make.size.equalTo(CGSize.init(width: 15, height: 15))
        }
        
        ruleLab.snp.makeConstraints { (make) in
            make.left.equalTo(tagImgView.snp.right).offset(5)
            make.top.equalTo(loginBtn.snp.bottom).offset(kMargin)
            make.width.equalTo(260)
            make.height.equalTo(30)
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
    
    fileprivate lazy var serviceView: UIView = {
        let view = UIView()
        view.backgroundColor = kWhiteColor
        return view
    }()
    /// 服务中心
    lazy var serviceDesLab : UILabel = {
        let lab = UILabel()
        lab.font = k15Font
        lab.textColor = kBlackFontColor
        lab.text = "服务中心"
        
        return lab
    }()
    
    ///
    lazy var serviceNameLab : UILabel = {
        let lab = UILabel()
        lab.font = k15Font
        lab.textColor = kBlackFontColor
        lab.textAlignment = .right
        lab.text = "请选择服务中心"
        
        return lab
    }()
    /// 右侧箭头图标
    lazy var rightIconView: UIImageView = UIImageView.init(image: UIImage.init(named: "icon_right_gray"))
    /// 分割线3
    fileprivate lazy var lineView2 : UIView = {
        let line = UIView()
        line.backgroundColor = kGrayLineColor
        return line
    }()
    
    fileprivate lazy var tgView: UIView = {
        let view = UIView()
        view.backgroundColor = kWhiteColor
        return view
    }()
    /// 推广码
    lazy var tgCodeLab : UILabel = {
        let lab = UILabel()
        lab.font = k15Font
        lab.textColor = kBlackFontColor
        lab.text = "推广码"
        
        return lab
    }()
    /// 推广码输入框
    lazy var tgCodeFiled : UITextField = {
        
        let textFiled = UITextField()
        textFiled.font = k15Font
        textFiled.textColor = kBlackFontColor
        textFiled.clearButtonMode = .whileEditing
        textFiled.placeholder = "请输入推广码(选填)"
        return textFiled
    }()
    
    /// 注册按钮
    fileprivate lazy var loginBtn : UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.backgroundColor = kBtnClickBGColor
        btn.setTitle("注 册", for: .normal)
        btn.setTitleColor(kWhiteColor, for: .normal)
        btn.titleLabel?.font = k15Font
        
        btn.addTarget(self, action: #selector(clickedRegisterBtn), for: .touchUpInside)
        btn.cornerRadius = kCornerRadius
        return btn
    }()
    
    /// 图片tag
    lazy var tagImgView : UIImageView = UIImageView.init(image: UIImage.init(named: "icon_check_rect_selected"))
    /// 注册协议
    lazy var ruleLab : UILabel = {
        let lab = UILabel()
        lab.font = k13Font
        lab.textColor = kHeightGaryFontColor
        
        return lab
    }()
    
    ///获取服务中心
    func requestServiceCenter(){
        
        if !GYZTool.checkNetWork() {
            return
        }
        
        weak var weakSelf = self
        createHUD(message: "获取中...")
        
        GYZNetWork.requestNetwork("center/getCenterList.do", parameters: ["centerStatus":"1","approveStatus":"1"],  success: { (response) in
            
            weakSelf?.hud?.hide(animated: true)
            GYZLog(response)
            if response["code"].intValue == kQuestSuccessTag{//请求成功
                guard let data = response["data"].array else { return }
                
                for item in data{
                    guard let itemInfo = item.dictionaryObject else { return }
                    let model = PWServiceCenterModel.init(dict: itemInfo)
                    
                    weakSelf?.serviceCenterNameList.append(model.centerName!)
                    
                    weakSelf?.serviceCenterList.append(model)
                }
                if weakSelf?.serviceCenterList.count > 0{
                    weakSelf?.mSelectServiceCenter = weakSelf?.serviceCenterList[0]
                    weakSelf?.serviceNameLab.text = weakSelf?.mSelectServiceCenter?.centerName
                }
            }else{
                MBProgressHUD.showAutoDismissHUD(message: response["message"].stringValue)
            }
            
        }, failture: { (error) in
            weakSelf?.hud?.hide(animated: true)
            GYZLog(error)
        })
    }
    /// 注册
    @objc func clickedRegisterBtn(){
        
        hiddenKeyBoard()
        if !validPhoneNO() {
            return
        }
        if codeInputView.textFiled.text!.isEmpty {
            MBProgressHUD.showAutoDismissHUD(message: "请输入验证码")
            return
        }
        if mSelectServiceCenter == nil {
            MBProgressHUD.showAutoDismissHUD(message: "请选择服务中心")
            return
        }
        
        requestRegister()
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
    func requestRegister(){
        
        if !GYZTool.checkNetWork() {
            return
        }
        
        weak var weakSelf = self
        createHUD(message: "注册中...")
        
        /// 推广码
        var code = tgCodeFiled.text
        if (code?.isEmpty)! {
            code = ""
        }
        
        GYZNetWork.requestNetwork("dealer/resiger.do", parameters: ["mobile":phoneInputView.textFiled.text!,"code": codeInputView.textFiled.text!,"scId":mSelectServiceCenter?.id ?? "","promoCode": code!],  success: { (response) in
            
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
    
    /// 选择服务中心
    @objc func onClickedServiceCenter(){
        let picker = IQActionSheetPickerView.init(title: "选择服务中心", delegate: self)
        picker.actionSheetPickerStyle = .textPicker
        picker.titlesForComponents = [serviceCenterNameList]
        picker.show()
    }
}

extension PWRegisterVC : IQActionSheetPickerViewDelegate{
    
    ///MARK IQActionSheetPickerViewDelegate
    func actionSheetPickerView(_ pickerView: IQActionSheetPickerView, didSelectTitlesAtIndexes indexes: [NSNumber]) {
        
        mSelectServiceCenter = serviceCenterList[Int(truncating: indexes[0])]
        serviceNameLab.text = mSelectServiceCenter?.centerName
    }
}
