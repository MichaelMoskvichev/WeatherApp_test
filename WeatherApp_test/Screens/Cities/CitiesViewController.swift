//
//  CitiesViewController.swift
//  WeatherApp_test
//
//  Created by Миша Москвичев on 06.10.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol CitiesDisplayLogic: class {
  func displayData()
}

class CitiesViewController: UIViewController {
    
    
    //MARK: - IBOutlet
    @IBOutlet private var tableView: UITableView!
    
    //MARK: - External vars
    
    //MARK: - Internal vars
    private var interactor: CitiesBusinessLogic?
    
//  var router: (NSObjectProtocol & CitiesRoutingLogic & CitiesDataPassing)?

  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup() {
    let viewController = self
    let presenter = CitiesPresenter()
    let interactor = CitiesInteractor()
    interactor.presenter = presenter
    presenter.viewController = viewController
    viewController.interactor = interactor
//    let router = CitiesRouter()
//    viewController.router = router
//    router.viewController = viewController
//    router.dataStore = interactor
  }
    
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
//      if let router = router, router.responds(to: selector) {
//        router.perform(selector, with: segue)
//      }
    }
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
      interactor?.fetchCities()
  }
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
//  func doSomething()
//  {
//    let request = Cities.Something.Request()
//    interactor?.doSomething(request: request)
//  }
//
//  func displaySomething(viewModel: Cities.Something.ViewModel)
//  {
//    //nameTextField.text = viewModel.name
//  }
    
}
//MARK: - extension VC

extension CitiesViewController: CitiesDisplayLogic {
    func displayData() {
        //display data
    }
}
