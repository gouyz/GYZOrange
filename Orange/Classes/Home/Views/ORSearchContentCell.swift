//
//  ORSearchContentCell.swift
//  Orange
//  搜索内容cell
//  Created by gouyz on 2018/7/6.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

class ORSearchContentCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(likesImgView)
        
        likesImgView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
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
}
