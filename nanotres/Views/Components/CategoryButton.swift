//
//  CategoryLabel.swift
//  nanotres
//
//  Created by Tiago Prestes on 01/10/25.
//

import Foundation
import UIKit

class CategoryButton: UIButton {
  
  init(image: UIImage, title: String) {
    super.init(frame: .zero)
    setup(image: image, title: title)
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  private func setup(image: UIImage, title: String) {
    var config = UIButton.Configuration.plain()
    config.image = image
    config.imagePlacement = .top
    config.imagePadding = 8
    config.attributedTitle = AttributedString(
      title,
      attributes: AttributeContainer([
        .font: UIFont.systemFont(ofSize: 14, weight: .medium)
      ])
    )
    self.configuration = config
    
    setTitle(title, for: .normal)
    setTitleColor(.label, for: .normal)
    titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
    
    setImage(image, for: .normal)
    tintColor = .systemBlue
    
    backgroundColor = .systemGray6
    layer.cornerRadius = 16
    clipsToBounds = true
  }
}
