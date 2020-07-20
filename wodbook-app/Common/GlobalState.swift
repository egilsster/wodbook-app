//
//  GlobalState.swift
//  wodbook-app
//
//  Created by Egill on 20/07/2020.
//  Copyright © 2020 Egill. All rights reserved.
//

import SwiftUI

final class GlobalState: ObservableObject {
  @Published var accessToken: String = UserDefaults.standard.string(forKey: "token") ?? ""
  @Published var workoutList: [Workout] = []
  @Published var movementList: [Movement] = []
  @Published var userData: Account = Account(user_id: "", email: "", password: "", admin: false, first_name: "", last_name: "", date_of_birth: "", height: 0, weight: 0, box_name: "", avatar_url: "")
}
