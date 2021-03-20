//
//  NewsManager.swift
//  NewsApi
//
//  Created by Andrew Kolisnyk on 11/03/2021.
//

import Foundation


class NewsManager {

    var urlString = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=\(apiKey)"
    func fetchNews(completionHandler: @escaping (News) -> Void){

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
