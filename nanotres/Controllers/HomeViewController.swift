//
//  HomeViewController.swift
//  nanotres
//
//  Created by Tiago Prestes on 01/10/25.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
  
  // MARK: - Properties
  private let homeView = HomeView()
  private let categories: [Category] = [
    Category(name: "Tudo", image: UIImage(resource: .placeholder)),
    Category(name: "Refeições", image: UIImage(resource: .placeholder)),
    Category(name: "Lanches", image: UIImage(resource: .placeholder)),
    Category(name: "Bebidas", image: UIImage(resource: .placeholder)),
  ]
  let foodItems: [FoodItem] = [
      FoodItem(
        image: UIImage(systemName: "fork.knife")!,
        name: "Spaghetti Bolognese",
        price: 32.90,
        location: "Trattoria Bella Italia",
        description: "Massa artesanal coberta com um molho de tomate encorpado e carne moída suculenta. Uma receita clássica italiana que abraça o paladar a cada garfada."
      ),
      FoodItem(
        image: UIImage(systemName: "takeoutbag.and.cup.and.straw.fill")!,
        name: "Cheeseburger Combo",
        price: 24.50,
        location: "Burger House",
        description: "Hambúrguer suculento com queijo derretido, pão tostado e batatas douradas na medida certa. Um clássico que nunca decepciona."
      ),
      FoodItem(
        image: UIImage(systemName: "cup.and.saucer.fill")!,
        name: "Cappuccino",
        price: 8.90,
        location: "Café Central",
        description: "Café espresso encorpado com leite vaporizado e espuma cremosa. Perfeito para acompanhar uma boa conversa ou começar o dia com estilo."
      ),
      FoodItem(
        image: UIImage(systemName: "birthday.cake.fill")!,
        name: "Chocolate Cake",
        price: 15.00,
        location: "Sweet Dreams Bakery",
        description: "Bolo fofinho com camadas generosas de creme de chocolate e cobertura brilhante. Doce, intenso e impossível de resistir."
      ),
      FoodItem(
        image: UIImage(systemName: "leaf.fill")!,
        name: "Vegan Salad",
        price: 18.75,
        location: "Green Bowl",
        description: "Uma mistura vibrante de folhas frescas, grãos, legumes grelhados e um toque cítrico. Leve, saudável e cheia de sabor."
      ),
      FoodItem(
        image: UIImage(systemName: "fish.fill")!,
        name: "Grilled Salmon",
        price: 42.00,
        location: "Ocean View Restaurant",
        description: "Filé de salmão grelhado com crosta dourada, servido com legumes salteados e toque de limão. Um prato elegante e delicioso."
      ),
      FoodItem(
        image: UIImage(systemName: "wineglass.fill")!,
        name: "Red Wine",
        price: 27.50,
        location: "Wine & Dine",
        description: "Vinho tinto encorpado com notas de frutas vermelhas e leve toque amadeirado. Ideal para harmonizar com carnes, massas ou bons momentos."
      ),
      FoodItem(
        image: UIImage(systemName: "takeoutbag.and.cup.and.straw.fill")!,
        name: "Sushi Combo",
        price: 39.90,
        location: "Tokyo Bites",
        description: "Seleção de sushis e sashimis frescos preparados com precisão japonesa. Uma explosão de sabor e equilíbrio em cada peça."
      )
  ]

  // MARK: - Lifecycle
  
  override func loadView() {
    super.loadView()
    view = homeView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupNavigationBar()
    homeView.categoryCollectionView.dataSource = self
    homeView.categoryCollectionView.delegate = self
    homeView.foodCollectionView.delegate = self
    homeView.foodCollectionView.dataSource = self
  }
  
  private func setupNavigationBar() {
    let appearance = UINavigationBarAppearance()
    appearance.configureWithOpaqueBackground()
    appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    self.navigationItem.standardAppearance = appearance
    self.navigationItem.scrollEdgeAppearance = appearance
    
    let titleLabel = UILabel()
    titleLabel.text = "PUCPR"
    titleLabel.font = .systemFont(ofSize: 16, weight: .semibold)
    titleLabel.textColor = .black
    
    let searchButton = UIBarButtonItem(
      image: UIImage(systemName: "magnifyingglass"),
      style: .plain,
      target: self,
      action: #selector(didClickSearchButton)
    )
    searchButton.tintColor = .black
    
    self.navigationItem.rightBarButtonItem = searchButton
    self.navigationItem.titleView = titleLabel
  }
  
  @objc
  private func didClickSearchButton() {
    let vc = SearchViewController()
    navigationController?.pushViewController(vc, animated: true)
  }
  
}

extension HomeViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if collectionView == homeView.categoryCollectionView {
      return 4
    } else {
      return foodItems.count
    }
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath
  ) -> UICollectionViewCell {
    if collectionView == homeView.categoryCollectionView {
      guard let cell = collectionView.dequeueReusableCell(
        withReuseIdentifier: CategoryCell.reuseIdentifier,
        for: indexPath
      ) as? CategoryCell else {
        fatalError("Could not dequeue cell")
      }
      
      cell.configure(with: categories[indexPath.row])
      return cell
    } else {
      guard let cell = collectionView.dequeueReusableCell(
        withReuseIdentifier: FoodItemCell.reuseIdentifier,
        for: indexPath
      ) as? FoodItemCell else {
        fatalError("Could not dequeue cell")
      }
      
      cell.configure(with: foodItems[indexPath.row])
      return cell
    }
  }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    if collectionView == homeView.categoryCollectionView {
      let spacing: CGFloat = 8
      let totalSpacing = spacing * 3 // se tiver 4 colunas, tem 3 espaços
      let availableWidth = collectionView.bounds.width - totalSpacing
      let width = availableWidth / 4
      return CGSize(width: width, height: homeView.categoryCollectionView.frame.height)
    } else {
      return CGSize(width: 150, height: homeView.foodCollectionView.frame.height)
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    if collectionView == homeView.categoryCollectionView {
      let vc = SearchViewController()
      navigationController?.pushViewController(vc, animated: true)
    } else {
      let vc = ItemDetailViewController(foodItem: foodItems[indexPath.row])
      navigationController?.pushViewController(vc, animated: true)
    }
  }
}
