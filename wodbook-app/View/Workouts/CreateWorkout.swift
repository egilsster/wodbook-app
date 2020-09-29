//
//  CreateWorkout.swift
//  wodbook-app
//
//  Created by Egill on 20/07/2020.
//  Copyright © 2020 Egill. All rights reserved.
//

import Alamofire
import SwiftUI
import SwiftyJSON

struct CreateWorkout: View {
  @EnvironmentObject private var globalState: GlobalState
  @Environment(\.presentationMode) private var presentation: Binding<PresentationMode>

  @ObservedObject var workout = NewWorkout()

  var disableForm: Bool {
    workout.name.count < 2 || workout.description.count < 5
  }

  var body: some View {
    NavigationView {
      VStack {
        Form {
          Section {
            TextField("Name", text: $workout.name)

            Picker("Measurement", selection: $workout.selectedMeasurement) {
              ForEach(0 ..< NewWorkout.measurements.count, id: \.self) {
                Text(NewWorkout.measurements[$0])
              }
            }

            TextField("Description", text: $workout.description)
              .lineLimit(30)
              .fixedSize(horizontal: true, vertical: true)
          }

          Section {
            HStack {
              Button(action: {
                WorkoutAPI.create(self.workout.getPayload()) { res in
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
      }.navigationBarTitle(Text("New Workout"), displayMode: .inline).navigationBarItems(leading:
        Button("Cancel") {
          self.presentation.wrappedValue.dismiss()
      })
    }
  }
}

struct CreateWorkout_Previews: PreviewProvider {
  static var previews: some View {
    CreateWorkout().environmentObject(GlobalState())
  }
}
