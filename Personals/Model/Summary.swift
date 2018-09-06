//
//  Summary.swift
//  Personals
//
//  Created by ABHAY DESHPANDE on 9/1/18.
//  Copyright © 2018 ABHAY DESHPANDE. All rights reserved.
//

import Foundation

struct Summary: Decodable {
  let type: String
  let name: String
  let color: String
  let description: String
}

extension Summary {
  
  var capitalizedName: String {
    return name.capitalized
  }
  
  var capitalizedColor: String {
    return color.capitalized
  }
}
