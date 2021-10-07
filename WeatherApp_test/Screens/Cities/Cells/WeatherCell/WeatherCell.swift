//
//  WeatherCell.swift
//  WeatherApp_test
//
//  Created by Миша Москвичев on 06.10.2021.
//

import UIKit

protocol WeatherCellDelegate: class {
    func didCellTap(cityId: Int)
}

class WeatherCell: UITableViewCell {
    
    static let cellIdentifier = "WeatherCell"
    
    //MARK: - External vars
    weak var delegate: WeatherCellDelegate?
    
    //MARK: - Internal vars
    private var cityId: Int?
    
    //MARK: - IBOutlets
    @IBOutlet weak var nameCity: UILabel!
    @IBOutlet weak var temperature: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func didNextTap(_ sender: Any) {
        guard let cityId = cityId else { return }
        delegate?.didCellTap(cityId: cityId)
    }
    
    
    func setup(data: WeatherCellModel) {
        cityId = data.cityId
        nameCity.text = data.cityName
        temperature.text = data.temperature
    }
    
}
