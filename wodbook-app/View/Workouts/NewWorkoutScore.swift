//
//  NewWorkoutScore.swift
//  wodbook-app
//
//  Created by Egill on 17/08/2020.
//  Copyright © 2020 Egill. All rights reserved.
//

import Alamofire
import SwiftUI

class NewWorkoutScore: ObservableObject {
  @Published var score = ""
  @Published var rx = false
  @Published var notes = ""

  func getPayload() -> Parameters {
    return
      [
        "score": score,
        "rx": rx,
        "notes": notes,
      ]
  }
}
