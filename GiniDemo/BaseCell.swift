//
//  BaseCell.swift
//  GiniDemo
//
//  Created by Tal talspektor on 04/06/2021.
//

import UIKit

class BaseCell: UICollectionViewCell {

    @IBOutlet weak var label: UILabel!

    func configur(color: UIColor, text: String) {
        backgroundColor = color
        label.text = text
    }
}
