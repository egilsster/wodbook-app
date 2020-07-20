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
    HStack {
      Image(systemName: "doc.append")
        .foregroundColor(.red)
        .font(.title)
        .padding(.trailing, 10)
      VStack(alignment: .leading) {
        HStack {
          Text(score.score)
            .bold()
            .lineLimit(1)
        }
        Text(score.rx ? "rx" : "")
          .font(.caption)
          .lineLimit(2)
      }
    }
    .frame(height: 70)
  }
}

struct WorkoutScoreRow_Previews: PreviewProvider {
  static var previews: some View {
    WorkoutScoreRow(score: WorkoutScore(workout_score_id: "2", workout_id: "1", score: "2:11", rx: true, notes: "Notes..", created_at: "2020-04-06T07:00:00.000", updated_at: "2020-04-06T07:00:00.000"))
      .previewLayout(.fixed(width: 300, height: 70))
  }
}
