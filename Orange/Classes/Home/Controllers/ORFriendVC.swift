//
//  ORFriendVC.swift
//  Orange
//  朋友主页
//  Created by gouyz on 2018/7/6.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

private let friendCell = "friendCell"

class ORFriendVC: GYZBaseVC {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "小胖子"
        
        setUpUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpUI(){
        view.addSubview(bgView)
        bgView.addSubview(userImgView)
        bgView.addSubview(contentLab)
        bgView.addSubview(contentNumLab)
        bgView.addSubview(followLab)
        bgView.addSubview(followNumLab)
        bgView.addSubview(likesLab)
        bgView.addSubview(likesNumLab)
        bgView.addSubview(btnView)
        btnView.addSubview(careBtn)
        btnView.addSubview(lineView)
        btnView.addSubview(chartBtn)
        bgView.addSubview(noteLab)
        
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
        
        contentNumLab.snp.makeConstraints { (make) in
            make.left.equalTo(btnView)
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
            make.right.equalTo(btnView)
            make.width.height.top.equalTo(contentNumLab)
        }
        
        contentLab.snp.makeConstraints { (make) in
            make.left.equalTo(btnView)
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
            make.right.equalTo(btnView)
            make.width.height.top.equalTo(contentLab)
        }
        
        btnView.snp.makeConstraints { (make) in
            make.left.equalTo(userImgView.snp.right).offset(30)
            make.right.equalTo(-30)
            make.top.equalTo(contentLab.snp.bottom).offset(5)
            make.height.equalTo(30)
        }
        careBtn.snp.makeConstraints { (make) in
            make.left.top.bottom.equalTo(btnView)
            make.right.equalTo(lineView.snp.left)
        }
        lineView.snp.makeConstraints { (make) in
            make.centerX.equalTo(btnView)
            make.top.bottom.equalTo(btnView)
            make.width.equalTo(klineWidth)
        }
        chartBtn.snp.makeConstraints { (make) in
            make.left.equalTo(lineView.snp.right)
            make.right.top.bottom.equalTo(btnView)
        }
        
        noteLab.snp.makeConstraints { (make) in
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
    
    lazy var btnView: UIView = {
        let view = UIView()
        view.backgroundColor = kWhiteColor
        view.borderColor = kGrayLineColor
        view.borderWidth = klineWidth
        view.cornerRadius = 15
        
        return view
    }()
    
    /// 关注
    fileprivate lazy var careBtn : UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.backgroundColor = kWhiteColor
        btn.setTitle("+ 关注", for: .normal)
        btn.setTitleColor(kBlackFontColor, for: .normal)
        btn.titleLabel?.font = k15Font
        
        btn.addTarget(self, action: #selector(clickedCareBtn), for: .touchUpInside)
        return btn
    }()
    lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = kGrayLineColor
        
        return view
    }()
    /// 私信
    fileprivate lazy var chartBtn : UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.backgroundColor = kWhiteColor
        btn.setTitle("私信", for: .normal)
        btn.setTitleColor(kBlackFontColor, for: .normal)
        btn.titleLabel?.font = k15Font
        
        btn.addTarget(self, action: #selector(clickedChartBtn), for: .touchUpInside)
        return btn
    }()
    
    /// 个人简介
    lazy var noteLab : UILabel = {
        
        let lab = UILabel()
        lab.font = k15Font
        lab.textColor = kBlackFontColor
        lab.text = "每个人心里都有一段不可碰触的往事"
        
        return lab
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
        
        collView.register(ORMyLikesCell.self, forCellWithReuseIdentifier: friendCell)
        
        
        return collView
    }()
    
    /// 加关注
    @objc func clickedCareBtn(){
        
    }
    /// 私信
    @objc func clickedChartBtn(){
        
    }
}
extension ORFriendVC: UICollectionViewDataSource,UICollectionViewDelegate{
    // MARK: UICollectionViewDataSource 代理方法
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 16
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: friendCell, for: indexPath) as! ORMyLikesCell
        
        cell.likesView.menuImg.image = UIImage.init(named: "icon_heart_white")
        cell.deleteImgView.isHidden = true
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate的代理方法
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
