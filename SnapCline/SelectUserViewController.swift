//
//  SelectUserViewController.swift
//  SnapCline
//
//  Created by Derek Jacobs on 2017-04-11.
//  Copyright © 2017 Derek Jacobs. All rights reserved.
//

import UIKit

class SelectUserViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self

        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // usual suspects - number of rows in section
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        // what is in each cell duhh
        return cell
    }

}
