//
//  ItemDetailViewController.swift
//  nanotres
//
//  Created by Tiago Prestes on 05/10/25.
//

import Foundation
import UIKit

class ItemDetailViewController: UIViewController {
  
  // MARK: - Properties
  private let foodItem: FoodItem
  let itemView: ItemDetailView
  
  // MARK: - Initializers
  init(foodItem: FoodItem) {
    self.foodItem = foodItem
    self.itemView = ItemDetailView(foodItem: foodItem)
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Lifecycle
  override func viewDidLoad() {
    self.view = itemView
  }
  
  override func loadView() {
  }
  
}
