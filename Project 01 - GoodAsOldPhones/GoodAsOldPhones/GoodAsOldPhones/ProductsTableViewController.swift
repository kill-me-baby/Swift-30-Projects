//
//  ProductsTableViewController.swift
//  GoodAsOldPhones
//
//  Created by Uladzislau Volchyk on 7/2/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

import UIKit

class ProductsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Product.kMocupData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.imageView?.image = UIImage(named: Product.kMocupData[indexPath.row].cellImageName)
        cell.textLabel?.text = Product.kMocupData[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.navigationController?.pushViewController(ProductViewController(product: Product.kMocupData[indexPath.row]), animated: true)
    }
}
