//
//  RepresentableViewController.swift
//  DTKit
//
//  Created by Thorn, David on 10.04.20.
//

import UIKit

public typealias RepresentableViewModel = RepresentableViewModelProtocol & Hashable

public final class RepresentableViewController<T: RepresentableViewModel>: CommonTableViewController<T> {

    override public func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(DTKitCustomTableviewCell.self,
                           forCellReuseIdentifier: String(describing: DTKitCustomTableviewCell.self))
    }

    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DTKitCustomTableviewCell.self),
                                                       for: indexPath) as? DTKitCustomTableviewCell else {
                                                        fatalError("The DTKitCustomTableviewCell has not been registered")
        }

        if let item = viewModel?.sections[indexPath.section].rows[indexPath.row] {
            item.setup(tableviewCell: cell)
        }

        return cell
    }

    public override func numberOfSections(in tableView: UITableView) -> Int {
        guard let viewModel = viewModel else { return 0 }

        return viewModel.sections.count
    }

    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let representableSection = viewModel?.sections[section] else { return 0 }

        return representableSection.numberOfRowsInSection
    }

    public override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let header = viewModel?.sections[section] as? RepresentableSectionHeaderProtocol else { return nil }

        return header.title
    }

    public override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = viewModel?.sections[section] as? RepresentableSectionHeaderProtocol else { return nil }

        return header.view
    }

    public override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard viewModel?.sections[section] is RepresentableSectionHeaderProtocol else { return 0 }

        return UITableView.automaticDimension
    }

}
