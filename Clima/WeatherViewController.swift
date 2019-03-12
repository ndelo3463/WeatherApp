//
//  ViewController.swift
//  WeatherApp
//


import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON




class WeatherViewController: UIViewController, CLLocationManagerDelegate {
    
    
    lazy var WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather"
    let APP_ID = "30cc3152886a5e4bd4ed0a6da491232c"
    
    let locationManager = CLLocationManager()
    
  
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[locations.count - 1]
        if location.horizontalAccuracy > 0 {
            locationManager.stopUpdatingLocation()
            print("longitude = \(location.coordinate.longitude), latitude = \(location.coordinate.latitude)")
            
            let latitude = String(location.coordinate.latitude)
            let longitude =  String(location.coordinate.longitude)
            
            let params : [String : String] = ["lat" : latitude, "long" : longitude, "appid" : APP_ID ]
            
            getWeatherData(url: WEATHER_URL, parameters: params)
            
        }
        
    }
    
    func getWeatherData(url:String, parameters: [String:String]) {
        Alamofire.request(url, method: .get, parameters: parameters).responseJSON {
            response in
            if response.result.isSuccess{
                print("Success, got the weather data")
                
                let weatherJSON : JSON = JSON(response.result.value!)
                
                print(weatherJSON)
                
                
            }
            else{
                print("Error \(response.result.error!)")
                self.cityLabel.text = "Connection Issues Yo"
            }
        }
    }
    
    
    
    
  
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        cityLabel.text = "Location Unavailable YO"
        
    }
    
    func updateWeatherData (json: JSON) {
        
        let tempResult = json["main"]["temp"]
        
    }
    
    
}


