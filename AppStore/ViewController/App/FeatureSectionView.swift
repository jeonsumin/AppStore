//
//  FeatureSectionView.swift
//  AppStore
//
//  Created by Terry on 2022/01/25.
//

import UIKit
import SnapKit
import SwiftUI

class FeatureSectionView: UIView {
    //MARK:- Properties
    private lazy var collectionView : UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true // 페이지네이션되도록 설정
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.register(FeatureSectionCollectionViewCell.self, forCellWithReuseIdentifier: "FeatureSectionCollectionViewCell")
        
        return collectionView
    }()
    
    private let separatorView = SeparatorView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        uiConfigure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- function
    func uiConfigure(){
        [collectionView,separatorView].forEach{
            addSubview($0)
        }
        
        collectionView.snp.makeConstraints{
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.top.equalToSuperview().inset(16)
            $0.height.equalTo(snp.width)
        }
        separatorView.snp.makeConstraints{
            $0.top.equalTo(collectionView.snp.bottom).offset(16)
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
    }
}

//MARK:- UICollectionViewDataSource
extension FeatureSectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeatureSectionCollectionViewCell", for: indexPath) as? FeatureSectionCollectionViewCell else { return  UICollectionViewCell() }
        
        return cell
    }
    
    
}
//MARK:- UICollectionViewDelegateFlowLayout
extension FeatureSectionView:UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width - 32
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    //section의 최소 마진
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        32
    }
}
