//
//  HomeViewController.swift
//  nanotres
//
//  Created by Tiago Prestes on 01/10/25.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
  
  private let homeView = HomeView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view = homeView
  }
  
}
