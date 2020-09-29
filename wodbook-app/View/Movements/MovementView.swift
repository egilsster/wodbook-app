//
//  MovementView.swift
//  wodbook-app
//
//  Created by Egill on 20/07/2020.
//  Copyright © 2020 Egill. All rights reserved.
//

import SwiftlySearch
import SwiftUI
import SwiftyJSON

struct MovementView: View {
  @EnvironmentObject private var globalState: GlobalState
  @State private var showModal: Bool = false
  @State private var searchText = ""
  @State private var showCancelButton: Bool = false

  func getMovementList() {
    MovementAPI.findAllMovements(nil) { res in
      if let json = res.value {
        let decoder = JSONDecoder()

        do {
          let movementList = try decoder.decode(MovementList.self, from: json.rawData())
          self.globalState.movementList = movementList.data
        } catch {
          print(error.localizedDescription)
        }
      }
    }
  }

  var createMovement: some View {
    Button(action: {
      self.showModal.toggle()
    }, label: {
      Image(systemName: "plus.circle")
        .imageScale(.large)
    })
  }

  var body: some View {
    NavigationView {
      // Add filter to filter only owned movements
      List {
        ForEach(globalState.movementList.filter {
          $0.name.lowercased().contains(searchText.lowercased()) || searchText == ""
          }, id: \.self) { movement in
          NavigationLink(destination: MovementDetail(movement: movement)) {
            MovementRow(movement: movement)
          }
        }
      }
      .navigationBarSearch(self.$searchText)
      .resignKeyboardOnDragGesture()
      .navigationBarTitle(Text("Movements"))
      .navigationBarItems(trailing: createMovement)
      .onAppear {
        if self.globalState.accessToken != "" {
          self.getMovementList()
        }
        // else navigate to login view
      }.sheet(isPresented: $showModal, onDismiss: {
        self.getMovementList()
      }, content: {
        CreateMovement()
        })
    }
  }
}

struct MovementView_Previews: PreviewProvider {
  static var previews: some View {
    MovementView().environmentObject(GlobalState())
  }
}
