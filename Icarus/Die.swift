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

    guard numberOfSides % 2 == 0 else {
      print("Odd sided die")
      return nil
    }

    print("Created die with \(numberOfSides) number of sides")
    self.numberOfSides = numberOfSides
  }

  /// Returns a number between 1 and the number of sides, inclusive.
  /// For example, a 6 sided die could return the numbers 1, 2, 3, 4, 5 and 6
  public func roll() -> NSInteger {
    return Int.random(in: 1...numberOfSides)
  }
}
