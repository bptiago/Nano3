//
//  CategoryFilterCell.swift
//  nanotres
//
//  Created by Tiago Prestes on 03/10/25.
//

import Foundation
import UIKit

class CategoryFilterCell: UICollectionViewCell {
  static let reuseIdentifier = "CategoryFilterCell"
  var categoryType: CategoryType?
  override var isSelected: Bool {
      didSet {
        contentView.backgroundColor = isSelected ? UIColor.systemRed.withAlphaComponent(0.15) : .labelGray
          titleLabel.textColor = isSelected ? .systemRed : .label
      }
  }
  
  // MARK: - Initializers
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubviews()
    setupConstraints()
    contentView.backgroundColor = .labelGray
    contentView.clipsToBounds = true
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    contentView.layer.cornerRadius = contentView.frame.height / 2
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  // MARK: - Subviews
  let titleLabel: UILabel = {
    let view = UILabel()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.textColor = .black
    view.font = .systemFont(ofSize: 12, weight: .medium)
    
    return view
  }()
  
  private(set) lazy var imageView: UIImageView = {
    let view = UIImageView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.contentMode = .scaleAspectFit
    
    return view
  }()
  
  private(set) lazy var stack: UIStackView = {
    let stack = UIStackView(
      arrangedSubviews: [imageView, titleLabel]
    )
    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.spacing = 8
    stack.axis = .horizontal
    stack.alignment = .center
    
    return stack
  }()
  
  
  // MARK: - Setup Methods
  func configure(with category: CategoryType ) {
    categoryType = category
    titleLabel.text = category.toString()
    imageView.image = category.toImage()
  }
  
  private func addSubviews() {
    contentView.addSubview(stack)
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      imageView.heightAnchor.constraint(equalToConstant: 30),
      imageView.widthAnchor.constraint(equalToConstant: 30),
      
      stack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
      stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
      stack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4)
    ])
  }
}
