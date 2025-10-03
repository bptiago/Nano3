//
//  CategoryType.swift
//  nanotres
//
//  Created by Tiago Prestes on 03/10/25.
//

import Foundation
import UIKit

enum CategoryType: String {
  case all, meals, snacks, drinks
  
  func toString() -> String {
    return switch self {
    case .all: "Tudo"
    case .meals: "Refeições"
    case .snacks: "Lanches"
    case .drinks: "Bebidas"
    }
  }
  
  func toImage() -> UIImage {
    return switch self {
    case .all: UIImage(resource: .placeholder)
    case .meals: UIImage(resource: .placeholder)
    case .snacks: UIImage(resource: .placeholder)
    case .drinks: UIImage(resource: .placeholder)
    }
  }
}
