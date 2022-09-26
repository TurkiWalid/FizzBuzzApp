//
//  BasicResultViewController.swift
//  FizzBuzzApp
//
//  Created by Walid on 26/9/2022.
//

import UIKit

class BasicResultViewController: UIViewController, Storyboarded {
    static var storyboardName: String {
        return "BasicInput"
    }

    var coordinator: BasicInputCoordinator?
    var vm: OutputProtocol?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Result"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.dataSource = vm
    }

}
