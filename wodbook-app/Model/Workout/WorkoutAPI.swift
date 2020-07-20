//
//  WorkoutAPI.swift
//  wodbook-app
//
//  Created by Egill on 20/07/2020.
//  Copyright © 2020 Egill. All rights reserved.
//

import Alamofire
import Foundation
import SwiftyJSON

struct WorkoutAPI {
  static func findAllWorkouts(_ parameters: Parameters?, completion: @escaping (Result<JSON>) -> Void) {
    RequestAPI.call("v1/workouts", method: .get, parameters: parameters, completion: completion)
  }

  static func create(_ parameters: Parameters?, completion: @escaping (Result<JSON>) -> Void) {
    RequestAPI.call("v1/workouts", method: .post, parameters: parameters, completion: completion)
  }

  static func getWorkoutScores(_ workoutId: String, _ parameters: Parameters?, completion: @escaping (Result<JSON>) -> Void) {
    RequestAPI.call("v1/workouts/" + workoutId, method: .get, parameters: parameters, completion: completion)
  }
}
