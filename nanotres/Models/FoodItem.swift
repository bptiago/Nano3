//
//  FoodItem.swift
//  nanotres
//
//  Created by Tiago Prestes on 02/10/25.
//

import Foundation
import UIKit

struct FoodItem: Identifiable {
  let id = UUID()
  let image: UIImage
  let name: String
  let price: Double
  let location: String
  let description: String
}
