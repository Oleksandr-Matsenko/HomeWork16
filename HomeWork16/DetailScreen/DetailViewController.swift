//
//  DetailViewController.swift
//  HomeWork16
//
//  Created by Alex Matsenko on 20.04.2024.
//

import UIKit

final class DetailViewController: UIViewController {
    
    // MARK: - UI Elements
    
    var titleText: String?
    private lazy var detailLabel = UIBuilder.createLable(font: .boldSystemFont(ofSize: 40), textColor: .black)

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()


    }
    
    // MARK: Private Methods
    
    private func setupUI() {
        view.addSubview(detailLabel)
        view.backgroundColor = .green
        // Constraints
        NSLayoutConstraint.activate([
            detailLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        detailLabel.text = titleText
    }
   
}
