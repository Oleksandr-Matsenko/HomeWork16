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
    private lazy var doneButton = UIBuilder.createButton(title: "Done", titleColor: .white, titleFont: .boldSystemFont(ofSize: 30), backgroundColor: .black, action: #selector(backToCell), isHiden: false, alpha: 0.0)

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        configureButton()


    }
    
    // MARK: Private Methods
    
    private func setupUI() {
        view.addSubview(detailLabel)
        view.addSubview(doneButton)
        title = "Details"
        view.backgroundColor = .green
        // Constraints
        NSLayoutConstraint.activate([
            detailLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            detailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            doneButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            doneButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            doneButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7)
        ])
        detailLabel.text = titleText
    }
    @objc private func backToCell() {
        dismiss(animated: true)
    }
    private func configureButton() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            guard let self = self else { return }
            UIView.animate(withDuration: 1.5) {
                self.doneButton.alpha = 1.0
            }
        }
    }

}
