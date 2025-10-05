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
  let foodItemsCollection: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
    
    let view = UICollectionView(
      frame: .zero,
      collectionViewLayout: layout
    )
    view.translatesAutoresizingMaskIntoConstraints = false
    
    return view
  }()
  
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
    
    foodItemsCollection.register(
      FoodItemCell.self,
      forCellWithReuseIdentifier: FoodItemCell.reuseIdentifier
    )
  }
  
  private func addSubviews() {
    addSubview(categoryFiltersCollection)
    addSubview(foodItemsCollection)
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      categoryFiltersCollection.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
      categoryFiltersCollection.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
      categoryFiltersCollection.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      categoryFiltersCollection.heightAnchor.constraint(equalToConstant: 45),
      
      foodItemsCollection.topAnchor.constraint(equalTo: categoryFiltersCollection.bottomAnchor, constant: 16),
      foodItemsCollection.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
      foodItemsCollection.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
      foodItemsCollection.bottomAnchor.constraint(equalTo: self.bottomAnchor)
    ])
  }
}
