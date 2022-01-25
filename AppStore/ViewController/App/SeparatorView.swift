//
//  SeparatorView.swift
//  AppStore
//
//  Created by Terry on 2022/01/25.
//

import UIKit
import SnapKit

class SeparatorView: UIView {
    let separator = UIView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        separator.backgroundColor = .separator
        
        addSubview(separator)
        
        separator.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview()
            $0.height.equalTo(0.5)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
