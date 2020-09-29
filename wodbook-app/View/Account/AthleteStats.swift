//
//  AthleteStats.swift
//  wodbook-app
//
//  Created by Egill on 18/08/2020.
//  Copyright © 2020 Egill. All rights reserved.
//

import SwiftUI

struct AthleteStats: View {
  @State var athlete: Account

  var body: some View {
    HStack(alignment: .center) {
      VStack(alignment: .center, spacing: 2) {
        Text("height").font(.caption).italic().foregroundColor(Color.secondary)
        Text(String(self.athlete.height) + "cm").font(.body)
      }

      Spacer()

      VStack(alignment: .center, spacing: 2) {
        Text("weight").font(.caption).italic().foregroundColor(Color.secondary)
        Text(String(self.athlete.weight / 1000) + "kg").font(.body)
      }
      Spacer()

      VStack(alignment: .center, spacing: 2) {
        Text("age").font(.caption).italic().foregroundColor(Color.secondary)
        Text(String(getAge(date_string: self.athlete.date_of_birth))).font(.body)
      }
    }
    .padding(.leading, 25).padding(.trailing, 25)
  }
}

struct AthleteStats_Previews: PreviewProvider {
  static var previews: some View {
    AthleteStats(athlete: Account(user_id: "1", email: "test@wodbook.club", password: "pass", admin: false, first_name: "Egill", last_name: "Sveinbjörnsson", date_of_birth: "1991-12-06", height: 189, weight: 85000, box_name: "none", avatar_url: ""))
  }
}
