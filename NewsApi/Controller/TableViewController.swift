//
//  TableViewController.swift
//  NewsApi
//
//  Created by Andrew Kolisnyk on 12/03/2021.
//

import UIKit

class TableViewController: UITableViewController {
    
    var newsManager = NewsManager()
    var authorName: [String] = [""]
    var titleNews: [String] = [""]
    var descriptionNews: [String] = [""]
    var url: [String] = [""]
    var urlToImage: [String] = [""]
    var imageUrl: [URL] = []
    var publishedAt: [String] = [""]
    var content: [String] = [""]
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        newsManager.fetchNews { news in
            DispatchQueue.main.async {
                self.authorName = news.author
                self.titleNews = news.title
                self.descriptionNews = news.description
                self.url = news.url
                self.urlToImage = news.urlToImage
                self.imageUrl = news.imageUrl
                self.publishedAt = news.publishedAt
                self.content = news.content
                self.tableView.reloadData()
            }
        }
        
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return authorName.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.titleLabel.text = titleNews[indexPath.row]
        cell.descriptionLabel.text = descriptionNews[indexPath.row]
        cell.dateLabel.text = publishedAt[indexPath.row]
        cell.authorLabel.text = authorName[indexPath.row]
        cell.newsImage.downloaded(from: urlToImage[indexPath.row])
        return cell
    }
}



// MARK: - Image from string url
extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}


