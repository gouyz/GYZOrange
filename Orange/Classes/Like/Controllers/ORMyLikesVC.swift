//
//  ORMyLikesVC.swift
//  Orange
//  我喜欢的
//  Created by gouyz on 2018/7/4.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

private let myLikesCell = "myLikesCell"

class ORMyLikesVC: GYZBaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            if #available(iOS 11.0, *) {
                make.edges.equalTo(0)
            }else{
                make.edges.equalTo(UIEdgeInsetsMake(0, 0, kTabBarHeight, 0))
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
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
        
        collView.register(ORMyLikesCell.self, forCellWithReuseIdentifier: myLikesCell)
        
        
        return collView
    }()

}

extension ORMyLikesVC: UICollectionViewDataSource,UICollectionViewDelegate{
    // MARK: UICollectionViewDataSource 代理方法
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 16
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: myLikesCell, for: indexPath) as! ORMyLikesCell
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate的代理方法
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
