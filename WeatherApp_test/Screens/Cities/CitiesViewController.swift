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
    func display(data: [WeatherCellModel])
}

class CitiesViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet private var tableView: UITableView!
    
    //MARK: - External vars
    private(set) var router: CitiesRoutingLogic?
    
    //MARK: - Internal vars
    private var interactor: CitiesBusinessLogic?
    private var dataToDisplay = [WeatherCellModel]()
    
    
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
        let router = CitiesRouter()
        interactor.presenter = presenter
        presenter.viewController = viewController
        viewController.interactor = interactor
        viewController.router = router
        router.viewController = viewController
        //    router.dataStore = interactor
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        
        interactor?.fetchCities()
    }
    
    // MARK: Internal logic
    
    private func configureTableView() {
        //источник данныйх
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.register(UINib(nibName: "WeatherCell", bundle: nil), forCellReuseIdentifier: WeatherCell.cellIdentifier)
        
    }
    
}

//MARK: - UiTableViewDataSource & Delegate implementation

extension CitiesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataToDisplay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: WeatherCell.cellIdentifier, for: indexPath) as? WeatherCell else { return UITableViewCell() }
        
        cell.setup(data: dataToDisplay[indexPath.row])
        cell.delegate = self
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension CitiesViewController: WeatherCellDelegate{
    func didCellTap(cityId: Int) {
        router?.navigateToDetail(cityId: cityId)
    }
}

//MARK: - Display logic implementation

extension CitiesViewController: CitiesDisplayLogic {
    func display(data: [WeatherCellModel]) {
        dataToDisplay.removeAll()
        dataToDisplay.append(contentsOf: data)
        tableView.reloadData()
    }
    
}

