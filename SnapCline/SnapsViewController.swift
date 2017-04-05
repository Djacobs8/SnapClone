//
//  SnapsViewController.swift
//  SnapCline
//
//  Created by Derek Jacobs on 2017-04-05.
//  Copyright © 2017 Derek Jacobs. All rights reserved.
//

import UIKit

class SnapsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func logoutTapped(_ sender: Any) {
        
        dismiss(animated: true, completion: nil) //allows for a logout
        
    }


}
