//
//  MovementAPI.swift
//  wodbook-app
//
//  Created by Egill on 20/07/2020.
//  Copyright © 2020 Egill. All rights reserved.
//

import Alamofire
import Foundation
import SwiftyJSON

struct MovementAPI {
  static func findAllMovements(_ parameters: Parameters?, completion: @escaping (Result<JSON>) -> Void) {
    RequestAPI.call("v1/movements", method: .get, parameters: parameters, completion: completion)
  }

  static func create(_ parameters: Parameters?, completion: @escaping (Result<JSON>) -> Void) {
    RequestAPI.call("v1/movements", method: .post, parameters: parameters, completion: completion)
  }

  static func getMovementScores(_ movementId: String, _ parameters: Parameters?, completion: @escaping (Result<JSON>) -> Void) {
    RequestAPI.call("v1/movements/" + movementId, method: .get, parameters: parameters, completion: completion)
  }
}
