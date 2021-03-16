//
//  News.swift
//  NewsApi
//
//  Created by Andrew Kolisnyk on 11/03/2021.
//

import Foundation
struct News {
 
    var author: [String] = [""]
    var title: [String] = [""]
    var description: [String] = [""]
    var url: [String] = [""]
    var urlToImage:[String] = [""]
    var publishedAt: [String] = [""]
    var content: [String] = [""]

//    func getNews() -> [News]{
//        var news = [News]()
//        
//        return news
//    }
    
    
    init(newsData: NewsData){
        for a in newsData.articles {
            author.append(a.author ?? "no" )
            title.append(a.title ?? "no")
            description.append(a.description ?? "no")
            url.append(a.url ?? "no")
            urlToImage.append(a.urlToImage ?? "no")
            publishedAt.append(a.publishedAt ?? "no")
            content.append(a.content ?? "no")
        }
        author.remove(at: 0)
        title.remove(at: 0)
        description.remove(at: 0)
        url.remove(at: 0)
        urlToImage.remove(at: 0)
        publishedAt.remove(at: 0)
        content.remove(at: 0)
        
    }
}
