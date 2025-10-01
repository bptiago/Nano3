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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view = homeView
    setupNavigationBar()
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
