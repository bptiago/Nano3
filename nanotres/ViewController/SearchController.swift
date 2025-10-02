//
//  SearchController.swift
//  nanotres
//
//  Created by Tiago Prestes on 02/10/25.
//

import Foundation
import UIKit

class SearchController: UIViewController {
  
  // MARK: - Properties
  let searchView = SearchView()
  
  // MARK: - Lifecycle
  override func viewDidLoad() {
    
  }
  
  override func loadView() {
    self.view = searchView
  }
  
}
