//
//  OnBoardingCustomCell.swift
//  HomeWork16
//
//  Created by Alex Matsenko on 20.04.2024.
//

import UIKit

final class OnBoardingCustomCell: UICollectionViewCell {
    
    // MARK: - Cell identifier
    
    static let identifier = "OnBoardingCustomCell"
    
    // MARK: - UI Elements
    
    private lazy var headerLabel = UIBuilder.createLable(font: .systemFont(ofSize: 60, weight: .bold), textColor: .black)
    private lazy var descriptionLabel = UIBuilder.createLable(font: .systemFont(ofSize: 25, weight: .regular), textColor: .darkGray)
    private lazy var stepLabel = UIBuilder.createLable(font: .systemFont(ofSize: 15, weight: .semibold), textColor: .black)
    lazy var getStartedButton = UIBuilder.createButton(title: "Get Started", titleColor: .white, titleFont: .boldSystemFont(ofSize: 30), backgroundColor: .black, action: #selector(getStartedTaped), isHiden: true, alpha: 0.0)
    var getStartedDidTaped: (() -> Void)?
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        [headerLabel, descriptionLabel, stepLabel, getStartedButton].forEach{
            contentView.addSubview($0)
        }
        //Constraints
        NSLayoutConstraint.activate([
        //Header
            headerLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -60),
            headerLabel.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            headerLabel.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -20),
//            headerLabel.heightAnchor.constraint(equalToConstant: 65),
        //Description
            descriptionLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 50),
            descriptionLabel.leadingAnchor.constraint(equalTo: headerLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: headerLabel.trailingAnchor),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 45),
        //Step
            stepLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            stepLabel.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor),
            stepLabel.trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor),
        //GetStarted
            getStartedButton.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            getStartedButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            getStartedButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.6)
            
        ])
    }
    @objc private func getStartedTaped() {
        getStartedDidTaped?()
    }
    
    // MARK: - Public Methods
    
    func configureCell(title: String, description: String, step: Int, totalSteps: Int) {
        headerLabel.text = title
        descriptionLabel.text = description
        stepLabel.text = "Step: \(step) of \(totalSteps)"
    }

    func showGetStartedButtonWithAnimation() {
        UIView.animate(withDuration: 4.0, delay: 0.5, options: .curveEaseInOut, animations: {
              self.getStartedButton.alpha = 1.0
          }, completion: nil)
      }
    
}
