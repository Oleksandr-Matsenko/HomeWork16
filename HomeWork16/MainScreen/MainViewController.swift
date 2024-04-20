//
//  MainController.swift
//  HomeWork16
//
//  Created by Alex Matsenko on 20.04.2024.
//

import UIKit

final class MainViewController: UIViewController {
    
    // MARK: UI Elements
    
    private lazy var collectioView = UIBuilder.createCollection(cellClass: MainCustomCell.self, identifier: MainCustomCell.identifier, scroll: .vertical)
    private let itemsPerRow: CGFloat = 3

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupCollection()
    }
    
    // MARK: - Private Methods
    
    private func setupCollection() {
        view.addSubview(collectioView)
        collectioView.dataSource = self
        collectioView.delegate = self
        
        // Constraints
        NSLayoutConstraint.activate([
            collectioView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectioView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectioView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectioView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}

// MARK: - UICollectionViewDataSource

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 21
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCustomCell.identifier, for: indexPath) as? MainCustomCell else {
            assertionFailure()
            return UICollectionViewCell()
        }
        cell.configureCell(index: indexPath.row + 1)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width / itemsPerRow
        return CGSize(width: width, height: width)
    }
}

// MARK: - UICollectionViewDelegate

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        detailVC.titleText = "You tap on: \nCell №\(indexPath.row + 1)"
        detailVC.modalTransitionStyle = .flipHorizontal
        present(detailVC, animated: true)
    }
}
