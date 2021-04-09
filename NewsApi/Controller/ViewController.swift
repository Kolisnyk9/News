//
//  ViewController.swift
//  NewsApi
//
//  Created by Andrew on 07.04.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var picker: UIPickerView!
//    let tb = TableViewController()
    let nm = NewsManager()
    var key: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.picker.delegate = self
        self.picker.dataSource = self
        // Do any additional setup after loading the view.
    }
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return nm.countryFull.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return nm.countryFull[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let countryKey = nm.countryFull[row]
  
        switch countryKey {
            case "Arab Emirates": key = "ae"
            case "Argentinas": key = "ar"
            case "Austria": key = "at"
            case "Australia": key = "au"
            case "Belgium": key = "be"
            case "Bulgaria": key = "bg"
            case "Brazil": key = "br"
            case "Canada": key = "ca"
            case "Switzerland": key = "ch"
            case "China": key = "cn"
            case "Colombia": key = "co"
            case "Cuba": key = "cu"
            case "Czechia": key = "cz"
            case "Germany": key = "de"
            case "Egypt": key = "eg"
            case "France": key = "fr"
            case "United Kingdom": key = "gb"
            case "Greece": key = "gr"
            case "Hong Kong": key = "hk"
            case "Hungary": key = "hu"
            case "Indonesia": key = "id"
            case "Ireland": key = "ie"
            case "Israel": key = "il"
            case "India": key = "in"
            case "Italy": key = "it"
            case "Japan": key = "jp"
            case "South Korea": key = "kr"
            case "Lithuania": key = "lt"
            case "Latvia": key = "lv"
            case "Morocco": key = "ma"
            case "Mexico": key = "mx"
            case "Nigeria": key = "ng"
            case "Netherlands": key = "nl"
            case "Norway": key = "no"
            case "New Zealand": key = "nz"
            case "Philippines": key = "ph"
            case "Poland": key = "pl"
            case "Romania": key = "ro"
            case "Serbia": key = "rs"
            case "Russia": key = "ru"
            case "South Africa": key = "sa"
            case "Sweden": key = "se"
            case "Singapore": key = "sg"
            case "Slovenia": key = "si"
            case "Slovakia": key = "sk"
            case "Thailand": key = "th"
            case "Turkey": key = "tr"
            case "Taiwan": key = "tw"
            case "Ukraine": key = "ua"
            case "USA": key = "us"
            case "Venezuela": key = "ve"
            case "Portugal": key = "pt"
            default:
                key = "no data"
        }
        globalKey = key!
    }
}
