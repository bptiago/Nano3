//
//  SortViewController.swift
//  nanotres
//
//  Created by Tiago Prestes on 05/10/25.
//

import Foundation
import UIKit

class SortSheetViewController: UIViewController {
  
  // MARK: - Properties
  let sortSheetView = SortSheetView()
  
  // MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white
    self.view = sortSheetView
  }
}
