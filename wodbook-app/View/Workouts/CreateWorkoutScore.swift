//
//  CreateWorkoutScore.swift
//  wodbook-app
//
//  Created by Egill on 17/08/2020.
//  Copyright © 2020 Egill. All rights reserved.
//

import Alamofire
import SwiftUI
import SwiftyJSON

struct CreateWorkoutScore: View {
  @EnvironmentObject private var globalState: GlobalState
  @Environment(\.presentationMode) private var presentation: Binding<PresentationMode>

  @ObservedObject var score = NewWorkoutScore()

  @State var workout: Workout

  var disableForm: Bool {
    score.score.count == 0
  }

  var body: some View {
    NavigationView {
      VStack {
        Form {
          WorkoutScoreInput(workout: self.workout, score: self.score)

          Section(header: Text("Notes")) {
            TextField("Notes", text: $score.notes).lineLimit(20)
          }

          Section {
            HStack {
              Button(action: {
                WorkoutAPI.createScore(self.workout.workout_id, self.score.getPayload()) { res in
                  switch res {
                  case .success:
                    // Notify somehow
                    self.presentation.wrappedValue.dismiss()
                  case let .failure(error):
                    print(error)
                  }
                }
              }, label: {
                HStack {
                  Text("Create")
                }
                  })
            }
          }
          .disabled(disableForm)
        }
      }.navigationBarTitle(Text("New Workout Score"), displayMode: .inline).navigationBarItems(leading:
        Button("Cancel") {
          self.presentation.wrappedValue.dismiss()
      })
    }
  }
}

struct CreateWorkoutScore_Previews: PreviewProvider {
  static var previews: some View {
    CreateWorkoutScore(workout: Workout(workout_id: "1", name: "Angie", measurement: "time", description: "Description...", is_public: true, created_at: "2020-04-06T07:00:00.000", updated_at: "2020-04-06T07:00:00.000")).environmentObject(GlobalState())
  }
}
