//
//  SortButton.swift
//  nanotres
//
//  Created by Tiago Prestes on 05/10/25.
//

import Foundation
import UIKit

class SortButton: UIButton {
  // MARK: - Initializers
  init(symbol: UIImage, title: String) {
    super.init(frame: .zero)
    
    setupConfig(symbol: symbol, title: title)
    setupUpdate()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  private func setupConfig(symbol: UIImage, title: String) {
    var config = UIButton.Configuration.plain()
    config.image = symbol
    config.preferredSymbolConfigurationForImage = .init(weight: .medium)
    config.imagePlacement = .top
    config.imagePadding = 8
    
    var titleStr = AttributedString(title)
    titleStr.font = .systemFont(ofSize: 12, weight: .medium)
    config.attributedTitle = titleStr
    
    config.contentInsets = .init(top: 16, leading: 16, bottom: 16, trailing: 16)
    config.background.cornerRadius = 60
    config.background.strokeWidth = 0.5
    
    tintColor = .gray
    titleLabel?.numberOfLines = 2
    titleLabel?.textAlignment = .center
    
    self.configuration = config
  }
  
  private func setupUpdate() {
    configurationUpdateHandler = { button in
      var config = button.configuration
      let isSelected = button.isSelected
      
      config?.baseForegroundColor = isSelected ? .systemRed : .systemGray
      config?.background.backgroundColor = isSelected ? UIColor.systemRed.withAlphaComponent(0.1) : .systemBackground
      config?.background.strokeColor = isSelected ? .systemRed : .systemGray
      
      button.configuration = config
    }
  }
  
  private func setupConstraints() {
    self.widthAnchor.constraint(lessThanOrEqualToConstant: 80).isActive = true
  }
}
