//
//  Owner.swift
//  Personals
//
//  Created by ABHAY DESHPANDE on 9/3/18.
//  Copyright © 2018 ABHAY DESHPANDE. All rights reserved.
//

import Foundation

struct Owner {
  let personalCollections: [PersonalCollection]
}

extension Owner: Decodable {
  
  private enum CodingKeys: String, CodingKey {
    case car
    case computer
    case cat
    case dog
  }
  
  enum OwnerCodingError: Error {
    case decoding(String)
  }
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    
    guard let car = try? values.decode(Car.self, forKey: .car),
      let computer = try? values.decode(Computer.self, forKey: .computer),
      let catInformation = try? values.decode(PetInformation.self, forKey: .cat),
      let dogInformation = try? values.decode(PetInformation.self, forKey: .dog) else {
        throw OwnerCodingError.decoding("Oops! \(dump(values))")
    }
    
    let cat = Cat(catInformation)
    let dog = Dog(dogInformation)
    
    personalCollections = [PersonalCollection(type: .consumerProduct, personals: [.car(car)]),
                           PersonalCollection(type: .hardware, personals: [.computer(computer)]),
                           PersonalCollection(type: .animal, personals: [.cat(cat), .dog(dog)])
    ]
  }
}
