//
//  TodayCollectionHeaderView.swift
//  AppStore
//
//  Created by Terry on 2022/01/25.
//

import UIKit

//header 나 Footer를 만들기위해서는 UICollectionReusableView 프로토콜을 채택해야한다.
class TodayCollectionHeaderView:UICollectionReusableView {
    private let titleLabel = UILabel()
    private let dateLabel = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        uiConfigure()
    }
    
    func uiConfigure(){
        titleLabel.text = "투데이"
        titleLabel.font = .systemFont(ofSize: 36, weight: .black)
        titleLabel.textColor = .label
        
        dateLabel.text = "6월 28일 월요일"
        dateLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        dateLabel.textColor = .secondaryLabel
        
        [dateLabel, titleLabel].forEach{
            addSubview($0)
        }
        dateLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview().inset(32)
        }
        titleLabel.snp.makeConstraints{
            $0.left.equalTo(dateLabel)
            $0.top.equalTo(dateLabel.snp.bottom).offset(8)
        }
        
    }
}
