//
//  NewsManager.swift
//  NewsApi
//
//  Created by Andrew Kolisnyk on 11/03/2021.
//

import Foundation


class NewsManager {
    
    
    var category = ""
    var countryKey = "us"
    var source = ""
    var urlString = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=\(apiKey)"
    
    func getUrlCountry(country: String) {
    
        switch country {
        case "Arab Emirates": countryKey = "ae"
        case "Argentinas": countryKey = "ar"
        case "Austria": countryKey = "at"
        case "Australia": countryKey = "au"
        case "Belgium": countryKey = "be"
        case "Bulgaria": countryKey = "bg"
        case "Brazil": countryKey = "br"
        case "Canada": countryKey = "ca"
        case "Switzerland": countryKey = "ch"
        case "China": countryKey = "cn"
        case "Colombia": countryKey = "co"
        case "Cuba": countryKey = "cu"
        case "Czechia": countryKey = "cz"
        case "Germany": countryKey = "de"
        case "Egypt": countryKey = "eg"
        case "France": countryKey = "fr"
        case "United Kingdom": countryKey = "gb"
        case "Greece": countryKey = "gr"
        case "Hong Kong": countryKey = "hk"
        case "Hungary": countryKey = "hu"
        case "Indonesia": countryKey = "id"
        case "Ireland": countryKey = "ie"
        case "Israel": countryKey = "il"
        case "India": countryKey = "in"
        case "Italy": countryKey = "it"
        case "Japan": countryKey = "jp"
        case "South Korea": countryKey = "kr"
        case "Lithuania": countryKey = "lt"
        case "Latvia": countryKey = "lv"
        case "Morocco": countryKey = "ma"
        case "Mexico": countryKey = "mx"
        case "Nigeria": countryKey = "ng"
        case "Netherlands": countryKey = "nl"
        case "Norway": countryKey = "no"
        case "New Zealand": countryKey = "nz"
        case "Philippines": countryKey = "ph"
        case "Poland": countryKey = "pl"
        case "Romania": countryKey = "ro"
        case "Serbia": countryKey = "rs"
        case "Russia": countryKey = "ru"
        case "South Africa": countryKey = "sa"
        case "Sweden": countryKey = "se"
        case "Singapore": countryKey = "sg"
        case "Slovenia": countryKey = "si"
        case "Slovakia": countryKey = "sk"
        case "Thailand": countryKey = "th"
        case "Turkey": countryKey = "tr"
        case "Taiwan": countryKey = "tw"
        case "Ukraine": countryKey = "ua"
        case "USA": countryKey = "us"
        case "Venezuela": countryKey = "ve"
        case "Portugal": countryKey = "pt"
        default:
            countryKey = "us"
        }
        print(countryKey)
    
    
        urlString = "https://newsapi.org/v2/top-headlines?country=\(countryKey)&category=business&apiKey=\(apiKey)"
        print(urlString)
    }
    func fetchNews(completionHandler: @escaping (News) -> Void){
        
        print(urlString)
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in
            if let data = data {
                if let news = self.parseJSON(withData: data){
                    completionHandler(news)
                }
            }
            if let error = error{
                print("Помилка в сесії \(error.localizedDescription)")
            }
        }
        task.resume()
    }
    
    fileprivate func parseJSON(withData data: Data) -> News? {
        let decoder = JSONDecoder()
        do {
            let currentNews = try decoder.decode(NewsData.self, from: data)
            let news = News(newsData: currentNews)
            return news
        } catch let error as NSError{
            print("Помилка в JSONDecoderp\(error.localizedDescription)")
            
        }
        print("return nil")
        return nil
    }
}
