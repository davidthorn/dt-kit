//
//  CommonTableViewController.swift
//  DTKit
//
//  Created by Thorn, David on 10.04.20.
//

import UIKit

open class CommonTableViewController<T: Hashable>: CommonViewController<T>, UITableViewDataSource, UITableViewDelegate {

    public let tableView = UITableView()

    override open func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.edgesToSuperview()
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        fatalError("Method must be implemented by extending class")
    }

    public func numberOfSections(in tableView: UITableView) -> Int {
        fatalError("Method must be implemented by extending class")
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fatalError("Method must be implemented by extending class")
    }

}
