//
//  NewsManager.swift
//  NewsApi
//
//  Created by Andrew Kolisnyk on 11/03/2021.
//

import Foundation


class NewsManager {
    
    var onComplition: ((News) -> Void)?
    let countryFull = ["Arab Emirates", "Argentina", "Austria", "Australia", "Belgium", "Bulgaria", "Brazil", "Canada", "Switzerland", "China", "Colombia", "Cuba", "Czechia", "Germany", "Egypt", "France", "United Kingdom", "Greece", "Hong Kong", "Hungary", "Indonesia", "Ireland", "Israel", "India", "Italy", "Japan", "South Korea", "Lithuania", "Latvia","Morocco",
                "Mexico" , "Nigeria", "Netherlands", "Norway", "New Zealand", "Philippines", "Poland", "Portugal", "Romania", "Serbia", "Russia", "South Africa", "Sweden", "Singapore", "Slovenia", "Slovakia", "Thailand", "Turkey", "Taiwan", "Ukraine", "USA", "Venezuela"]
    
    func fetchNews(countryKey: String){
        
        let urlString = "https://newsapi.org/v2/top-headlines?country=\(countryKey)&category=\(category)&apiKey=\(apiKey)"
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in
            if let data = data {
                if let news = self.parseJSON(withData: data){
                    self.onComplition?(news)
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
