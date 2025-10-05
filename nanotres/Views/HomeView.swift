//
//  HomeView.swift
//  nanotres
//
//  Created by Tiago Prestes on 01/10/25.
//

import Foundation
import UIKit

class HomeView: UIView {
  
  //MARK: - Initializers
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .white
    addSubviews()
    setupConstraints()
    setupCollectionView()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  // MARK: - Subviews
  let foodCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    
    let view = UICollectionView(
      frame: .zero,
      collectionViewLayout: layout
    )
    view.translatesAutoresizingMaskIntoConstraints = false

    return view
  }()
  
  let categoryCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.minimumInteritemSpacing = 8
    
    let view = UICollectionView(
      frame: .zero,
      collectionViewLayout: layout
    )
    
    view.translatesAutoresizingMaskIntoConstraints = false
    
    return view
  }()
  
  // MARK: - SETUP
  private func addSubviews() {
    addSubview(categoryCollectionView)
    addSubview(foodCollectionView)
  }
  
  private func setupCollectionView() {
    categoryCollectionView.register(
      CategoryCell.self,
      forCellWithReuseIdentifier: CategoryCell.reuseIdentifier
    )
    
    foodCollectionView.register(
      FoodItemCell.self,
      forCellWithReuseIdentifier: FoodItemCell.reuseIdentifier
    )
    foodCollectionView.showsHorizontalScrollIndicator = false
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      categoryCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: DesignToken.mediumSpacing),
      categoryCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: DesignToken.borderSpacing),
      categoryCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: DesignToken.borderSpacingNeg),
      categoryCollectionView.heightAnchor.constraint(equalToConstant: 90),

      foodCollectionView.topAnchor.constraint(equalTo: categoryCollectionView.bottomAnchor, constant: DesignToken.mediumSpacing),
      foodCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: DesignToken.borderSpacing),
      foodCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
      foodCollectionView.bottomAnchor.constraint(equalTo: foodCollectionView.topAnchor, constant: 200)
    ])
  }
}
