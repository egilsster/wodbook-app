//
//  AccountAPI.swift
//  wodbook-app
//
//  Created by Egill on 20/07/2020.
//  Copyright © 2020 Egill. All rights reserved.
//

import Alamofire
import Foundation
import SwiftyJSON

struct AccountAPI {
  static func login(_ parameters: Parameters?, completion: @escaping (Result<JSON>) -> Void) {
    RequestAPI.call("v1/users/login", method: .post, parameters: parameters) { res in
      switch res {
      case .success:
        if let json = res.value {
          UserDefaults.standard.set(json["token"].string, forKey: "token")
          completion(.success(json))
        }
      case let .failure(error):
        completion(.failure(error))
      }
    }
  }

  static func signup(_ parameters: Parameters?, completion: @escaping (Result<JSON>) -> Void) {
    RequestAPI.call("v1/users/register", method: .post, parameters: parameters) { res in
      switch res {
      case .success:
        if let json = res.value {
          UserDefaults.standard.set(json["token"].string, forKey: "token")
          completion(.success(json))
        }
      case let .failure(error):
        completion(.failure(error))
      }
    }
  }

  static func info(_ parameters: Parameters?, completion: @escaping (Result<JSON>) -> Void) {
    RequestAPI.call("v1/users/me", method: .get, parameters: parameters, completion: completion)
  }

  static func updateInfo(_ parameters: Parameters?, completion: @escaping (Result<JSON>) -> Void) {
    RequestAPI.call("v1/users/me", method: .patch, parameters: parameters, completion: completion)
  }
}
