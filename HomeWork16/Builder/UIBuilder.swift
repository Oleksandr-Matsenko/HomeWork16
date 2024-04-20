//
//  UIBuilder.swift
//  HomeWork16
//
//  Created by Alex Matsenko on 20.04.2024.
//

import UIKit
struct UIBuilder {
    static func createLable(font: UIFont, textColor: UIColor) -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = textColor
        label.font = font
        label.textAlignment = .center
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    static func createButton(title: String, titleColor: UIColor, titleFont: UIFont, backgroundColor: UIColor, action: Selector, isHiden: Bool, alpha: CGFloat ) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.backgroundColor = backgroundColor
        button.titleLabel?.font = titleFont
        button.layer.cornerRadius = 15
        button.alpha = alpha
        button.isHidden = isHiden
        button.addTarget(self, action: action, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    static func createCollection(cellClass: AnyClass, identifier: String, scroll: UICollectionView.ScrollDirection ) -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = scroll
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.isPagingEnabled = true
        collection.backgroundColor = .white
        collection.register(cellClass.self, forCellWithReuseIdentifier: identifier)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }
    static func createControl(currentPage: Int, allPages: Int, action: Selector, for: UIControl.Event ) -> UIPageControl {
        let control = UIPageControl()
        control.currentPage = currentPage
        control.numberOfPages = allPages
        control.currentPageIndicatorTintColor = .systemBlue
        control.pageIndicatorTintColor = .systemBrown
        control.translatesAutoresizingMaskIntoConstraints = false
        control.addTarget(self, action: action, for: .valueChanged)
        return control
    }
}
