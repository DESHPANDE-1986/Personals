//
//  PersonalOperation.swift
//  Personals
//
//  Created by ABHAY DESHPANDE on 9/2/18.
//  Copyright © 2018 ABHAY DESHPANDE. All rights reserved.
//

import Foundation

// perse the local json
class Parser {
  static func parse(completion: (Owner?) -> Void) {
    
    guard let url = Bundle.main.url(forResource: "data", withExtension: "json") else {
      return completion(nil)
    }
    
    do {
      let data = try Data(contentsOf: url)
      let decoder = JSONDecoder()
      let personal = try decoder.decode(Owner.self, from: data)
      return completion(personal)
    } catch {
      print("error:\(error)")
      completion(nil)
    }
  }
}

class PersonalOperation {
  
  static func getImageData(urlString: String, success:@escaping (Data?) -> Void, failure:@escaping (Error?)->Void) {
    
    guard let url = URL(string: urlString) else {
      failure(nil)
      return
    }
    
    let urlRequest = URLRequest(url: url)
    let session = URLSession.shared
    
    let task = session.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
      
      // make sure we get the data
      guard let responseData = data else {
        DispatchQueue.main.async {
          failure(error)
        }
        return
      }
      
      DispatchQueue.main.async {
        success(responseData)
      }
    })
    task.resume()
  }
}
