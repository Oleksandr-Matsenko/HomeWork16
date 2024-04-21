//
//  ViewController.swift
//  HomeWork16
//
//  Created by Alex Matsenko on 20.04.2024.
//

import UIKit

final class OnBoardingViewController: UIViewController {
    
// MARK: - UI Elements
    
    private lazy var collectionView = UIBuilder.createCollection(cellClass: OnBoardingCustomCell.self, identifier: OnBoardingCustomCell.identifier, scroll: .horizontal)
    private lazy var pages: [(title: String, description: String)] = [
        ("Welcome", "Welcome to our app!"),
        ("Discover", "Discover amazing features!"),
        ("Get Started", "Get started now!"),
        ("Explore", "Explore new possibilities!"),
        ("Enjoy", "Enjoy using our app!"),
    ]
    private lazy var pageControl = UIBuilder.createControl(currentPage: 0, allPages: pages.count, action: #selector(pageControlDidChanged(_:)), for: .valueChanged)
    
// MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupCollectionView()
        setupPageControl()
    }
    
// MARK: Private Methods
    
    private func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInsetAdjustmentBehavior = .never
    // Constraints
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    
    private func setupPageControl() {
        view.addSubview(pageControl)
    // Constraints
        NSLayoutConstraint.activate([
            pageControl.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pageControl.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 50)
        ])
    }


    @objc private func pageControlDidChanged(_ sender: UIPageControl) {
        print("Page control changed to page \(sender.currentPage)")
        let targetIndex = sender.currentPage
          let targetOffset = CGPoint(x: CGFloat(targetIndex) * collectionView.bounds.width, y: 0)
          
          // Перевіряємо, чи поточний індекс не співпадає з цільовим
          if collectionView.contentOffset.x != targetOffset.x {
              collectionView.setContentOffset(targetOffset, animated: true)
          }
    }

    @objc  func didTapGetStarted() {
        let mainViewController = MainViewController()
        navigationController?.pushViewController(mainViewController, animated: true)
    }
}

// MARK: - UICollectionViewDataSource

extension OnBoardingViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnBoardingCustomCell.identifier, for: indexPath) as? OnBoardingCustomCell else {
            return UICollectionViewCell()
        }
        let page = pages[indexPath.row]
        cell.configureCell(title: page.title, description: page.description, step: indexPath.row + 1, totalSteps: pages.count)
        
        
        if indexPath.row  == pages.count - 1 {
            cell.getStartedButton.isHidden = false
            cell.showGetStartedButtonWithAnimation()
        } else {
            cell.getStartedButton.isHidden = true
            cell.getStartedButton.alpha = 0.0
           
   }
       
        cell.getStartedDidTaped = { [weak self] in
            let mainVC = MainViewController()
            mainVC.modalPresentationStyle = .automatic
            mainVC.modalTransitionStyle = .coverVertical
              
            self?.present(mainVC, animated: true, completion: nil)
        }

        cell.backgroundColor = .green
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }

    
}
//extension OnBoardingViewController: UICollectionViewDelegate {
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        let pageIndex = Int(scrollView.contentOffset.x / scrollView.bounds.width)
//        pageControl.currentPage = pageIndex
// crollViewDelegate
//    }
//}
extension OnBoardingViewController: UIScrollViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let pageWidth = view.bounds.size.width
        let targetOffsetX = targetContentOffset.pointee.x
        let currentPage = Int(targetOffsetX/pageWidth)
        pageControl.currentPage = currentPage
        print("Current page = \(currentPage)")
    }
}
