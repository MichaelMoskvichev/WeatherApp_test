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
    var weatherWorker = WeatherWorker()
    
    //MARK: - Internal vars
    private var cityId: Int?
    
    //MARK: - IBOutlets
    @IBOutlet weak var nameCity: UITextField!
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
//MARK: - UITextFieldDelegate

extension WeatherCell: UITextFieldDelegate {
   
    @IBAction func searchPressed(_ sender: UIButton) {
        nameCity.endEditing(true)
        print(nameCity.text!)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameCity.endEditing(true)
        print(nameCity.text!)
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type somthing"
            return false
            
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let city = nameCity.text{
            weatherWorker.fetchWeater(cityName: city)
        }
        nameCity.text = ""
    }
}

//MARK: - WeatherManagerDelegate

extension WeatherCell: WeatherWorkerDelegate{
    
    func didUpdateWeather(_ weatherWorker : WeatherWorker, weather : WeatherModel) {
        DispatchQueue.main.async {
            self.temperature.text = weather.temperatureString
//            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
//            self.cityLabel.text = weather.name
        }
    }
    func didFailWithError(error: Error) {
        print(error)
    }
}
