//
//  PersonalsTests.swift
//  PersonalsTests
//
//  Created by ABHAY DESHPANDE on 9/1/18.
//  Copyright © 2018 ABHAY DESHPANDE. All rights reserved.
//

import XCTest
@testable import Personals

class PersonalsTests: XCTestCase {
  let urlString = "https://seniorsnoworlando.org/wp-content/uploads/2014/05/IMG_0009-1038x576.jpg"
  func testPersonalInformation() {
    var ownerResult: Owner?
    
    // Create an expectation
    let expectation = self.expectation(description: "fetchSchoolData")
    Parser.parse { owner in
      ownerResult = owner
      XCTAssertNotNil(ownerResult)
      XCTAssertTrue(ownerResult?.personalCollections.count ?? 0 > 0, "owner should have personal collections")
      XCTAssertTrue(ownerResult?.personalCollections.first?.type.title != "", "PersonalType should have title")
      let consumerProductType = ownerResult?.personalCollections.first?.type
      let hardwareType = ownerResult?.personalCollections[1].type
      let animalType = ownerResult?.personalCollections[2].type
    
      //personalType +
      XCTAssertTrue(consumerProductType == .consumerProduct  , "PersonalCollection should have personal information")
      XCTAssertTrue(hardwareType == .hardware  , "PersonalCollection should have personal information")
      XCTAssertTrue(animalType == .animal  , "PersonalCollection should have personal information")

      //personalType -
      XCTAssertFalse(consumerProductType == .hardware  , "PersonalCollection should have personal information")
      XCTAssertFalse(hardwareType == .animal  , "PersonalCollection should have personal information")
      XCTAssertFalse(animalType == .consumerProduct  , "PersonalCollection should have personal information")

      
      let personals = ownerResult?.personalCollections.first?.personals
      XCTAssertTrue(personals!.count > 0, "PersonalCollection should have personal information")
      
      //car
      let carInformation = personals![0]
      
      switch carInformation {
      case .car(let car):
        XCTAssertNotNil(car)
        XCTAssertNotNil(car.doors)
        XCTAssertNotNil(car.milage)
        XCTAssertNotNil(car.price)
        XCTAssertNotNil(car.summary)
        XCTAssertTrue(car.doors == "2")
      default:
        XCTFail()
      }
      
      
      let personals1 = ownerResult?.personalCollections[1].personals
      XCTAssertTrue(personals1!.count > 0, "PersonalCollection should have personal information")

      //computer
      let computerInformation = personals1![0]
      
      switch computerInformation {
      case .computer(let computer):
        XCTAssertNotNil(computer)
        XCTAssertNotNil(computer.purchaseDate)
        XCTAssertNotNil(computer.imageInfo)
        XCTAssertNotNil(computer.summary)
      default:
        XCTFail()
      }
      
      let personals2 = ownerResult?.personalCollections[2].personals
      XCTAssertTrue(personals2!.count > 0, "PersonalCollection should have personal information")

      //cat
      let catInformation = personals2![0]

      switch catInformation {
      case .cat(let cat):
        XCTAssertNotNil(cat)
        XCTAssertNotNil(cat.information)
        XCTAssertNotNil(cat.information.age)
        XCTAssertNotNil(cat.information.favoriteToy)
        XCTAssertNotNil(cat.information.imageInfo)
        XCTAssertNotNil(cat.information.summary)
      default:
        XCTFail()
      }
      
      //dog
      let dogInformation = personals2![1]

      switch dogInformation {
      case .dog(let dog):
        XCTAssertNotNil(dog)
        XCTAssertNotNil(dog.information)
        XCTAssertNotNil(dog.information.age)
        XCTAssertNotNil(dog.information.favoriteToy)
        XCTAssertNotNil(dog.information.imageInfo)
        XCTAssertNotNil(dog.information.summary)
      default:
        XCTFail()
      }
      
      expectation.fulfill()
    }
    
    waitForExpectations(timeout: 3, handler: nil)
    XCTAssertNotNil(ownerResult)
    
  }
  
  func testGetImgeData() {
    var qResult: Data?
    
    // Create an expectation
    let expectation = self.expectation(description: "fetchSchoolData")
    PersonalOperation.getImageData(urlString: urlString, success: { data in
      qResult = data
      XCTAssertNotNil(qResult)
      expectation.fulfill()
    }) { _ in
      XCTFail()
    }
    
    waitForExpectations(timeout: 20, handler: nil)
    XCTAssertNotNil(qResult)
  }
}
