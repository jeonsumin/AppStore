//
//  TodayCollectionViewCell.swift
//  AppStore
//
//  Created by Terry on 2022/01/25.
//

import SnapKit
import UIKit
import Kingfisher

class TodayCollectionViewCell :UICollectionViewCell {
    //MARK: - Properties
    private let titleLabel = UILabel()
    private let subTitleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let imageView = UIImageView()
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        uiConfigure()
//    }
    
    func uiConfigure(today: Today) {
    
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 10
        
        titleLabel.text = today.title
        titleLabel.font = .systemFont(ofSize: 24, weight: .bold)
        titleLabel.textColor = .white
        
        subTitleLabel.text = today.subTitle
        subTitleLabel.font = .systemFont(ofSize: 14, weight: .bold)
        subTitleLabel.textColor = .white
        
        descriptionLabel.text = today.description
        descriptionLabel.font = .systemFont(ofSize: 14, weight: .bold)
        descriptionLabel.textColor = .white
        
        if let imageURL = URL(string: today.imageURL) {
            imageView.kf.setImage(with:imageURL)
        }
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        imageView.backgroundColor = .gray
        
        
        [imageView, titleLabel, subTitleLabel, descriptionLabel].forEach {
            addSubview($0)
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.leading.trailing.top.equalToSuperview().inset(24)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.trailing.equalTo(subTitleLabel)
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(4)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview().inset(24)
        }
        
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        
        
    }
}
