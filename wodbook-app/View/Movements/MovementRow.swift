//
//  MovementRow.swift
//  wodbook-app
//
//  Created by Egill on 20/07/2020.
//  Copyright © 2020 Egill. All rights reserved.
//

import SwiftUI

struct MovementRow: View {
  var movement: Movement

  var body: some View {
    HStack {
      VStack(alignment: .leading) {
        HStack {
          Text(movement.name)
            .font(.headline)
            .bold()
            .lineLimit(1)
        }
        Text(movement.measurement)
          .font(.subheadline)
          .lineLimit(1)
      }
      Spacer()
      if movement.is_public {
        Image(systemName: "globe").foregroundColor(Color.blue)
      }
    }
    .frame(height: 52)
  }
}

struct MovementRow_Previews: PreviewProvider {
  static var previews: some View {
    MovementRow(movement: Movement(movement_id: "1", name: "Name", measurement: "weight", is_public: true, created_at: "2020-04-06T07:00:00.000", updated_at: "2020-04-06T07:00:00.000"))
      .previewLayout(.fixed(width: 300, height: 70))
  }
}
