//
//  NewWorkout.swift
//  wodbook-app
//
//  Created by Egill on 06/08/2020.
//  Copyright © 2020 Egill. All rights reserved.
//

import Alamofire
import SwiftUI

class NewWorkout: ObservableObject {
  static let measurements = ["Time", "Distance", "Load", "Repetitions", "Rounds", "TimedRounds", "Tabata", "Total", "Unknown", "None"]

  @Published var name = ""
  @Published var description = ""
  @Published var selectedMeasurement = 0

  func getPayload() -> Parameters {
    return
      [
        "name": name,
        "measurement": NewWorkout.measurements[selectedMeasurement].camelCaseToSnakeCase(),
        "description": description,
      ]
  }
}
