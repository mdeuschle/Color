//
//  ViewController.swift
//  Color
//
//  Created by Matt Deuschle on 4/25/18.
//  Copyright © 2018 Matt Deuschle. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    private var colors = [Color]()

    override func viewDidLoad() {
        super.viewDidLoad()
        WebService.shared.download { success, json in
            DispatchQueue.main.async {
                guard let json = json else { return }
                self.colors = json
                self.colors.sort { $0.rank < $1.rank }
                self.tableView.reloadData()
            }
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "ColorCell")
        let color = colors[indexPath.row]
        cell.textLabel?.text = color.title
        cell.detailTextLabel?.text = "RANK: \(color.rank)"
        let backgroundColor = UIColor(red: color.rgb.red / 255,
                                      green: color.rgb.green / 255,
                                      blue: color.rgb.blue / 255,
                                      alpha: 1.0)
        cell.backgroundColor = backgroundColor
        return cell
    }
}

