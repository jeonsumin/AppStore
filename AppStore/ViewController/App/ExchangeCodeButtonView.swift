//
//  ExchangeCodeButtonView.swift
//  AppStore
//
//  Created by Terry on 2022/01/26.
//

import UIKit
import SnapKit

class ExchangeCodeButtonView: UIView {
    let ExchangeCodeButton = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        ExchangeCodeButton.setTitle("코드 교환", for: .normal)
        ExchangeCodeButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        ExchangeCodeButton.backgroundColor = .tertiarySystemGroupedBackground
        ExchangeCodeButton.layer.cornerRadius = 7
        ExchangeCodeButton.addTarget(self, action: #selector(ExchangeCodeButtonTapped), for: .touchUpInside)
        
        
        addSubview(ExchangeCodeButton)
        ExchangeCodeButton.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.bottom.equalToSuperview().inset(32)
            $0.height.equalTo(40)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func ExchangeCodeButtonTapped(){
        print("ExchangeCodeButtonTapped")
    }
}
