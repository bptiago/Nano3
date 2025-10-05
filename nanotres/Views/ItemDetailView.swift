//
//  ItemDetailView.swift
//  nanotres
//
//  Created by Tiago Prestes on 05/10/25.
//

import Foundation
import UIKit

class ItemDetailView: UIView {
  
  // MARK: - Initializers
  init(foodItem: FoodItem) {
    super.init(frame: .zero)
  
    self.backgroundColor = .white
    addSubviews()
    setupConstraints()
    configure(with: foodItem)
  }
  
  required init?(coder: NSCoder) {
    fatalError("use init(foodItem:)")
  }
  
  // MARK: - Subviews
  let titleLabel: UILabel = {
    let view = UILabel()
    view.text = "Text"
    view.font = .systemFont(ofSize: 24, weight: .bold)
    view.translatesAutoresizingMaskIntoConstraints = false
    
    return view
  }()
  
  let locationLabel: UILabel = {
    let view = UILabel()
    view.text = "Bloco 6"
    view.font = .systemFont(ofSize: 16, weight: .semibold)
    view.translatesAutoresizingMaskIntoConstraints = false
    
    return view
  }()

  let priceLabel: UILabel = {
    let view = UILabel()
    view.font = .systemFont(ofSize: 16, weight: .semibold)
    view.text = "R$100,00"
    view.translatesAutoresizingMaskIntoConstraints = false
    
    return view
  }()
  
  private(set) lazy var imageView: UIImageView = {
    let image = UIImage(resource: .placeholder)
    
    let view = UIImageView(image: image)
    view.translatesAutoresizingMaskIntoConstraints = false
    view.contentMode = .scaleAspectFill
    view.clipsToBounds = true
    
    return view
  }()
  
  let descriptionHeader: UILabel = {
    let view = UILabel()
    view.text = "Detalhes"
    view.font = .systemFont(ofSize: 16, weight: .bold)
    view.translatesAutoresizingMaskIntoConstraints = false
    
    return view
  }()

  let descriptionBody: UILabel = {
    let view = UILabel()
    view.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam auctor quam id massa faucibus dignissim. Nullam eget metus id nisl malesuada condimentum. Nam viverra fringilla erat, ut fermentum nunc feugiat eu."
    view.font = .systemFont(ofSize: 14, weight: .regular)
    view.textColor = .darkGray
    view.numberOfLines = 0
    view.translatesAutoresizingMaskIntoConstraints = false
    
    return view
  }()
  
  private(set) lazy var subtitleStack: UIStackView = {
    let stack = UIStackView(
      arrangedSubviews: [priceLabel, locationLabel]
    )
    stack.axis = .horizontal
    stack.alignment = .fill
    stack.distribution = .equalSpacing
    stack.translatesAutoresizingMaskIntoConstraints = false
    
    return stack
  }()
  
  private(set) lazy var descriptionStack: UIStackView = {
    let stack = UIStackView(
      arrangedSubviews: [descriptionHeader, descriptionBody]
    )
    stack.axis = .vertical
    stack.alignment = .fill
    stack.spacing = 8
    stack.translatesAutoresizingMaskIntoConstraints = false
    
    return stack
  }()
  
  // MARK: - Setup Methods
  private func configure(with item: FoodItem) {
    titleLabel.text = item.name
    locationLabel.text = item.location
    priceLabel.text = String(format: "$%.2f", item.price)
    descriptionBody.text = item.description
  }
  
  private func addSubviews() {
    addSubview(titleLabel)
    addSubview(subtitleStack)
    addSubview(imageView)
    addSubview(descriptionStack)
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: DesignToken.mediumSpacing),
      titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: DesignToken.borderSpacing),
      titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: DesignToken.borderSpacingNeg),
      
      subtitleStack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: DesignToken.smallSpacing),
      subtitleStack.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
      subtitleStack.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
      
      imageView.topAnchor.constraint(equalTo: subtitleStack.bottomAnchor, constant: DesignToken.largeSpacing),
      imageView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
      imageView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
      imageView.heightAnchor.constraint(equalToConstant: 300),
      
      descriptionStack.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: DesignToken.largeSpacing),
      descriptionStack.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
      descriptionStack.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
    ])
  }
}
