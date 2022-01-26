//
//  AppDetailViewController.swift
//  AppStore
//
//  Created by Terry on 2022/01/26.
//

import UIKit
import SnapKit
import SwiftUI

class AppDetailViewController: UIViewController {

    private let appIconImageView = UIImageView()
    private let titleLabel = UILabel()
    private let subTitle = UILabel()
    private let downloadButton = UIButton(type: .system)
    private let sharedButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        uiConfigure()
    }
    
    func uiConfigure(){
        appIconImageView.contentMode = .scaleAspectFill
        appIconImageView.clipsToBounds = true
        appIconImageView.layer.cornerRadius = 8
        appIconImageView.backgroundColor = .gray
        
        titleLabel.text = "앱 이름"
        titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
        titleLabel.textColor = .label
        
        subTitle.text = "설명설명"
        subTitle.font = .systemFont(ofSize: 14, weight: .medium)
        subTitle.textColor = .secondaryLabel
        
        
        downloadButton.setTitle("받기", for: .normal)
        downloadButton.layer.cornerRadius = 12.0 
        downloadButton.titleLabel?.font = .systemFont(ofSize: 13, weight: .bold)
        downloadButton.setTitleColor(.white, for: .normal)
        downloadButton.backgroundColor = .systemBlue

        sharedButton.setImage(UIImage(systemName: "square.and.arrow.up"),for: .normal)
        sharedButton.tintColor = .systemBlue
        
        [appIconImageView, titleLabel, subTitle, downloadButton, sharedButton].forEach{
            view.addSubview($0)
        }
        
        appIconImageView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(32)
            $0.leading.equalToSuperview().inset(16)
            $0.width.equalTo(100)
            $0.height.equalTo(appIconImageView.snp.width)
        }
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(appIconImageView.snp.top)
            $0.leading.equalTo(appIconImageView.snp.trailing).offset(16)
            $0.trailing.equalToSuperview().inset(16)
        }
        subTitle.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.trailing.equalToSuperview().inset(16)
        }
        downloadButton.snp.makeConstraints{
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.bottom.equalTo(appIconImageView.snp.bottom)
            $0.width.equalTo(60)
            $0.height.equalTo(24)
        }
        sharedButton.snp.makeConstraints{
            $0.centerY.equalTo(downloadButton.snp.centerY)
            $0.trailing.equalToSuperview().inset(16)

            
        }
    }
}
