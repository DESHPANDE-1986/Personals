//
//  Pet.swift
//  Personals
//
//  Created by ABHAY DESHPANDE on 9/1/18.
//  Copyright © 2018 ABHAY DESHPANDE. All rights reserved.
//

import Foundation

struct Cat: Decodable {
  let information: PetInformation
  init(_ information: PetInformation) {
    self.information = information
  }
}

struct Dog: Decodable {
  let information: PetInformation
  init(_ information: PetInformation) {
    self.information = information
  }
}

struct PetInformation: Decodable {
  let summary: Summary
  let age: String
  let favoriteToy: String
  let imageInfo: ImageInfo
  
  enum CodingKeys: String, CodingKey {
    case summary = "object_summary"
    case age
    case favoriteToy = "favorite_toy"
    case imageInfo = "image"
  }
}
