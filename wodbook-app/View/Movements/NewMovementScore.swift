//
//  NewMovementScore.swift
//  wodbook-app
//
//  Created by Egill on 15/08/2020.
//  Copyright © 2020 Egill. All rights reserved.
//

import Alamofire
import SwiftUI

class NewMovementScore: ObservableObject {
  @Published var score = ""
  @Published var sets = "1"
  @Published var reps = "1"
  @Published var notes = ""

  func getPayload() -> Parameters {
    return
      [
        "score": score,
        "sets": Int32(sets)!,
        "reps": Int32(reps)!,
        "notes": notes,
      ]
  }
}
