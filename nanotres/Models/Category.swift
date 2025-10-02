//
//  Category.swift
//  nanotres
//
//  Created by Tiago Prestes on 02/10/25.
//

import Foundation
import UIKit

struct Category: Identifiable {
  let id = UUID()
  let name: String
  let image: UIImage
}
