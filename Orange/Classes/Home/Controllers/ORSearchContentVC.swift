//
//  ORSearchContentVC.swift
//  Orange
//  搜索内容
//  Created by gouyz on 2018/7/6.
//  Copyright © 2018年 gyz. All rights reserved.
//

import UIKit

private let searchContentCell = "searchContentCell"
private let searchContentHeader = "searchContentHeader"

class ORSearchContentVC: GYZBaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in

            make.edges.equalTo(0)
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
        
        collView.register(ORSearchContentCell.self, forCellWithReuseIdentifier: searchContentCell)
        collView.register(ORSearchContentHeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: searchContentHeader)
        
        
        return collView
    }()
    
}

extension ORSearchContentVC: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    // MARK: UICollectionViewDataSource 代理方法
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 16
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: searchContentCell, for: indexPath) as! ORSearchContentCell
        
        return cell
    }
    
    // 返回自定义HeadView或者FootView
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        var reusableview: UICollectionReusableView!
        
        if kind == UICollectionElementKindSectionHeader {
            
            reusableview = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: searchContentHeader, for: indexPath) as! ORSearchContentHeaderView
            
            
//            (reusableview as! ORSearchContentHeaderView).contentLab.text = ""
        }
        
        return reusableview
    }
    
    // MARK: UICollectionViewDelegate的代理方法
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    //MARK: UICollectionViewDelegateFlowLayout
    // 返回HeadView的宽高
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: kScreenWidth, height: kTitleHeight)
    }
}
