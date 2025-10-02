//
//  FoodItemCell.swift
//  nanotres
//
//  Created by Tiago Prestes on 02/10/25.
//

import Foundation
import UIKit

class FoodItemCell: UICollectionViewCell {
  static let reuseIdentifier = "FoodItemCell"
  
  // MARK: - Initializers
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubviews()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  // MARK: - Subviews
  private(set) lazy var imageView: UIImageView = {
    let image = UIImage(resource: .placeholder)
    
    let view = UIImageView(image: image)
    view.translatesAutoresizingMaskIntoConstraints = false
    view.contentMode = .scaleAspectFill
    view.clipsToBounds = true
    
    return view
  }()
  
  let nameLabel: UILabel = {
    let view = UILabel()
    view.font = .systemFont(ofSize: 16, weight: .semibold)
    view.numberOfLines = 1
    
    view.translatesAutoresizingMaskIntoConstraints = false
    
    return view
  }()
  
  let priceLabel: UILabel = {
    let view = UILabel()
    view.font = .systemFont(ofSize: 20, weight: .bold)
    view.translatesAutoresizingMaskIntoConstraints = false
    
    return view
  }()
  
  let locationLabel: UILabel = {
    let view = UILabel()
    view.font = .systemFont(ofSize: 12, weight: .semibold)
    view.translatesAutoresizingMaskIntoConstraints = false
    
    return view
  }()
  
  private(set) lazy var stack: UIStackView = {
    let stack = UIStackView(
      arrangedSubviews: [nameLabel, priceLabel, locationLabel]
    )
    
    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.axis = .vertical
    stack.spacing = 4
    
    return stack
  }()
  
  // MARK: - Setup Methods
  func configure(with item: FoodItem) {
    nameLabel.text = item.name
    priceLabel.text = String.init(format: "$%.2f", item.price)
    locationLabel.text = item.location
  }
  
  private func addSubviews() {
    contentView.addSubview(imageView)
    contentView.addSubview(stack)
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
      imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      imageView.heightAnchor.constraint(equalToConstant: 120),
      
      stack.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
      stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
      stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
      stack.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -8)
    ])
  }
}
