//
//  RankingFeatureSectionView.swift
//  AppStore
//
//  Created by Terry on 2022/01/25.
//

import UIKit
import SnapKit

class RankingFeatureSectionView: UIView {
//    private let cellHeight:CGFloat = 30
    
    private var rankingFeatureList : [RankingFeature] = []
    private let titleLabel = UILabel()
    private let showAllAppsButton = UIButton()
    
    private lazy var collectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 32
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.register(RankingFeatureCollectionViewCell.self, forCellWithReuseIdentifier: "RankingFeatureCollectionViewCell")
        return collectionView
    }()
    
    private let saparatorView = SeparatorView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        uiConfigure()
        fetchData()
        collectionView.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func uiConfigure(){
        titleLabel.text = "iPhone이 처음이라면"
        titleLabel.font = .systemFont(ofSize: 18, weight: .black)
    
        showAllAppsButton.setTitle("모두 보기", for: .normal)
        showAllAppsButton.setTitleColor(.systemBlue, for: .normal)
        showAllAppsButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        
        [titleLabel,showAllAppsButton,collectionView,saparatorView].forEach{
            addSubview($0)
        }
        
        titleLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(16)
            $0.top.equalToSuperview().inset(16)
            $0.trailing.equalTo(showAllAppsButton.snp.leading).offset(8)
        }
        showAllAppsButton.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(16)
            $0.bottom.equalTo(titleLabel.snp.bottom)
        }
        collectionView.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.height.equalTo(RankingFeatureCollectionViewCell.cellHeight * 3)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        saparatorView.snp.makeConstraints{
            $0.top.equalTo(collectionView.snp.bottom).offset(16)
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
    }
    func fetchData(){
        guard let url = Bundle.main.url(forResource: "RankingFeature", withExtension: "plist")
        else { return }
        
        do{
            let data = try Data(contentsOf: url)
            let result = try PropertyListDecoder().decode([RankingFeature].self, from: data)
            rankingFeatureList = result
        }catch{
            
        }
    }
}

extension RankingFeatureSectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rankingFeatureList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RankingFeatureCollectionViewCell", for: indexPath) as? RankingFeatureCollectionViewCell else { return UICollectionViewCell() }
        let rankingFeature = rankingFeatureList[indexPath.row]
        cell.uiConfigure(rankingFeature: rankingFeature)
        return cell
    }
    
    
}

extension RankingFeatureSectionView:UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 32, height: RankingFeatureCollectionViewCell.cellHeight)
    }
}
