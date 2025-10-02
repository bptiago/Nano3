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
  
  // MARK: - Initializers
  override init(frame: CGRect) {
    super.init(frame: frame)
    contentView.backgroundColor = .labelGray
    contentView.layer.cornerRadius = 8
    addSubviews()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configure(with category: Category){
    profileImage.image = category.image
    nameLabel.text = category.name
  }
  
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
  
  // MARK: - Setup Methods
  private func addSubviews() {
    contentView.addSubview(profileImage)
    contentView.addSubview(nameLabel)
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      profileImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
      profileImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      profileImage.heightAnchor.constraint(equalToConstant: 60),
      profileImage.widthAnchor.constraint(equalToConstant: 60), // keep it square
      
      nameLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor),
      nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4)
    ])
  }
}
