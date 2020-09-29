//
//  WorkoutScoreRow.swift
//  wodbook-app
//
//  Created by Egill on 20/07/2020.
//  Copyright © 2020 Egill. All rights reserved.
//

import SwiftUI

struct WorkoutScoreRow: View {
  var score: WorkoutScore

  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        Text(score.score).bold()
        Text("(" + (score.rx ? "Rx" : "Scaled") + ")")

        Spacer()

        Text(RelativeDate(score.created_at))
      }
    }
    .frame(height: 52)
  }
}

struct WorkoutScoreRow_Previews: PreviewProvider {
  static var previews: some View {
    WorkoutScoreRow(score: WorkoutScore(workout_score_id: "2", workout_id: "1", score: "2:11", rx: true, notes: "Notes..", created_at: "2020-04-06T07:00:00.000", updated_at: "2020-04-06T07:00:00.000"))
      .previewLayout(.fixed(width: 300, height: 70))
  }
}
