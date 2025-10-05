//
//  SortSheetView.swift
//  nanotres
//
//  Created by Tiago Prestes on 05/10/25.
//

import Foundation
import UIKit

class SortSheetView: UIView {
  private let types: [SortType] = [.alphabeticalAsc, .priceAsc, .priceDesc]
  
  // MARK: - Initializers
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .systemBackground
    
    addSubviews()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  // MARK: - Subviews
  private(set) lazy var stack: UIStackView = {
    let stack = UIStackView()
    stack.axis = .horizontal
    stack.alignment = .center
    stack.spacing = 16
    stack.translatesAutoresizingMaskIntoConstraints = false
    
    return stack
  }()
  
  let titleLabel: UILabel = {
    let label = UILabel()
    
    label.font = .systemFont(ofSize: 24, weight: .semibold)
    label.text = "Ordenação por"
    label.textColor = .black
    label.translatesAutoresizingMaskIntoConstraints = false
    
    return label
  }()
  
  // MARK: - Actions
  @objc
  private func didClickButton(_ sender: UIButton) {
    let buttons = stack.arrangedSubviews as? [UIButton]
    buttons?.forEach { $0.isSelected = $0 == sender }
  }
  
  // MARK: - Setup Methods
  private func addSubviews() {
    addSubview(titleLabel)
    addSubview(stack)
    
    for (index, type) in types.enumerated() {
      let button = SortButton(
        symbol: type.toSfSymbol(),
        title: type.toString()
      )
      
      button.addTarget(
        self,
        action: #selector(didClickButton(_:)),
        for: .touchUpInside
      )
      button.isSelected = false
      button.tag = index
      
      stack.addArrangedSubview(button)
    }
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 32),
      titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      
      stack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
      stack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
    ])
  }
}
