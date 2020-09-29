//
//  CaseChanging.swift
//  wodbook-app
//
//  Created by Egill on 06/08/2020.
//  Copyright © 2020 Egill. All rights reserved.
//

import SwiftUI

extension String {
  func camelCaseToSnakeCase() -> String {
    let acronymPattern = "([A-Z]+)([A-Z][a-z]|[0-9])"
    let normalPattern = "([a-z0-9])([A-Z])"
    return processCamalCaseRegex(pattern: acronymPattern)?
      .processCamalCaseRegex(pattern: normalPattern)?.lowercased() ?? lowercased()
  }

  fileprivate func processCamalCaseRegex(pattern: String) -> String? {
    let regex = try? NSRegularExpression(pattern: pattern, options: [])
    let range = NSRange(location: 0, length: count)
    return regex?.stringByReplacingMatches(in: self, options: [], range: range, withTemplate: "$1_$2")
  }
}
