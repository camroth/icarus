//
//  Die.swift
//  Icarus
//
//  Created by Cameron Roth on 8/10/20.
//  Copyright © 2020 Cameron Roth. All rights reserved.
//

import Foundation

/// A die to be rolled that will return a random number between 1 and the number of sides
public final class Die {

  /// The number of sides the die can have.
  public let numberOfSides: NSInteger

  /// Die() = Die(numberOfSides: 6) = 6 sided die
  init?(numberOfSides: NSInteger = 6) {
    guard numberOfSides > 0 else {
      print("Fuck no, try again")
      return nil
    }

    self.numberOfSides = numberOfSides
  }
}
