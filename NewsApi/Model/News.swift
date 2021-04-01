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
        
    init(newsData: NewsData){
        for a in newsData.articles {
            author.append(a.author ?? "No author" )
            title.append(a.title ?? "No title")
            description.append(a.description ?? "No description")
            url.append(a.url ?? "no")
            urlToImage.append(a.urlToImage ?? "https://img.icons8.com/ios/452/no-image.png")
            publishedAt.append(a.publishedAt ?? "No publishedAt")
            content.append(a.content ?? "No content")
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
