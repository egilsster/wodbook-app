//
//  NewMovement.swift
//  wodbook-app
//
//  Created by Egill on 06/08/2020.
//  Copyright © 2020 Egill. All rights reserved.
//

import Alamofire
import SwiftUI

class NewMovement: ObservableObject {
  static let measurements = ["Time", "Weight", "Reps", "Height", "None"]

  @Published var name = ""
  @Published var selectedMeasurement = 0

  func getPayload() -> Parameters {
    return
      [
        "name": name,
        "measurement": NewMovement.measurements[selectedMeasurement].camelCaseToSnakeCase(),
      ]
  }
}
