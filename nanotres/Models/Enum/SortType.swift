//
//  SortType.swift
//  nanotres
//
//  Created by Tiago Prestes on 05/10/25.
//

import Foundation
import UIKit

enum SortType {
  case alphabeticalAsc
  case priceAsc
  case priceDesc
  
  func toString() -> String {
    return switch self {
    case .alphabeticalAsc: "Padrão"
    case .priceAsc: "Preço"
    case .priceDesc: "Preço"
    }
  }
  
  func toSfSymbol() -> UIImage {
    return switch self {
    case .alphabeticalAsc: UIImage(systemName: "line.3.horizontal.decrease")!
    case .priceAsc: UIImage(systemName: "arrow.up")!
    case .priceDesc: UIImage(systemName: "arrow.down")!
    }
  }
}
