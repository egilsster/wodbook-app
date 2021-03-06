//
//  CreateMovement.swift
//  wodbook-app
//
//  Created by Egill on 20/07/2020.
//  Copyright © 2020 Egill. All rights reserved.
//

import Alamofire
import SwiftUI
import SwiftyJSON

struct CreateMovement: View {
  @EnvironmentObject private var globalState: GlobalState
  @Environment(\.presentationMode) private var presentation: Binding<PresentationMode>

  @ObservedObject var movement = NewMovement()

  var disableForm: Bool {
    movement.name.count < 2
  }

  var body: some View {
    NavigationView {
      VStack {
        Form {
          Section {
            TextField("Name", text: $movement.name)

            Picker("Measurement", selection: $movement.selectedMeasurement) {
              ForEach(0 ..< NewMovement.measurements.count, id: \.self) {
                Text(NewMovement.measurements[$0])
              }
            }
          }

          Section {
            HStack {
              Button(action: {
                MovementAPI.create(self.movement.getPayload()) { res in
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
      }.navigationBarTitle(Text("New Movement"), displayMode: .inline).navigationBarItems(leading:
        Button("Cancel") {
          self.presentation.wrappedValue.dismiss()
      })
    }
  }
}

struct CreateMovement_Previews: PreviewProvider {
  static var previews: some View {
    CreateMovement().environmentObject(GlobalState())
  }
}
