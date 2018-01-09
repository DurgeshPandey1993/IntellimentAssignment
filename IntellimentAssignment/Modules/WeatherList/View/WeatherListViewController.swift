//
//  WeatherListViewController.swift
//  IntellimentAssignment
//
//  Created by Durgesh Pandey on 08/01/18.
//  Copyright © 2018 Durgesh Pandey. All rights reserved.
//

import UIKit

class WeatherListViewController: UITableViewController {
    
    var presenter: WeatherListPresentation!
    var weatherDataList = [WeatherListModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set Up View
        self.setUpView()
        
        //Create City Ids
        var cityIds = ""
        cityIds += "4163971" //Sydney
        cityIds += ",2147714" //Melbourne
        cityIds += ",2174003" //Brisbane

        //Fetch Weather Data
        presenter.fetchWeatherData(cityIds)
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
        
        //Set Dynamic height of Table View
        self.tableView.estimatedRowHeight = 50
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        //Register Nibs
        self.tableView.register(UINib.init(nibName: "WeatherListTableViewCell", bundle: nil), forCellReuseIdentifier: "WeatherListTableViewCell")
 
    }
    
    func setupNavigationBar() {
        
        //Set Large Title for Navigation Bar
        self.title = "Current Weather"
        
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
        } else {
            
            // Fallback on earlier versions
            self.navigationController?.navigationItem.title = "Current Weather"
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

extension WeatherListViewController: WeatherListView {
    
    func showWeather(_ weatherListModel: [WeatherListModel]) {
        
        //set Data Source
        self.weatherDataList = weatherListModel
        
        //Reload Table
        self.tableView.reloadData()
    }
    
    func showNoContentScreen() {
        
    }
}

extension WeatherListViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherDataList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let weatherListCell: WeatherListTableViewCell = tableView.dequeueReusableCell(withIdentifier: "WeatherListTableViewCell") as! WeatherListTableViewCell
        
        //Set Data
        let weatherListModel = self.weatherDataList[indexPath.row]
        weatherListCell.labelCityName.text = weatherListModel.name
        
        if let currentTemp = weatherListModel.main?.temp {
            weatherListCell.labelCurrenttemp.text =  "\(currentTemp)˚"
        }
        
        return weatherListCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //Deselect Selection
        tableView.deselectRow(at: indexPath, animated: true)
        
        //Navigate To Detail Screen
        presenter.router.navigateToDetailScreen(self.weatherDataList[indexPath.row])
    }
}
