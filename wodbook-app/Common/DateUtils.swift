//
//  DateUtils.swift
//  wodbook-app
//
//  Created by Egill on 20/07/2020.
//  Copyright © 2020 Egill. All rights reserved.
//

import Foundation
import SwiftDate

func RelativeDate(_ value: String) -> String {
  return value.toDate()!.toFormat("MMM dd, yyyy")
}

func getAge(date_string: String) -> String {
  if date_string == "" {
    return "0"
  }

  let date = date_string.toDate()!.date
  let age = Calendar.current.dateComponents([.year], from: date, to: Date()).year!
  return String(age)
}
