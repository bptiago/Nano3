//
//  CategoryCell.swift
//  nanotres
//
//  Created by Tiago Prestes on 02/10/25.
//

import Foundation
import UIKit

class CategoryCell: UICollectionViewCell {
  static let reuseIdentifier: String = "CategoryCell"
  
  // MARK: - Subviews
  private(set) lazy var profileImage: UIImageView = {
    
    let view = UIImageView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.contentMode = .scaleAspectFit
    view.clipsToBounds = true
    return view
  }()
  
  private(set) lazy var nameLabel: UILabel = {
    
    let view = UILabel()
    view.translatesAutoresizingMaskIntoConstraints = false
    
    view.textColor = .black
    view.font = .systemFont(ofSize: 12, weight: .semibold)
    view.textAlignment = .center
    return view
  }()
  
  private lazy var stackView: UIStackView = {
    let view = UIStackView(arrangedSubviews: [profileImage, nameLabel])
    view.translatesAutoresizingMaskIntoConstraints = false
    view.axis = .vertical
    view.alignment = .center
    view.spacing = 0
    return view
  }()
  
  // MARK: - Initializers
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubviews()
    setupConstraints()
    backgroundColor = .labelGray
    layer.cornerRadius = 12
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setup(with category: Category){
    profileImage.image = category.image
    nameLabel.text = category.name
  }
  
  // MARK: - Setup Methods
  private func addSubviews() {
    addSubview(stackView)
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
      stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
      stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
      stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
      
      profileImage.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
      profileImage.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.8),
      profileImage.heightAnchor.constraint(equalTo: profileImage.widthAnchor)
    ])
  }
}
