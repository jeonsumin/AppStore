//
//  TodayDetailViewController.swift
//  AppStore
//
//  Created by Terry on 2022/01/26.
//

import UIKit
import SnapKit
import SwiftUI
import Kingfisher

class TodayDetailViewController: UIViewController {

    private let dismissButton = UIButton(type: .system)
    private let imageView = UIImageView()
    private let appIconImageView = UIImageView()
    private let titleLabel = UILabel()
    private let subTitleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let descriptionImageView = UIImageView()
    private let downloadButton = UIButton(type: .system)
    private let sharedButton = UIButton(type: .system)
    override func viewDidLoad() {
        super.viewDidLoad()
        uiConfigure()
    }
    
    func uiConfigure(){
        view.backgroundColor = .systemBackground
        
        [imageView,dismissButton,appIconImageView,titleLabel,subTitleLabel, descriptionLabel,descriptionImageView,downloadButton,sharedButton].forEach{
            view.addSubview($0)
        }
        dismissButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        dismissButton.titleLabel?.font = .systemFont(ofSize: 12, weight: .bold)
        dismissButton.tintColor = .white
        dismissButton.backgroundColor = .darkGray
        dismissButton.layer.cornerRadius = 15
        
        dismissButton.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(10)
            $0.width.equalTo(30)
            $0.height.equalTo(dismissButton.snp.width)
        }
        
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .lightGray
        
//        let url = URL(string: "https://picsum.photos/1920/1080")
//        imageView.kf.setImage(with: url)
        imageView.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview().inset(-50)
            $0.width.equalToSuperview()
            $0.height.equalTo(imageView.snp.width)
        }
        
        
        appIconImageView.contentMode = .scaleAspectFill
        appIconImageView.clipsToBounds = true
        appIconImageView.backgroundColor = .darkGray
        
//        appIconImageView.kf.setImage(with: url)
        
        appIconImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(25)
            $0.width.height.equalTo(50)
//            $0.height.equalTo(appIconImageView.snp.width)
            $0.top.equalTo(imageView.snp.bottom).offset(10)
        }
    }
}

#if DEBUG
struct ViewControllerRepresentable: UIViewControllerRepresentable{
    func updateUIViewController(_ uiView: UIViewControllerType, context: Context) {
        //leave this empty
    }
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController {
        TodayDetailViewController()
    }
}
@available(iOS 13.0, *)
struct ViewControllerRepresentable_PreviewProvider: PreviewProvider{
    static var previews: some View {
        ViewControllerRepresentable()
    }
}

#endif
