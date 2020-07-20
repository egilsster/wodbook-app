//
//  DateToFormat.swift
//  wodbook-app
//
//  Created by Egill on 20/07/2020.
//  Copyright © 2020 Egill. All rights reserved.
//

import Foundation

func DateToFormat(_ value: String) -> String {
  print(value)
  let dateFormatter = DateFormatter()
  dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"

  let resultFormatter = DateFormatter()
  resultFormatter.dateFormat = "MMM dd, yyyy"

  if let date = dateFormatter.date(from: value) {
    return resultFormatter.string(from: date)
  } else {
    return value
  }
}
