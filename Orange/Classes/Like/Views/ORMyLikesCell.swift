//
//  ORMyLikesCell.swift
//  Orange
//  我喜欢的cell 
//  Created by gouyz on 2018/7/4.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class ORMyLikesCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(likesImgView)
        likesImgView.addSubview(likesView)
        likesImgView.addSubview(deleteImgView)
        
        likesImgView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
        
        likesView.snp.makeConstraints { (make) in
            make.right.equalTo(-5)
            make.bottom.equalTo(-5)
            make.height.equalTo(34)
            make.width.equalTo(30)
        }
        deleteImgView.snp.makeConstraints { (make) in
            make.right.equalTo(-5)
            make.top.equalTo(5)
            make.height.equalTo(18)
            make.width.equalTo(15)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 图片
    lazy var likesImgView : UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage.init(named: "icon_likes_default")
        
        return imgView
    }()
    /// 喜欢
    lazy var likesView: GYZImgAndTxtBtnView = {
        
        let view = GYZImgAndTxtBtnView()
        view.menuImg.image = UIImage.init(named: "icon_heart_red")
        view.menuTitle.text = "1K+"
        view.menuTitle.textColor = kWhiteColor
        
        return view
        
    }()
    
    /// 删除
    lazy var deleteImgView : UIImageView = {
        let imgView = UIImageView()
        imgView.isHidden = true
        imgView.image = UIImage.init(named: "icon_delete_gray")
        
        return imgView
    }()
}
