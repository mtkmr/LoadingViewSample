//
//  NextTableViewController.swift
//  LoadingViewSample
//
//  Created by Masato Takamura on 2022/03/25.
//

import UIKit

final class NextTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(NextTableViewCell.self, forCellReuseIdentifier: NextTableViewCell.className)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NextTableViewCell.className, for: indexPath) as! NextTableViewCell
        cell.showLoadingView()
        DispatchQueue.main.asyncAfter(deadline: .now() + 8) {
            cell.hideLoadingView()
        }

        return cell
    }

}
