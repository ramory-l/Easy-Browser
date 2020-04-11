//
//  TableViewController.swift
//  Project4
//
//  Created by Mikhail Strizhenov on 11.04.2020.
//  Copyright © 2020 Mikhail Strizhenov. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var allowedWebSites = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Allowed Websites"
        navigationController?.navigationBar.prefersLargeTitles = true
        allowedWebSites = ["hackingwithswift.com", "apple.ru"]
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return allowedWebSites.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Website", for: indexPath)
        cell.textLabel?.text = allowedWebSites[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "Browser") as? ViewController {
            vc.websites = allowedWebSites
            vc.startWebsite = indexPath.row
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
