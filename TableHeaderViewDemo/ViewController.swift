//
//  ViewController.swift
//  TableHeaderViewDemo
//
//  Created by Rachel Bobbins on 6/15/15.
//  Copyright (c) 2015 Rachel Bobbins. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableHeader()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }

    //MARK: UITableViewDataSource

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellIdentifier") as! UITableViewCell
        cell.textLabel?.text = "This is row \(indexPath.row)"
        return cell
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    //MARK: Table Header

    func setupTableHeader() {
        let headerView = UIView()
        headerView.setTranslatesAutoresizingMaskIntoConstraints(false)

        let headerLabel = UILabel()
        headerLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        headerLabel.text = "This is a tableHeaderView"
        headerView.addSubview(headerLabel)


        let vConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|-(0)-[label]-(0)-|", options: nil, metrics: nil, views: ["label": headerLabel])

        let hConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-(0)-[label]-(0)-|", options: nil, metrics: nil, views: ["label": headerLabel])

        headerView.addConstraints(vConstraints)
        headerView.addConstraints(hConstraints)

        tableView.tableHeaderView = headerView
        tableView.tableHeaderView?.setTranslatesAutoresizingMaskIntoConstraints(false)
    }


}

