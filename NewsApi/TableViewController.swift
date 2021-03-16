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
                self.publishedAt = news.publishedAt
                self.content = news.content
                self.tableView.reloadData()
            }
            

        }
        tableView.reloadData()
    }
    
    func updateData(News:News){
        
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print(authorName.count)
        return authorName.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        cell.authorNameLabel.text = authorName[indexPath.row]
        cell.dateLabel.text = publishedAt[indexPath.row]
        cell.descriptionLabel.text = descriptionNews[indexPath.row]
        cell.titleName.text = titleNews[indexPath.row]
        
        return cell
    }
}

