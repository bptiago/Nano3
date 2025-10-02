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
  
  private(set) lazy var mainStackView: UIStackView = {
    let stack = UIStackView(
      arrangedSubviews: [categoryCollectionView]
    )
    
    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.axis = .vertical
    
    return stack
  }()
  
  // MARK: - SETUP
  private func addSubviews() {
    addSubview(mainStackView)
  }
  
  private func setupCollectionView() {
    categoryCollectionView.register(
      CategoryCell.self,
      forCellWithReuseIdentifier: CategoryCell.reuseIdentifier
    )
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      mainStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
      mainStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
      mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
      mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
    ])
  }
}
