//
//  HomeViewController.swift
//  nanotres
//
//  Created by Tiago Prestes on 01/10/25.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
  
  private let homeView = HomeView()
  let searchController = UISearchController(searchResultsController: nil)
  private let categories: [Category] = [
    Category(name: "Tudo", image: UIImage(resource: .placeholder)),
    Category(name: "Refeições", image: UIImage(resource: .placeholder)),
    Category(name: "Lanches", image: UIImage(resource: .placeholder)),
    Category(name: "Bebidas", image: UIImage(resource: .placeholder)),
  ]
  
  override func loadView() {
    super.loadView()
    view = homeView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupNavigationBar()
    homeView.categoryCollectionView.dataSource = self
    homeView.categoryCollectionView.delegate = self
  }
  
  private func setupNavigationBar() {
    let appearance = UINavigationBarAppearance()
    appearance.configureWithOpaqueBackground()
    appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    self.navigationItem.standardAppearance = appearance
    self.navigationItem.scrollEdgeAppearance = appearance
    
    let titleLabel = UILabel()
    titleLabel.text = "PUCPR"
    titleLabel.font = .systemFont(ofSize: 16, weight: .semibold)
    titleLabel.textColor = .black
    
    let searchButton = UIBarButtonItem(
      image: UIImage(systemName: "magnifyingglass"),
      style: .plain,
      target: self,
      action: #selector(didClickSearchButton)
    )
    searchButton.tintColor = .black
    
    self.navigationItem.rightBarButtonItem = searchButton
    self.navigationItem.titleView = titleLabel
  }
  
  @objc
  private func didClickSearchButton() {
    searchController.hidesNavigationBarDuringPresentation = true
    searchController.searchBar.placeholder = "Pesquise aqui..."
    searchController.searchBar.delegate = self
    navigationItem.searchController = searchController
    present(searchController, animated: true)
  }
  
}

extension HomeViewController: UISearchBarDelegate {
  
  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    navigationItem.searchController?.dismiss(animated: true)
    navigationItem.searchController?.isActive = false
    
    UIView.animate(withDuration: 0.5) {
      self.searchController.searchBar.alpha = 1
    } completion: { _ in
      self.navigationItem.searchController = nil
    }
  }
  
}

extension HomeViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    4
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath
  ) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: CategoryCell.reuseIdentifier,
      for: indexPath
    ) as? CategoryCell else {
      fatalError("Could not dequeue cell")
    }
    
    cell.setup(with: categories[indexPath.row])
    
    return cell
  }
  
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let spacing: CGFloat = 8
    let totalSpacing = spacing * 3 // se tiver 4 colunas, tem 3 espaços
    let availableWidth = collectionView.bounds.width - totalSpacing
    let width = availableWidth / 4
    return CGSize(width: width, height: 80)
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let vc = SearchController()
    navigationController?.pushViewController(vc, animated: true)
  }
  
}
