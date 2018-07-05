//
//  ORMineVC.swift
//  Orange
//  我的
//  Created by gouyz on 2018/7/2.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

private let mineCell = "mineCell"

class ORMineVC: GYZBaseVC {
    
    /// 是否是编辑
    var isEdit: Bool = false
    
    var rightBtn: UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "我的"
        
        rightBtn = UIButton(frame: CGRect.init(x: 0, y: 0, width: kTitleHeight, height: kTitleHeight))
        rightBtn?.setTitleColor(kBlackColor, for: .normal)
        rightBtn?.titleLabel?.font = k14Font
        rightBtn?.addTarget(self, action: #selector(onClickedRightBtn), for: .touchUpInside)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn!)
        
        setUpUI()
        setEditView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpUI(){
        view.addSubview(bgView)
        bgView.addSubview(userImgView)
        bgView.addSubview(cameraImgView)
        bgView.addSubview(contentLab)
        bgView.addSubview(contentNumLab)
        bgView.addSubview(followLab)
        bgView.addSubview(followNumLab)
        bgView.addSubview(likesLab)
        bgView.addSubview(likesNumLab)
        bgView.addSubview(editBtn)
        bgView.addSubview(noteTxtFiled)
        
        view.addSubview(collectionView)
        
        bgView.snp.makeConstraints { (make) in
            make.left.right.equalTo(view)
            make.top.equalTo(kTitleAndStateHeight)
            make.height.equalTo(150)
        }
        userImgView.snp.makeConstraints { (make) in
            make.left.equalTo(kMargin)
            make.top.equalTo(kMargin)
            make.size.equalTo(CGSize.init(width: 60, height: 60))
        }
        cameraImgView.snp.makeConstraints { (make) in
            make.right.bottom.equalTo(userImgView)
            make.size.equalTo(CGSize.init(width: 20, height: 16))
        }
        
        contentNumLab.snp.makeConstraints { (make) in
            make.left.equalTo(editBtn)
            make.top.equalTo(userImgView)
            make.width.equalTo(followNumLab)
            make.height.equalTo(20)
        }
        followNumLab.snp.makeConstraints { (make) in
            make.left.equalTo(contentNumLab.snp.right)
            make.top.height.equalTo(contentNumLab)
            make.width.equalTo(likesNumLab)
        }
        likesNumLab.snp.makeConstraints { (make) in
            make.left.equalTo(followNumLab.snp.right)
            make.right.equalTo(editBtn)
            make.width.height.top.equalTo(contentNumLab)
        }
        
        contentLab.snp.makeConstraints { (make) in
            make.left.equalTo(editBtn)
            make.top.equalTo(contentNumLab.snp.bottom)
            make.width.equalTo(followLab)
            make.height.equalTo(20)
        }
        followLab.snp.makeConstraints { (make) in
            make.left.equalTo(contentLab.snp.right)
            make.top.height.equalTo(contentLab)
            make.width.equalTo(likesLab)
        }
        likesLab.snp.makeConstraints { (make) in
            make.left.equalTo(followLab.snp.right)
            make.right.equalTo(editBtn)
            make.width.height.top.equalTo(contentLab)
        }
        
        editBtn.snp.makeConstraints { (make) in
            make.left.equalTo(userImgView.snp.right).offset(30)
            make.right.equalTo(-30)
            make.top.equalTo(contentLab.snp.bottom).offset(5)
            make.height.equalTo(30)
        }
        
        noteTxtFiled.snp.makeConstraints { (make) in
            make.left.equalTo(userImgView)
            make.right.equalTo(-kMargin)
            make.bottom.equalTo(-5)
            make.height.equalTo(50)
        }
        
        collectionView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(view)
            make.top.equalTo(bgView.snp.bottom).offset(2)
        }
    }
    
    lazy var bgView: UIView = {
        let view = UIView()
        view.backgroundColor = kWhiteColor
        return view
    }()
    /// 用户头像图片
    lazy var userImgView : UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage.init(named: "icon_header_default")
        imgView.cornerRadius = 30
        
        return imgView
    }()
    /// 相机
    lazy var cameraImgView: UIImageView = UIImageView.init(image: UIImage.init(named: "icon_camera"))
    /// 内容数量
    lazy var contentNumLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kBlackFontColor
        lab.font = k12Font
        lab.textAlignment = .left
        lab.text = "40"
        
        return lab
    }()
    /// 内容
    lazy var contentLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kBlackFontColor
        lab.font = k12Font
        lab.textAlignment = .left
        lab.text = "内容"
        
        return lab
    }()
    /// 关注数量
    lazy var followNumLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kBlackFontColor
        lab.font = k12Font
        lab.textAlignment = .center
        lab.text = "140"
        
        return lab
    }()
    /// 关注
    lazy var followLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kBlackFontColor
        lab.font = k12Font
        lab.textAlignment = .center
        lab.text = "关注"
        
        return lab
    }()
    /// 粉丝数量
    lazy var likesNumLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kBlackFontColor
        lab.font = k12Font
        lab.textAlignment = .right
        lab.text = "40"
        
        return lab
    }()
    /// 粉丝
    lazy var likesLab : UILabel = {
        let lab = UILabel()
        lab.textColor = kBlackFontColor
        lab.font = k12Font
        lab.textAlignment = .right
        lab.text = "粉丝"
        
        return lab
    }()
    
    /// 编辑按钮
    fileprivate lazy var editBtn : UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.backgroundColor = kWhiteColor
        btn.setTitle("编辑主页", for: .normal)
        btn.setTitleColor(kBlackFontColor, for: .normal)
        btn.titleLabel?.font = k15Font
        btn.borderColor = kGrayLineColor
        btn.borderWidth = klineWidth
        
        btn.addTarget(self, action: #selector(clickedEditBtn), for: .touchUpInside)
        btn.cornerRadius = 15
        return btn
    }()
    
    /// 个人简介
    lazy var noteTxtFiled : UITextField = {
        
        let textFiled = UITextField()
        textFiled.font = k15Font
        textFiled.textColor = kBlackFontColor
        textFiled.clearButtonMode = .whileEditing
        textFiled.placeholder = "点击这里输入个人简介"
        textFiled.text = "每个人心里都有一段不可碰触的往事"
        
        return textFiled
    }()
    
    lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        
        let itemH = (kScreenWidth - klineDoubleWidth*2)/3.0
        //设置cell的大小
        layout.itemSize = CGSize(width: itemH, height: itemH)
        
        //每个Item之间最小的间距
        layout.minimumInteritemSpacing = klineDoubleWidth
        //每行之间最小的间距
        layout.minimumLineSpacing = klineDoubleWidth
        
        let collView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        collView.dataSource = self
        collView.delegate = self
        collView.backgroundColor = kBackgroundColor
        
        collView.register(ORMyLikesCell.self, forCellWithReuseIdentifier: mineCell)
        
        
        return collView
    }()
    
    /// 完成/设置
    @objc func onClickedRightBtn(){
        if isEdit {//编辑
            isEdit = false
            setEditView()
            collectionView.reloadData()
        }else{// 设置
            let vc = ORSettingVC()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    /// 编辑主页
    @objc func clickedEditBtn(){
        isEdit = true
        setEditView()
        collectionView.reloadData()
    }
    ///
    func setEditView(){
        if isEdit {
            cameraImgView.isHidden = false
            noteTxtFiled.isEnabled = true
            rightBtn?.setTitle("完成", for: .normal)
            rightBtn?.setImage( nil, for: .normal)
        }else{
            cameraImgView.isHidden = true
            noteTxtFiled.isEnabled = false
            rightBtn?.setImage( UIImage(named: "icon_setting"), for: .normal)
            rightBtn?.setTitle("", for: .normal)
        }
        
    }
}
extension ORMineVC: UICollectionViewDataSource,UICollectionViewDelegate{
    // MARK: UICollectionViewDataSource 代理方法
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 16
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: mineCell, for: indexPath) as! ORMyLikesCell
        
        cell.likesView.menuImg.image = UIImage.init(named: "icon_heart_white")
        if isEdit {
            cell.deleteImgView.isHidden = false
        }else{
            cell.deleteImgView.isHidden = true
        }
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate的代理方法
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
