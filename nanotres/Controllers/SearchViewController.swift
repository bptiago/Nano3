//
//  SearchController.swift
//  nanotres
//
//  Created by Tiago Prestes on 02/10/25.
//

import Foundation
import UIKit

class SearchViewController: UIViewController {
  
  // MARK: - Properties
  var categoryType: CategoryType?
  let searchView = SearchView()
  let searchController = UISearchController(searchResultsController: nil)
  private let categoryFilters: [CategoryType] = [.all, .meals, .snacks, .drinks]
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
  override func viewDidLoad() {
    setupNavigationBar()
    searchView.categoryFiltersCollection.delegate = self
    searchView.categoryFiltersCollection.dataSource = self
    searchView.categoryFiltersCollection.showsHorizontalScrollIndicator = false
    
    searchView.foodItemsCollection.delegate = self
    searchView.foodItemsCollection.dataSource = self
    searchView.foodItemsCollection.showsVerticalScrollIndicator = false
  }
  
  override func loadView() {
    self.view = searchView
  }
  
  private func setupNavigationBar() {
    let appearance = UINavigationBarAppearance()
    appearance.configureWithOpaqueBackground()
    appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    self.navigationItem.standardAppearance = appearance
    self.navigationItem.scrollEdgeAppearance = appearance
    
    //    searchController.searchBar.placeholder = "Pesquise aqui..."
    //    searchController.searchBar.delegate = self
    //    navigationItem.searchController = searchController
    //    present(searchController, animated: true)
    
    let filterButton = UIBarButtonItem(
      image: UIImage(systemName: "line.3.horizontal.decrease")!,
      style: .plain,
      target: self,
      action: #selector(didClickFilterButton)
    )
    filterButton.tintColor = .black
    
    navigationItem.rightBarButtonItem = filterButton
  }
  
  @objc
  private func didClickFilterButton() {
    let vc = SortSheetViewController()
    if let sheet = vc.sheetPresentationController {
      sheet.detents = [.custom(resolver: { context in
        return 200
      })]
      sheet.prefersGrabberVisible = true
    }
    
    present(vc, animated: true)
  }
}

extension SearchViewController: UISearchBarDelegate {
  
  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    //
  }
  
}

extension SearchViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if collectionView == searchView.categoryFiltersCollection {
      return categoryFilters.count
    } else {
      return foodItems.count
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if collectionView == searchView.categoryFiltersCollection {
      guard let cell = collectionView.dequeueReusableCell(
        withReuseIdentifier: CategoryFilterCell.reuseIdentifier,
        for: indexPath
      ) as? CategoryFilterCell else {
        fatalError("Could not dequeue cell")
      }
      
      cell.configure(with: categoryFilters[indexPath.row])
      
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

extension SearchViewController: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    if collectionView == searchView.categoryFiltersCollection {
      // Filtro por tipo de comida
    } else {
      let vc = ItemDetailViewController(foodItem: foodItems[indexPath.row])
      navigationController?.pushViewController(vc, animated: true)
    }
  }
  
}
