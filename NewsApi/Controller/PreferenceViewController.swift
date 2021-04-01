//
//  PreferenceViewController.swift
//  NewsApi
//
//  Created by Andrew Kolisnyk on 20/03/2021.
//

import UIKit
import DropDown
class PreferenceViewController: UIViewController {
    var nw = NewsManager()
    let dropDown = DropDown()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func countrySelect(_ sender: UIButton) {
        dropDown.dataSource = ["Arab Emirates", "Argentina", "Austria", "Australia", "Belgium", "Bulgaria", "Brazil", "Canada", "Switzerland", "China", "Colombia", "Cuba", "Czechia", "Germany", "Egypt", "France", "United Kingdom", "Greece", "Hong Kong", "Hungary", "Indonesia", "Ireland", "Israel", "India", "Italy", "Japan", "South Korea", "Lithuania", "Latvia","Morocco",
            "Mexico" , "Nigeria", "Netherlands", "Norway", "New Zealand", "Philippines", "Poland", "Portugal", "Romania", "Serbia", "Russia", "South Africa", "Sweden", "Singapore", "Slovenia", "Slovakia", "Thailand", "Turkey", "Taiwan", "Ukraine", "USA", "Venezuela"]//4
  
            
            dropDown.anchorView = sender //5
            dropDown.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height) //6
            dropDown.show() //7
            dropDown.selectionAction = { [weak self] (index: Int, item: String) in //8
              guard let self = self else { return }
              sender.setTitle(item, for: .normal) //9
                self.nw.getUrlCountry(country: item)
            }
    }
    @IBAction func sourceSelect(_ sender: UIButton) {
        dropDown.dataSource = [""]
            dropDown.anchorView = sender //5
            dropDown.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height) //6
            dropDown.show() //7
            dropDown.selectionAction = { [weak self] (index: Int, item: String) in //8
              guard let _ = self else { return }
              sender.setTitle(item, for: .normal) //9
            }
    }
    @IBAction func categorySelect(_ sender: UIButton) {
        dropDown.dataSource = ["Business","Entertainment", "General", "Health", "Science", "Sports" ,"Technology"]//4
  

            dropDown.anchorView = sender //5
            dropDown.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height) //6
            dropDown.show() //7
            dropDown.selectionAction = { [weak self] (index: Int, item: String) in //8
              guard let _ = self else { return }
              sender.setTitle(item, for: .normal) //9
            }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
