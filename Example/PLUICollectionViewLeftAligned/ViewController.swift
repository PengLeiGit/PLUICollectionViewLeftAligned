//
//  ViewController.swift
//  PLUICollectionViewLeftAligned
//
//  Created by 1248667206@qq.com on 05/14/2020.
//  Copyright (c) 2020 1248667206@qq.com. All rights reserved.
//

import UIKit
import PLUICollectionViewLeftAligned
import SnapKit


private let kCellIdentifier = "Cell"
class ViewController: UIViewController {
    lazy var flowLayout: UICollectionViewLeftAlignedLayout = {
        let flowLayout = UICollectionViewLeftAlignedLayout()
        flowLayout.minimumInteritemSpacing = 0
        return flowLayout
    }()
    
    lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: self.flowLayout)
        view.delegate = self
        view.dataSource = self
        view.backgroundColor = UIColor.white
        view.register(UICollectionViewCell.self, forCellWithReuseIdentifier: kCellIdentifier)
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    private func initUI() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }

}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCellIdentifier, for: indexPath)
        
        cell.contentView.layer.borderColor = UIColor.gray.cgColor
        cell.contentView.layer.borderWidth = 2;
        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width / 2, height: 120);
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
}

