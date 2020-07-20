//
//  MovementScoreRow.swift
//  wodbook-app
//
//  Created by Egill on 20/07/2020.
//  Copyright © 2020 Egill. All rights reserved.
//

import SwiftUI

struct MovementScoreRow: View {
  var score: MovementScore

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
        Text(String(score.reps) + " x " + String(score.sets))
          .font(.caption)
          .lineLimit(2)
      }
    }
    .frame(height: 70)
  }
}

struct MovementScoreRow_Previews: PreviewProvider {
  static var previews: some View {
    MovementScoreRow(score: MovementScore(movement_score_id: "2", movement_id: "1", score: "155", reps: 5, sets: 1, distance: "", notes: "Notes..", created_at: "2020-04-06T07:00:00.000", updated_at: "2020-04-06T07:00:00.000"))
      .previewLayout(.fixed(width: 300, height: 70))
  }
}
