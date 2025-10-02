//
//  HomeView.swift
//  nanotres
//
//  Created by Tiago Prestes on 01/10/25.
//

import Foundation
import UIKit

import UIKit

class HomeView: UIView {
  
  //MARK: - Initializers
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .white
    addSubviews()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  // MARK: - Subviews
  
  private(set) lazy var mainStackView: UIStackView = {
    let stack = UIStackView()
    
    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.axis = .vertical
    
    return stack
  }()
  
  private func createButton() -> CategoryButton {
    let icon = UIImage(resource: .placeholder)
    let button = CategoryButton(image: icon, title: "as")
    
    return button
  }
  
  // MARK: - SETUP
  private func addSubviews() {
    addSubview(mainStackView)
    setupConstraints()
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      mainStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      mainStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
      mainStackView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 16),
      mainStackView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -16),
    ])
  }
}
