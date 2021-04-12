//
//  TableViewController.swift
//  NewsApi
//
//  Created by Andrew Kolisnyk on 12/03/2021.
//

import UIKit
import SDWebImage
import SafariServices
class TableViewController: UITableViewController {
    
    var newsManager = NewsManager()
    var vc = ViewController()
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
        newsManager.onComplition  = { [weak self] news in
            guard let self = self else {return}
            self.updateInterface(news: news)
        }
        newsManager.fetchNews(countryKey: globalKey)
    }
    
    @IBAction func reloadInterface(_ sender: Any) {
        newsManager.fetchNews(countryKey: globalKey)
    }
    func updateInterface(news: News){
        
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
        cell.newsImage.sd_setImage(with: URL(string: urlToImage[indexPath.row]), completed: nil)
        return cell
    }
    /// Opening website  from url array usd indexpath
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let link = url[indexPath.row]
        let vc = SFSafariViewController(url: URL(string:link)!)
        present(vc, animated: true)
    }
}
