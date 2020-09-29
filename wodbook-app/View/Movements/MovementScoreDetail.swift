//
//  MovementScoreDetail.swift
//  wodbook-app
//
//  Created by Egill on 20/07/2020.
//  Copyright © 2020 Egill. All rights reserved.
//

import SwiftUI

struct MovementScoreDetail: View {
  @EnvironmentObject private var globalState: GlobalState
  var movement: Movement
  var score: MovementScore

  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        Text(movement.name).bold()
        Text(movement.measurement).italic()
      }

      Divider()

      Text(score.score)
      Text(String(score.reps) + " x " + String(score.sets))

      Spacer()

      Text(score.notes)
    }
    .navigationBarTitle(Text("Score"))
    .padding()
  }
}

struct MovementScoreDetail_Previews: PreviewProvider {
  static var previews: some View {
    MovementScoreDetail(movement: Movement(movement_id: "1", name: "Bench Press", measurement: "weight", is_public: true, created_at: "2020-04-06T07:00:00.000", updated_at: "2020-04-06T07:00:00.000"), score: MovementScore(movement_score_id: "2", movement_id: "1", score: "155", reps: 5, sets: 1, notes: "Notes..", created_at: "2020-04-06T07:00:00.000", updated_at: "2020-04-06T07:00:00.000"))
      .environmentObject(GlobalState())
  }
}
