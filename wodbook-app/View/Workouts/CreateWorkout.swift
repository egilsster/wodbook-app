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

  @State private var name: String = ""
  @State private var measurement: String = ""
  @State private var description: String = ""

  var createWorkoutData: Parameters {
    [
      "name": name,
      "measurement": measurement,
      "description": description,
    ]
  }

  var body: some View {
    VStack {
      Text("Create workout")
        .bold()
        .font(.largeTitle)

      TextField("Name", text: $name)
        .textFieldStyle(RoundedBorderTextFieldStyle())
      // Select wheel
      TextField("Measurement", text: $measurement)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .autocapitalization(.none)
      TextField("Description", text: $description)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .lineLimit(nil)
        .fixedSize(horizontal: false, vertical: true)

      HStack {
        Button(action: {
          WorkoutAPI.create(self.createWorkoutData) { res in
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
            Image(systemName: "person.crop.circle.badge.plus")
            Text("Submit")
          }
          .foregroundColor(Color.white)
          .frame(width: 110, height: 32)
          .background(Color.green)
          .cornerRadius(5)
        })
      }
    }
    .padding(48)
  }
}

struct CreateWorkout_Previews: PreviewProvider {
  static var previews: some View {
    LogInView().environmentObject(GlobalState())
  }
}
