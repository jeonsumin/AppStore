//
//  FeatureSectionCollectionViewCell.swift
//  AppStore
//
//  Created by Terry on 2022/01/25.
//

import UIKit
import SnapKit

class FeatureSectionCollectionViewCell: UICollectionViewCell {
    
    private let typeLabel = UILabel()
    private let appNameLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let imageView = UIImageView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        uiConfigure()
    }
    
    func uiConfigure(){
        typeLabel.text = "새로운 경험"
        typeLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        typeLabel.textColor = .systemBlue
        
        appNameLabel.text = "App Name"
        appNameLabel.font = .systemFont(ofSize: 20, weight: .bold)
        appNameLabel.textColor = .label
        
        descriptionLabel.text = "설명설명"
        descriptionLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        descriptionLabel.textColor = .secondaryLabel
        
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 7
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor.separator.cgColor
        imageView.clipsToBounds = true
        imageView.backgroundColor = .lightGray
        
        [typeLabel,appNameLabel,descriptionLabel,imageView].forEach{
            addSubview($0)
        }
        
        typeLabel.snp.makeConstraints{
            $0.top.equalTo(10)
            $0.leading.trailing.equalToSuperview().offset(4)
        }
        appNameLabel.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(typeLabel.snp.bottom)
        }
        descriptionLabel.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(appNameLabel.snp.bottom).offset(4)
        }
        imageView.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(8)
            $0.bottom.equalToSuperview().inset(8)
        }
        
        
    }
}
