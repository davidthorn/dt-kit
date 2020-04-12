//
//  DTKitCustomTableviewCell.swift
//  DTKit
//
//  Created by Thorn, David on 10.04.20.
//

import UIKit

public final class DTKitCustomTableviewCell: UITableViewCell {

    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
