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
    
    private let scrollView = UIScrollView()
    private let stackView = UIStackView()
    private let contentView = UIView()
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
    
}

extension TodayDetailViewController  {
    static var lorem: String { """
    구하지 이는 방지하는 원대하고, 쓸쓸한 가는 말이다. 것이 이상의 청춘의 옷을 피가 꽃이 얼음 이것이야말로 것이다. 미묘한 안고, 못할 구할 영락과 거선의 있다. 하는 노래하며 내는 현저하게 열락의 없는 인생을 노년에게서 넣는 위하여서. 동력은 튼튼하며, 고동을 것이다. 원대하고, 피는 아름답고 약동하다. 전인 인류의 피가 가는 하였으며, 바이며, 약동하다. 속에 우리의 인간이 실로 원대하고, 타오르고 듣는다. 바이며, 가치를 얼마나 있으랴?
    이상이 하여도 품었기 실로 내려온 위하여서. 끓는 품었기 보배를 그들에게 많이 것이다. 작고 끓는 가슴에 있으며, 위하여 얼마나 아니다. 장식하는 내는 그들에게 뼈 이상 남는 눈이 힘있다. 관현악이며, 거친 이것을 보라. 눈에 끓는 무엇을 피다. 풀이 발휘하기 찾아다녀도, 그들은 교향악이다. 시들어 같이, 설레는 끓는 사막이다. 같이 석가는 그들은 원질이 기관과 있다. 길을 끝까지 품으며, 얼음에 이상, 되는 약동하다
    영원히 많이 고동을 심장의 때까지 따뜻한 무엇이 아니다. 새가 동력은 청춘의 보이는 것이다.보라, 인간이 창공에 못하다 있다. 만천하의 위하여 예수는 것이다. 청춘의 가슴에 바이며, 실로 설산에서 보라. 인생을 눈에 방황하여도, 없으면 설레는 황금시대를 곳으로 것이다. 같이 보내는 보배를 오아이스도 위하여서 공자는 꾸며 남는 운다. 가슴에 꽃이 할지라도 이상이 기쁘며, 것이다. 동산에는 타오르고 밝은 수 유소년에게서 아니더면, 꽃이 커다란 보라. 트고, 옷을 구하기 그들의 생명을 넣는 놀이 바로 이상을 칼이다.
"""
    }
    
    
    func uiConfigure(){
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 0
        
        view.backgroundColor = .systemBackground
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.bottom.equalToSuperview()
            //            $0.bottom.equalTo(1000)
        }
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints{
            $0.edges.width.equalToSuperview()
            $0.height.equalTo(10000)
        }
        //        contentView.addSubview(stackView)
        //        stackView.snp.makeConstraints{
        //            $0.edges.equalToSuperview()
        //        }
        
        
        
        [imageView,dismissButton,appIconImageView,titleLabel,subTitleLabel, descriptionLabel,descriptionImageView,downloadButton,sharedButton].forEach{
            contentView.addSubview($0)
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
            //            $0.top.equalToSuperview().inset(-50)
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
        
        titleLabel.text = "앱이름"
        titleLabel.font = .systemFont(ofSize: 14, weight: .bold)
        titleLabel.textColor = .label
        
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(appIconImageView.snp.top).offset(5)
            $0.leading.equalTo(appIconImageView.snp.trailing).offset(15)
        }
        
        subTitleLabel.text = "설명"
        subTitleLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        subTitleLabel.textColor = .secondaryLabel
        subTitleLabel.snp.makeConstraints{
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
        }
        
        downloadButton.setTitle("받기", for: .normal)
        downloadButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        downloadButton.backgroundColor = .systemGray5
        downloadButton.titleLabel?.textColor = .systemBlue
        downloadButton.layer.cornerRadius = 15
        downloadButton.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.top)
            $0.width.equalTo(72)
            $0.trailing.equalToSuperview().inset(24)
        }
        
        descriptionLabel.text = TodayDetailViewController.lorem
        descriptionLabel.textColor = .label
        descriptionLabel.font = .systemFont(ofSize: 17)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(24)
            
            $0.top.equalTo(appIconImageView.snp.bottom).offset(20)
        }
    }
}

#if canImport(SwiftUI) && DEBUG
//struct ViewControllerRepresentable: UIViewControllerRepresentable{
//    func updateUIViewController(_ uiView: UIViewControllerType, context: Context) {
//        //leave this empty
//    }
//    @available(iOS 13.0.0, *)
//    func makeUIViewController(context: Context) -> UIViewController {
//        TodayDetailViewController()
//    }
//}
//@available(iOS 13.0, *)
//struct ViewControllerRepresentable_PreviewProvider: PreviewProvider{
//    static var previews: some View {
//        ViewControllerRepresentable()
//    }
//}
enum DeviceType {
    case iPhoneSE2
    case iPhone8
    case iPhone12Pro
    case iPhone12ProMax
    
    func name() -> String {
        switch self {
        case .iPhoneSE2:
            return "iPhone SE"
        case .iPhone8:
            return "iPhone 8"
        case .iPhone12Pro:
            return "iPhone 12 Pro"
        case .iPhone12ProMax:
            return "iPhone 12 Pro Max"
        }
    }
}

extension UIViewController {
    
    private struct Preview: UIViewControllerRepresentable {
        let viewController: UIViewController
        
        func makeUIViewController(context: Context) -> UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        }
    }
    
    func showPreview(_ deviceType: DeviceType = .iPhone12Pro) -> some View {
        Preview(viewController: self).previewDevice(PreviewDevice(rawValue: deviceType.name()))
    }
}

extension UIView {
    private struct Preview: UIViewRepresentable {
        typealias UIViewType = UIView
        
        let view: UIView
        
        func makeUIView(context: Context) -> UIView {
            return view
        }
        
        func updateUIView(_ uiView: UIView, context: Context) {
        }
    }
    
    func showPreview() -> some View {
        Preview(view: self).previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro"))
    }
}

struct ServiceUnavailableViewPreview: PreviewProvider {
    static var previews: some View {
        Group{
            
            RankingFeatureSectionView().showPreview()
            
            TodayDetailViewController().showPreview(.iPhone12Pro)
        }
    }
    
}
#endif
