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
  var categoryType: CategoryType?
  let searchView = SearchView()
  let searchController = UISearchController(searchResultsController: nil)
  private let categoryFilters: [CategoryType] = [.all, .meals, .snacks, .drinks]

  
  // MARK: - Lifecycle
  override func viewDidLoad() {
    setupNavigationBar()
    searchView.categoryFiltersCollection.delegate = self
    searchView.categoryFiltersCollection.dataSource = self
    searchView.categoryFiltersCollection.showsHorizontalScrollIndicator = false
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

extension SearchViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return categoryFilters.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: CategoryFilterCell.reuseIdentifier,
      for: indexPath
    ) as? CategoryFilterCell else {
      fatalError("Could not dequeue cell")
    }
    
    cell.configure(with: categoryFilters[indexPath.row])
    
    return cell
  }
  
}

extension SearchViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    print("oi")
  }
}
