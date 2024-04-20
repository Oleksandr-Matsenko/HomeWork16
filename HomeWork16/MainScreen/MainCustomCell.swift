//
//  MainCustomCell.swift
//  HomeWork16
//
//  Created by Alex Matsenko on 20.04.2024.
//

import UIKit

final class MainCustomCell: UICollectionViewCell {
    
    // MARK: - Cell identifier
    
    static let identifier = "MainCell"
    
    // MARK: - UI Elements
    
    private lazy var itemLabel = UIBuilder.createLable(font: .boldSystemFont(ofSize: 25), textColor: .white)
    
    // MARK: Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        contentView.addSubview(itemLabel)
        contentView.backgroundColor = .lightGray
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.black.cgColor
        setupConstraints()
    }
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            itemLabel.topAnchor.constraint(equalTo: topAnchor),
            itemLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            itemLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            itemLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    func configureCell(index: Int) {
        itemLabel.text = "\(index)"
    }
    
}
