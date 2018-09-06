//
//  ConsumerProduct.swift
//  Personals
//
//  Created by ABHAY DESHPANDE on 9/3/18.
//  Copyright © 2018 ABHAY DESHPANDE. All rights reserved.
//

import Foundation

// hardware and comsumer poducts
struct Car: Decodable {
  let summary: Summary
  let doors: String
  let price: String
  let milage: String
  
  enum CodingKeys: String, CodingKey {
    case summary = "object_summary"
    case doors
    case price
    case milage
  }
}
