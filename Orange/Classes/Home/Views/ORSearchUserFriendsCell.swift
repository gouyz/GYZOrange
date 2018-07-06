//
//  ORSearchUserFriendsCell.swift
//  Orange
//  搜索用户 可能认识的人 cell
//  Created by gouyz on 2018/7/6.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

private let userFriendsCell = "userFriendsCell"

class ORSearchUserFriendsCell: UITableViewCell {

    /// 代理变量
    weak var delegate: ORSearchUserFriendsCellDelegate?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        contentView.backgroundColor = kWhiteColor
        
        contentView.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        //设置cell的大小
        layout.itemSize = CGSize(width: (kScreenWidth - klineDoubleWidth*3)/4.0, height: 110)
        
        //每个Item之间最小的间距
        layout.minimumInteritemSpacing = klineDoubleWidth
        //每行之间最小的间距
        layout.minimumLineSpacing = klineDoubleWidth
        
        let collView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        collView.dataSource = self
        collView.delegate = self
        collView.backgroundColor = kWhiteColor
        collView.showsHorizontalScrollIndicator = false
        
        collView.register(ORUserfriendsCell.self, forCellWithReuseIdentifier: userFriendsCell)
        
        return collView
    }()
}

extension ORSearchUserFriendsCell : UICollectionViewDataSource,UICollectionViewDelegate{
    // MARK: UICollectionViewDataSource 代理方法
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: userFriendsCell, for: indexPath) as! ORUserfriendsCell
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate的代理方法
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        delegate?.didClickedGroupIndex(rowIndex: indexPath.row)
    }
}

protocol ORSearchUserFriendsCellDelegate : NSObjectProtocol {
    ///操作代理
    ///
    /// - Parameters:
    ///   - rowIndex: 行索引
    func didClickedGroupIndex(rowIndex: Int)
}
