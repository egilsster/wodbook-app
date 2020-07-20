//
//  WorkoutDetail.swift
//  wodbook-app
//
//  Created by Egill on 20/07/2020.
//  Copyright © 2020 Egill. All rights reserved.
//

import SwiftUI

struct WorkoutDetail: View {
  @EnvironmentObject private var globalState: GlobalState
  @State var workout: Workout
  @State private var scores: [WorkoutScore] = []

  func getWorkoutScores() {
    WorkoutAPI.getWorkoutScores(workout.workout_id, nil) { res in
      if let json = res.value {
        let decoder = JSONDecoder()

        do {
          let details = try decoder.decode(WorkoutDetails.self, from: json.rawData())
          self.scores = details.scores
        } catch {
          print(error.localizedDescription)
        }
      }
    }
  }

  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        Image(systemName: "doc.append")
          .foregroundColor(.red)
          .font(.title)
          .padding(.trailing, 10)
        Text(workout.name)
          .bold()
        Text(workout.measurement)
          .italic()
      }
      Divider()
      Text(workout.description)
      Spacer()

      if self.scores.count > 0 {
        HStack {
          List {
            ForEach(self.scores, id: \.self) { score in
              NavigationLink(destination: WorkoutScoreDetail(workout: self.workout, score: score)) {
                WorkoutScoreRow(score: score)
              }
            }
          }
        }
      } else {
        Text("No scores yet..").italic()
      }
    }.onAppear {
      if self.globalState.accessToken != "" {
        self.getWorkoutScores()
      }
    }
    .navigationBarTitle(Text("Details"))
    .padding()
  }
}

struct WorkoutDetail_Previews: PreviewProvider {
  static var previews: some View {
    WorkoutDetail(workout: Workout(workout_id: "1", name: "Angie", measurement: "time", description: "Description...", created_at: "2020-04-06T07:00:00.000", updated_at: "2020-04-06T07:00:00.000"))
      .environmentObject(GlobalState())
  }
}
