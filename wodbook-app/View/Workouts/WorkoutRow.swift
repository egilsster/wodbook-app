//
//  WorkoutRow.swift
//  wodbook-app
//
//  Created by Egill on 20/07/2020.
//  Copyright © 2020 Egill. All rights reserved.
//

import SwiftUI

struct WorkoutRow: View {
  var workout: Workout

  var body: some View {
    HStack {
      VStack(alignment: .leading) {
        HStack {
          Text(workout.name)
            .font(.headline)
            .bold()
            .lineLimit(1)
        }
        Text(workout.measurement)
          .font(.subheadline)
          .lineLimit(1)
      }
      Spacer()
      if workout.is_public {
        Image(systemName: "globe").foregroundColor(Color.blue)
      }
    }
    .frame(height: 52)
  }
}

struct WorkoutRow_Previews: PreviewProvider {
  static var previews: some View {
    WorkoutRow(workout: Workout(workout_id: "1", name: "Abbate", measurement: "time", description: "Description...", is_public: true, created_at: "2020-04-06T07:00:00.000", updated_at: "2020-04-06T07:00:00.000"))
      .previewLayout(.fixed(width: 300, height: 70))
  }
}
