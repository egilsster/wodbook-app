//
//  MovementScoreRow.swift
//  wodbook-app
//
//  Created by Egill on 20/07/2020.
//  Copyright © 2020 Egill. All rights reserved.
//

import SwiftUI

struct MovementScoreRow: View {
  var measurement: String
  var score: MovementScore

  var body: some View {
    HStack {
      if measurement == "time" || measurement == "reps" || measurement == "height" {
        VStack(alignment: .leading) {
          Text(score.score).bold()
        }
      } else if measurement == "weight" {
        VStack(alignment: .leading) {
          HStack {
            Text(score.score).bold()
          }
          Text(String(score.reps) + " x " + String(score.sets)).font(.caption)
        }
      }

      Spacer()
      Text(RelativeDate(score.created_at))
    }
    .frame(height: 52)
  }
}

struct MovementScoreRow_Previews: PreviewProvider {
  static var previews: some View {
    MovementScoreRow(measurement: "weight", score: MovementScore(movement_score_id: "2", movement_id: "1", score: "155", reps: 5, sets: 1, notes: "Notes..", created_at: "2020-04-06T07:00:00.000", updated_at: "2020-04-06T07:00:00.000"))
      .previewLayout(.fixed(width: 300, height: 70))
  }
}
