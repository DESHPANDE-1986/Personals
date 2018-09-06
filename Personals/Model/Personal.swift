
//
//  Car.swift
//  Personals
//
//  Created by ABHAY DESHPANDE on 9/1/18.
//  Copyright © 2018 ABHAY DESHPANDE. All rights reserved.
//

import Foundation

enum Personal {
  case car(Car)
  case computer(Computer)
  case cat(Cat)
  case dog(Dog)
  case other
  
  var title: String {
    switch self {
    case .car:
      return "Car"
    case .computer:
      return "Computer"
    case .cat:
      return "Cat"
    case .dog:
      return "Dog"
    default:
      return "other"
    }
  }
}

enum PersonalType: String {
  case consumerProduct
  case hardware
  case animal
  
  var title: String {
    switch self {
    case .consumerProduct:
      return "Consumer Product"
    case .hardware:
      return "Hardware"
    case .animal:
      return "Animal"
    }
  }
}

struct PersonalCollection {
  let type: PersonalType
  let personals: [Personal]
}
