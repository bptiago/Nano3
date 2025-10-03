//
//  SearchController.swift
//  nanotres
//
//  Created by Tiago Prestes on 02/10/25.
//

import Foundation
import UIKit

class SearchViewController: UIViewController {
  
  // MARK: - Properties
  let searchView = SearchView()
  let searchController = UISearchController(searchResultsController: nil)
  
  // MARK: - Lifecycle
  override func viewDidLoad() {
    setupNavigationBar()
  }
  
  override func loadView() {
    self.view = searchView
  }
  
  private func setupNavigationBar() {
    let appearance = UINavigationBarAppearance()
    appearance.configureWithOpaqueBackground()
    appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    self.navigationItem.standardAppearance = appearance
    self.navigationItem.scrollEdgeAppearance = appearance
    
    searchController.hidesNavigationBarDuringPresentation = true
    searchController.searchBar.placeholder = "Pesquise aqui..."
    searchController.searchBar.delegate = self
    navigationItem.searchController = searchController
//    present(searchController, animated: true)
  }
}

extension SearchViewController: UISearchBarDelegate {
  
  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    //
  }
  
}
