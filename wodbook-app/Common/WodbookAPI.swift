//
//  WodbookAPI.swift
//  wodbook-app
//
//  Created by Egill on 20/07/2020.
//  Copyright © 2020 Egill. All rights reserved.
//

import Alamofire
import Foundation
import SwiftyJSON

struct RequestAPI {
  static func call(_ path: String, method: HTTPMethod, parameters: Parameters?, completion: @escaping (Result<JSON>) -> Void) {
    let baseURL = URL(string: Constants.API_URL)
    let url = baseURL!.appendingPathComponent(path)
    let accessToken = UserDefaults.standard.string(forKey: "token") ?? ""
    let headers: HTTPHeaders = ["Authorization": "Bearer \(accessToken)"]

    Alamofire.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { res in
      switch res.result {
      case .success:
        if let value = res.result.value {
          let json = JSON(value)
          completion(.success(json))
        }
      case let .failure(error):
        print(error.localizedDescription)
        completion(.failure(error))
      }
    }
  }
}
