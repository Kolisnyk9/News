//
//  TableViewCell.swift
//  NewsApi
//
//  Created by Andrew Kolisnyk on 13/03/2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var titleName: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageWithUrl: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
