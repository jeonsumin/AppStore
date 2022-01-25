//
//  RankingFeatureCollectionViewCell.swift
//  AppStore
//
//  Created by Terry on 2022/01/25.
//

import UIKit
import SnapKit

class RankingFeatureCollectionViewCell :UICollectionViewCell {
    static var cellHeight : CGFloat { 70 }
    
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let downloadButton = UIButton(type: .system)
    private let inAppPurchaseInfoLabel = UILabel()
    
    func uiConfigure(){
        imageView.backgroundColor = .tertiarySystemGroupedBackground
        imageView.layer.cornerRadius = 7
        imageView.layer.borderColor = UIColor.tertiaryLabel.cgColor
        imageView.layer.borderWidth = 0.5
    
        titleLabel.text = "앱 이름"
        titleLabel.font = .systemFont(ofSize: 16, weight: .bold)
        titleLabel.textColor = .label
        titleLabel.numberOfLines = 2
        
        descriptionLabel.text = "설명설명"
        descriptionLabel.font = .systemFont(ofSize: 13, weight: .semibold)
        descriptionLabel.textColor = .secondaryLabel
        
        downloadButton.setTitle("받기", for: .normal)
        downloadButton.setTitleColor(.systemBlue, for: .normal)
        downloadButton.titleLabel?.font = .systemFont(ofSize: 13, weight: .bold)
        downloadButton.backgroundColor = .secondarySystemBackground
        downloadButton.layer.cornerRadius = 12
        
        inAppPurchaseInfoLabel.text = "앱 내 구입"
        inAppPurchaseInfoLabel.font = .systemFont(ofSize: 10, weight: .semibold)
        inAppPurchaseInfoLabel.textColor = .secondaryLabel
        
        inAppPurchaseInfoLabel.isHidden = [true,false].randomElement() ?? true
        
        [imageView,titleLabel,descriptionLabel,downloadButton,inAppPurchaseInfoLabel].forEach{
            addSubview($0)
        }
        imageView.snp.makeConstraints{
            $0.leading.equalToSuperview()
            $0.top.bottom.equalToSuperview().inset(4)
            $0.width.equalTo(imageView.snp.height)
        }
        
        downloadButton.snp.makeConstraints{
            $0.trailing.centerY.equalToSuperview()
            $0.height.equalTo(24)
            $0.width.equalTo(50)
        }
        
        inAppPurchaseInfoLabel.snp.makeConstraints{
            $0.centerX.equalTo(downloadButton.snp.centerX)
            $0.top.equalTo(downloadButton.snp.bottom).offset(4)
        }
        
        titleLabel.snp.makeConstraints{
            $0.leading.equalTo(imageView.snp.trailing).offset(8)
            $0.trailing.equalTo(downloadButton.snp.leading)
            $0.top.equalTo(imageView.snp.top).inset(8)
        }
        descriptionLabel.snp.makeConstraints{
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.trailing.equalTo(titleLabel.snp.trailing)
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
        }
        
    }
}
