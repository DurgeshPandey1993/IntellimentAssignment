//
//  WeatherDetailViewController.swift
//  IntellimentAssignment
//
//  Created by Durgesh Pandey on 08/01/18.
//  Copyright © 2018 Durgesh Pandey. All rights reserved.
//

import UIKit

class WeatherDetailViewController: UIViewController {
    
    var presenter: WeatherDetailPresentation!
    var weatherDetailData: WeatherDetailModel?
    var forecastList = [WeatherDetailListModel]()
    var weatherListModel: WeatherListModel?
    
    //Varibale to get cityId from previous Screen
    var cityId = ""
    
    @IBOutlet weak var tableViewWeatherDetail: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set Up View
        self.setUpView()
        
        //Fetch Weather Data
        presenter.fetchWeatherDetailData(cityId)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpView() {
        
        //set Navigation Bar
        setupNavigationBar()
        
        //Register Nibs
        self.tableViewWeatherDetail.register(UINib.init(nibName: "WeatherDetailCurrentTableViewCell", bundle: nil), forCellReuseIdentifier: "WeatherDetailCurrentTableViewCell")
        self.tableViewWeatherDetail.register(UINib.init(nibName: "WeatherDetailForecastTableViewCell", bundle: nil), forCellReuseIdentifier: "WeatherDetailForecastTableViewCell")
        self.tableViewWeatherDetail.register(UINib.init(nibName: "ForecastHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "ForecastHeaderTableViewCell")
        
        
    }
    
    func setupNavigationBar() {
        
        //Set Large Title for Navigation Bar
        self.title = "Weather Detail"
        
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
        } else {
            
            // Fallback on earlier versions
            self.navigationController?.navigationItem.title = "Weather Detail"
        }
        
        if #available(iOS 11.0, *) {
            self.navigationItem.largeTitleDisplayMode = .always
        } else {
            // Fallback on earlier versions
        }
        
        //Change Fontcolor for Large navigation Title
        let attributes = [NSAttributedStringKey.foregroundColor : UIColor.darkGray]
        
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.largeTitleTextAttributes = attributes
        } else {
            // Fallback on earlier versions
        }
    }
}

extension WeatherDetailViewController: WeatherDetailView {
    
    func showWeatherDetail(_ weatherDetailModel: WeatherDetailModel) {
        self.weatherDetailData = weatherDetailModel
        
        if let forecastList = self.weatherDetailData?.list {
            self.forecastList = forecastList
        }
        
        //Reload Table
        self.tableViewWeatherDetail.reloadData()
    }
    
    func showNoContentScreen() {
        
    }
}

extension WeatherDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return self.forecastList.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            
            //Present Current Weather Data
            let currentWeather: WeatherDetailCurrentTableViewCell = tableView.dequeueReusableCell(withIdentifier: "WeatherDetailCurrentTableViewCell") as! WeatherDetailCurrentTableViewCell
            
            if let currentWeatherModel = self.weatherListModel {
                currentWeather.labelCityName.text = currentWeatherModel.name!
                
                currentWeather.imageViewWeatherIcon.image = UIImage.init(named: getWeatherIcon((currentWeatherModel.weather?.first?.icon!)!))
                if let currentTemp = currentWeatherModel.main?.temp {
                    currentWeather.labelCurrentTemp.text =  "\(currentTemp)˚"
                }
                
                currentWeather.labelTempMaxMin.text = String.init(format: "%.f˚/%.f˚", (currentWeatherModel.main?.temp_min)!, (currentWeatherModel.main?.temp_max)!)
                currentWeather.labelCondition.text = currentWeatherModel.weather?.first?.main!
                
            }
            
            currentWeather.selectionStyle = .none
            return currentWeather
            
        case 1:
            
            //Present ForeCast
            let forecastWeather: WeatherDetailForecastTableViewCell = tableView.dequeueReusableCell(withIdentifier: "WeatherDetailForecastTableViewCell") as! WeatherDetailForecastTableViewCell
            
            let forecastModel = self.forecastList[indexPath.row]
            forecastWeather.timeLabel.text = getTimeStringFromDateString(forecastModel.dt_txt!)
            forecastWeather.imageViewWeatherIcon.image = UIImage.init(named: getWeatherIcon((forecastModel.weather?.first?.icon!)!))
            forecastWeather.tempLabel.text = String.init(format: "%.f˚/%.f˚", ((forecastModel.main?.temp_min)! - 273.15), ((forecastModel.main?.temp_max)! - 273.15))
            
            forecastWeather.selectionStyle = .none
            return forecastWeather
            
        default:
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 1 {
            let forecastHeader: ForecastHeaderTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ForecastHeaderTableViewCell") as! ForecastHeaderTableViewCell
            return forecastHeader.contentView
        }
        
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        switch section {
        case 0:
            return 0
        case 1:
            return 50
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.section {
        case 0:
            return self.view.bounds.size.height - 20 - (self.navigationController?.navigationBar.bounds.size.height)!
        case 1:
            return 50
        default:
            return 0
        }
    }
    
}

