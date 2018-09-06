//
//  TableViewCell.swift
//  Personals
//
//  Created by ABHAY DESHPANDE on 9/2/18.
//  Copyright © 2018 ABHAY DESHPANDE. All rights reserved.
//

import UIKit

class PersonalTableViewCell: UITableViewCell {
  static let identifier = "PersonalCell"

  @IBOutlet weak var infoLabel: UILabel!
  
  // MARK: Cell Configuration
  func configurateTheCell(_ info: String) {
    self.infoLabel.text = info
  }
}
