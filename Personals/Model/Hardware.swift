//
//  OtherProducts.swift
//  Personals
//
//  Created by ABHAY DESHPANDE on 9/2/18.
//  Copyright © 2018 ABHAY DESHPANDE. All rights reserved.
//

import Foundation

struct Computer: Decodable {
  let summary: Summary
  let purchaseDate: String
  let imageInfo: ImageInfo
  
  enum CodingKeys: String, CodingKey {
    case summary = "object_summary"
    case purchaseDate = "purchase_date"
    case imageInfo = "image"
  }
}
