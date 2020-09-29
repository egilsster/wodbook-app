//
//  ScoreInput.swift
//  wodbook-app
//
//  Created by Egill on 15/08/2020.
//  Copyright © 2020 Egill. All rights reserved.
//

import SwiftUI

struct MovementScoreInput: View {
  @State var movement: Movement
  @State var score: NewMovementScore

  var body: some View {
    Section(header: Text("Score")) {
      if movement.measurement == "none" {
        Text("No measurement")
      } else {
        if movement.measurement == "weight" {
          HStack {
            TextField("Weight", text: $score.score).keyboardType(.numberPad)
            Text("kg")

            Spacer()
          }

          HStack {
            TextField("Sets", text: $score.sets).keyboardType(.numberPad)
            Text("Set(s)")
          }
          HStack {
            TextField("Reps", text: $score.reps).keyboardType(.numberPad)
            Text("Rep(s)")
          }
        } else if movement.measurement == "time" {
          HStack {
            TextField("Time", text: $score.score)
            Spacer()
          }
        } else if movement.measurement == "reps" {
          HStack {
            TextField("Reps", text: $score.score).keyboardType(.numberPad)
            Text("times")

            Spacer()
          }
        } else if movement.measurement == "height" {
          TextField("Score", text: $score.score)
          TextField("Sets", text: $score.sets).keyboardType(.numberPad)
          TextField("Repetitions", text: $score.reps).keyboardType(.numberPad)
        }
      }
    }
  }
}

struct CurrencyTextFieldFormatter: TextFieldFormatter {
  typealias Value = Decimal?

  func displayString(for value: Decimal?) -> String {
    guard let value = value else { return "" }
    return NumberFormatter.currency.string(for: value) ?? ""
  }

  func editingString(for value: Decimal?) -> String {
    guard let value = value else { return "" }
    return NumberFormatter.currencyEditing.string(for: value) ?? ""
  }

  func value(from string: String) -> Decimal? {
    let formatter = NumberFormatter.currencyEditing
    let value = formatter.number(from: string)?.decimalValue
    let formattedString = value.map { formatter.string(for: $0) } as? String
    return formattedString.map { formatter.number(from: $0)?.decimalValue } as? Decimal
  }
}

extension NumberFormatter {
  static let currency: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    return formatter
  }()

  static let currencyEditing: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.groupingSeparator = ""
    formatter.minimumFractionDigits = NumberFormatter.currency.minimumFractionDigits
    formatter.maximumFractionDigits = NumberFormatter.currency.maximumFractionDigits
    return formatter
  }()
}

struct ScoreInput_Previews: PreviewProvider {
  static var previews: some View {
    MovementScoreInput(movement: Movement(movement_id: "1", name: "Name", measurement: "weight", is_public: true, created_at: "2020-04-06T07:00:00.000", updated_at: "2020-04-06T07:00:00.000"), score: NewMovementScore())
  }
}
