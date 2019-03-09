//
//  ViewController.swift
//  WeatherApp
//


import UIKit
import CoreLocation


class WeatherViewController: UIViewController, CLLocationManagerDelegate{
    
    
    let WEATHER_URL = "http://api.openweathermap.org/data/2.5/forecast?id=524901&APPID={APP_ID}"
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
        
    
    
        
        
    }
    
    
    
  
    
    
    
    
    
}


