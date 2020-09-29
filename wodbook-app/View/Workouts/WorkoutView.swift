//
//  WorkoutView.swift
//  wodbook-app
//
//  Created by Egill on 20/07/2020.
//  Copyright © 2020 Egill. All rights reserved.
//

import SwiftlySearch
import SwiftUI
import SwiftyJSON

struct WorkoutView: View {
  @EnvironmentObject private var globalState: GlobalState
  @State private var showModal: Bool = false
  @State private var searchText = ""

  let searchController = UISearchController(searchResultsController: nil)

  func getWorkoutList() {
    WorkoutAPI.findAllWorkouts(nil) { res in
      if let json = res.value {
        let decoder = JSONDecoder()

        do {
          let workoutList = try decoder.decode(WorkoutList.self, from: json.rawData())
          self.globalState.workoutList = workoutList.data
        } catch {
          print(error.localizedDescription)
        }
      }
    }
  }

  var createWorkout: some View {
    Button(action: {
      self.showModal.toggle()
    }, label: {
      Image(systemName: "plus.circle")
        .imageScale(.large)
    })
  }

  var body: some View {
    NavigationView {
      // Add filter to filter only owned movements.
      List {
        ForEach(globalState.workoutList.filter {
          $0.name.lowercased().contains(searchText.lowercased()) || searchText == ""
          }, id: \.self) { workout in
          NavigationLink(destination: WorkoutDetail(workout: workout)) {
            WorkoutRow(workout: workout)
          }
        }
      }
      .navigationBarSearch(self.$searchText)
      .resignKeyboardOnDragGesture()
      .navigationBarTitle(Text("Workouts"))
      .navigationBarItems(trailing: createWorkout)
      .onAppear {
        if self.globalState.accessToken != "" {
          self.getWorkoutList()
        }
      }.sheet(isPresented: $showModal, onDismiss: {
        self.getWorkoutList()
      }, content: {
        CreateWorkout()
        })
    }
  }
}

// move these 3 to separate file
extension UIApplication {
  func endEditing(_ force: Bool) {
    windows
      .filter {
        $0.isKeyWindow
      }
      .first?
      .endEditing(force)
  }
}

struct ResignKeyboardOnDragGesture: ViewModifier {
  var gesture = DragGesture().onChanged { _ in
    UIApplication.shared.endEditing(true)
  }

  func body(content: Content) -> some View {
    content.gesture(gesture)
  }
}

extension View {
  func resignKeyboardOnDragGesture() -> some View {
    return modifier(ResignKeyboardOnDragGesture())
  }
}

struct WorkoutView_Previews: PreviewProvider {
  static var previews: some View {
    WorkoutView().environmentObject(GlobalState())
  }
}
