//
//  SearchView.swift
//  nanotres
//
//  Created by Tiago Prestes on 02/10/25.
//

import Foundation
import UIKit

class SearchView: UIView {
  // MARK: - Initializers
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = .white
    addSubviews()
    setupConstraints()
    setupCollectionView()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  // MARK: - Subviews
  let categoryFiltersCollection: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
    
    let view = UICollectionView(
      frame: .zero,
      collectionViewLayout: layout
    )
    view.translatesAutoresizingMaskIntoConstraints = false
    
    return view
  }()
  
  // MARK: - Setup Methods
  private func setupCollectionView() {
    categoryFiltersCollection.register(
      CategoryFilterCell.self,
      forCellWithReuseIdentifier: CategoryFilterCell.reuseIdentifier
    )
  }
  
  private func addSubviews() {
    addSubview(categoryFiltersCollection)
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      categoryFiltersCollection.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
      categoryFiltersCollection.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
      categoryFiltersCollection.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      categoryFiltersCollection.heightAnchor.constraint(equalToConstant: 45)
    ])
  }
}
