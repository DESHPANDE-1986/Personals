//
//  DetailViewController.swift
//  Personals
//
//  Created by ABHAY DESHPANDE on 9/2/18.
//  Copyright © 2018 ABHAY DESHPANDE. All rights reserved.
//

import UIKit
import LLSpinner

class PersonalDetailViewController: UITableViewController {
  
  var personal: Personal = .other //open
  
  private var headerImage: UIImage? = UIImage(named: "placeholder") {
    didSet {
      tableView.reloadData()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = personal.title
    downlaodImage()
  }
  
  private func downlaodImage() {
    LLSpinner.spin()

    let urlString: String
    
    switch personal {
    case .computer(let computer):
      urlString = computer.imageInfo.url
    case .cat(let cat):
      urlString = cat.information.imageInfo.url
    case .dog(let dog):
      urlString = dog.information.imageInfo.url
    default:
      urlString = "" // no image provided for car
    }
    // get the image data
    PersonalOperation.getImageData(urlString: urlString, success: { [weak self] data in
      LLSpinner.stop()
      guard let data = data else { return }
      self?.headerImage = UIImage(data: data)
      
    }) { error in
      LLSpinner.stop()
      print(error?.localizedDescription ?? "error occured..")
    }
  }
}


extension PersonalDetailViewController {
  /*
    Customizing the tableView with the static counts and cells, since we know the exact data fields we need.
  */
  
  // MARK: UITableView DataSource
  override func numberOfSections(in tableView: UITableView) -> Int {
    
    switch personal {
    case .computer:
      return 2
    case .cat, .dog:
      return 3
    default:
      return 4
    }
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    if let cell = tableView.dequeueReusableCell(withIdentifier: PersonalTableViewCell.identifier) as? PersonalTableViewCell {
      let info: String
      
      switch personal {
      case .car(let car):
        
        switch indexPath.section {
        case 0:
          
          switch indexPath.row {
          case 0:
            info = "Name: \(car.summary.capitalizedName)"
          case 1:
            info = "Color: \(car.summary.capitalizedColor)"
          case 2:
            info = "Description:\n\n\(car.summary.description)"
          default:
            return cell
          }
          
        case 1:
          info = "Doors: \(car.doors)"
        case 2:
          info = "Price: \(car.price)"
        case 3:
          info = "milage: \(car.milage)"
        default:
          return cell
        }
        
      case .computer(let computer):
        
        
        switch indexPath.section {
        case 0:
          
          switch indexPath.row {
          case 0:
            info = "Name: \(computer.summary.capitalizedName)"
          case 1:
            info = "Color: \(computer.summary.capitalizedColor)"
          case 2:
            info = "Description:\n\n\(computer.summary.description)"
          default:
            return cell
          }
          
        case 1:
          info = "Purchase Date: \(computer.purchaseDate)"
        default:
          return cell
        }
        
      case .cat(let cat):
        
        switch indexPath.section {
        case 0:
          
          switch indexPath.row {
          case 0:
            info = "Name: \(cat.information.summary.name)"
          case 1:
            info = "Color: \(cat.information.summary.capitalizedColor)"
          case 2:
            info = "Description:\n\n\(cat.information.summary.description)"
          default:
            return cell
          }
          
        case 1:
          info = "Age: \(cat.information.age)"
        case 2:
          info = "Favorite Toy: \(cat.information.favoriteToy)"
        default:
          return cell
        }
      case .dog(let dog):
        
        switch indexPath.section {
        case 0:
          
          switch indexPath.row {
          case 0:
            info = "Name: \(dog.information.summary.name)"
          case 1:
            info = "Color: \(dog.information.summary.capitalizedColor)"
          case 2:
            info = "Description:\n\n\(dog.information.summary.description)"
          default:
            return cell
          }
          
        case 1:
          info = "Age: \(dog.information.age)"
        case 2:
          info = "Favorite Toy: \(dog.information.favoriteToy)"
        default:
          return cell
        }
        
      default:
        return cell
      }
      
      cell.configurateTheCell(info)
      
      return cell
    }
    
    return UITableViewCell()
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if section == 0 {
      return 3
    } else {
      return 1
    }
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
  override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    //assuming that there is only one section for now.
    return getImageView(section)
  }
  
  private func getImageView(_ section: Int) -> UIImageView? {
    guard section == 0 else { return nil }
    
    let imageView: UIImageView = UIImageView()
    imageView.clipsToBounds = true
    imageView.contentMode = .scaleAspectFill
    
    imageView.image = headerImage
    return imageView
  }
  
  override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    
    if section == 0 {
      return view.frame.height / 3
    }
    
    return UITableViewAutomaticDimension
    
  }
}
