//
//  ViewController.swift
//  Personals
//
//  Created by ABHAY DESHPANDE on 9/1/18.
//  Copyright © 2018 ABHAY DESHPANDE. All rights reserved.
//

import UIKit

class PersonalViewController: UITableViewController {

  private let titleText = "Personal"
  private var owner: Owner?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .done, target: self, action: nil)
    title = titleText
    navigationController?.navigationBar.prefersLargeTitles = true
    parseJSON()
  }
  
  private func parseJSON() {
    Parser.parse { [weak self] (result) in
      self?.owner = result
      self?.tableView.reloadData()
    }
  }
}

extension PersonalViewController {
  override func numberOfSections(in tableView: UITableView) -> Int {
    let count = owner?.personalCollections.count ?? 0
    return count
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    let count = owner?.personalCollections[section].personals.count ?? 0
    return count
  }
  
  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    guard let collections = owner?.personalCollections else {
      return nil
    }
    
    return collections[section].type.title
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: PersonalTableViewCell.identifier, for: indexPath) as? PersonalTableViewCell, let personals = owner?.personalCollections[indexPath.section].personals else {
      return UITableViewCell()
    }
    
    cell.configurateTheCell(personals[indexPath.row].title)
    return cell
  }
}

extension PersonalViewController {
  
  // MARK: Segue Method
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "PersonalDetail",
      let indexPath = self.tableView?.indexPathForSelectedRow,
      let destinationViewController: PersonalDetailViewController = segue.destination as? PersonalDetailViewController {
      guard let personals = owner?.personalCollections[indexPath.section].personals else { return }
      
      let personal = personals[indexPath.row]
      destinationViewController.personal = personal
    }
  }
}

