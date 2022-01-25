//
//  AppViewController.swift
//  AppStore
//
//  Created by Terry on 2022/01/25.
//

import UIKit
import SnapKit

class AppViewController: UIViewController {
    
    //MARK:- Properties
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let stackView = UIStackView()
    
    private let featureSectionView = FeatureSectionView(frame: .zero)
    private let rankingFeatureSectionView = RankingFeatureSectionView(frame: .zero)
    private let exchangeCodeButtonView = UIView()
    
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        uiConfigure()
        
    }
    
    //MARK:- Functioin
    func uiConfigure(){
        navigationItem.title = "앱"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 0
        
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.edges.width.equalToSuperview()
        }
        
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        
        [featureSectionView, rankingFeatureSectionView, exchangeCodeButtonView].forEach{
//            $0.snp.makeConstraints{
//                $0.height.equalTo(500) 임의로 넣어 준것이고 stackView 안에 있기 때문에 내용에 맞춰서 height 설정되기 때문에 제거
//            }
            stackView.addArrangedSubview($0)
        }
        
        
    }
}
